import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/theme/theme_controller.dart';
import 'package:rawrecruit/src/features/profile/presentation/resume_view_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/index.dart';
import '../../../core/index.dart';
import '../../../core/models/experience.dart';
import 'view_model/profile_detail_view_model.dart';

class ProfileDetailView extends StatefulWidget {
  final String userId;

  const ProfileDetailView({super.key, required this.userId});

  @override
  State<ProfileDetailView> createState() => _ProfileDetailViewState();
}

class _ProfileDetailViewState extends State<ProfileDetailView> {
  Map<String, dynamic>? calculateNoticePeriodStatus(
    String? startDateStr,
    String? totalDaysStr,
  ) {
    if (startDateStr == null ||
        startDateStr.isEmpty ||
        totalDaysStr == null ||
        totalDaysStr.isEmpty) {
      return null;
    }

    try {
      final totalDays = int.tryParse(totalDaysStr) ?? 0;

      if (totalDays <= 0) {
        return null;
      }

      final startDate = DateTime.parse(startDateStr);
      final now = DateTime.now();
      final start = DateTime(startDate.year, startDate.month, startDate.day);
      final today = DateTime(now.year, now.month, now.day);

      int daysPassed = today.difference(start).inDays;

      if (daysPassed < 0) {
        daysPassed = 0;
      }

      int daysRemaining = totalDays - daysPassed;

      if (daysRemaining < 0) {
        daysRemaining = 0;
      }

      final endDate = start.add(Duration(days: totalDays));
      final progress = (daysPassed / totalDays).clamp(0.0, 1.0);

      return {
        "daysPassed": daysPassed,
        "daysRemaining": daysRemaining,
        "totalDays": totalDays,
        "progress": progress,
        "isExpired": daysPassed >= totalDays,
        "endDate":
            "${endDate.day.toString().padLeft(2, '0')}/"
            "${endDate.month.toString().padLeft(2, '0')}/"
            "${endDate.year}",
      };
    } catch (e) {
      return null;
    }
  }

  Future<void> openUrl(String url) async {
    try {
      String normalizedUrl = url.trim();

      if (!normalizedUrl.startsWith(RegExp(r'https?://'))) {
        normalizedUrl = 'https://$normalizedUrl';
      }

      final uri = Uri.parse(normalizedUrl);

      final launched = await launchUrl(uri, mode: LaunchMode.platformDefault);

      debugPrint('Launch result: $launched');
    } catch (e) {
      debugPrint('Launch error: $e');
    }
  }

  final vm = ProfileDetailViewModel();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      vm.fetchProfile(widget.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: vm,

      child: Consumer<ProfileDetailViewModel>(
        builder: (_, vm, __) {
          if (vm.viewState == ViewState.busy) {
            return Scaffold(
              backgroundColor: AppColors.kBg,

              body: Center(child: CircularProgressIndicator()),
            );
          }
          final isDark = ThemeController.instance.isDark;

          final user = vm.user;
          final currentEducation =
              user?.educations != null && user!.educations!.isNotEmpty
              ? user.educations!.firstWhere(
                  (e) => e.isCurrent == true,

                  orElse: () => user.educations!.first,
                )
              : null;

          final noticeData = calculateNoticePeriodStatus(
            user?.noticePeriodStartDate,
            user?.noticePeriod,
          );

          if (user == null) {
            return const Scaffold(
              body: Center(child: Text("No profile found")),
            );
          }

          return Scaffold(
            backgroundColor: AppColors.kBg,

            appBar: AppBar(
              backgroundColor: AppColors.kCard,

              iconTheme: IconThemeData(color: AppColors.white),

              title: Text("Profile", style: TextStyle(color: AppColors.white)),
            ),
            body: RefreshIndicator(
              color: AppColors.kGreen,

              backgroundColor: AppColors.kCard,

              onRefresh: () async {
                await vm.fetchProfile(widget.userId);
              },

              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),

                padding: const EdgeInsets.all(16),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    /// HEADER
                    _premiumHeader(user, currentEducation),
                    const SizedBox(height: 18),
                    if ((user.noticePeriod?.isNotEmpty ?? false) ||
                        (user.noticePeriodStartDate?.isNotEmpty ?? false) ||
                        noticeData != null)
                      Column(
                        children: [
                          _modernSection(
                            title: "Notice Period",
                            icon: Icons.timer_outlined,

                            child: Builder(
                              builder: (context) {
                                final List<Widget> cards = [];

                                if ((user.noticePeriod?.isNotEmpty ?? false)) {
                                  cards.add(
                                    _smallInfoCard(
                                      "Notice Days",
                                      user.noticePeriod!,
                                      Icons.date_range,
                                    ),
                                  );
                                }

                                if (noticeData?["daysPassed"] != null) {
                                  cards.add(
                                    _smallInfoCard(
                                      "Days Served",
                                      noticeData!["daysPassed"].toString(),
                                      Icons.check_circle,
                                    ),
                                  );
                                }

                                if ((noticeData?["endDate"]
                                        ?.toString()
                                        .isNotEmpty ??
                                    false)) {
                                  cards.add(
                                    _smallInfoCard(
                                      "Last Working Day",
                                      noticeData!["endDate"].toString(),
                                      Icons.event,
                                    ),
                                  );
                                }

                                if (cards.isEmpty) {
                                  return Container(
                                    width: double.infinity,

                                    padding: const EdgeInsets.symmetric(
                                      vertical: 18,
                                    ),

                                    alignment: Alignment.center,

                                    child: Text(
                                      "No Notice Period",

                                      style: TextStyle(
                                        color: AppColors.white.withOpacity(.54),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  );
                                }

                                return Column(
                                  children: [
                                    /// INFO CARDS
                                    Row(
                                      children: cards.map((card) {
                                        return Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 4,
                                            ),
                                            child: card,
                                          ),
                                        );
                                      }).toList(),
                                    ),

                                    /// PROGRESS
                                    if (noticeData?["daysPassed"] != null &&
                                        (user.noticePeriod?.isNotEmpty ??
                                            false)) ...[
                                      const SizedBox(height: 16),

                                      LinearProgressIndicator(
                                        value:
                                            ((noticeData?["daysPassed"] ?? 0) /
                                                    ((int.tryParse(
                                                              user.noticePeriod ??
                                                                  "1",
                                                            ) ??
                                                            1)
                                                        .clamp(1, 999)))
                                                .clamp(0.0, 1.0)
                                                .toDouble(),
                                        backgroundColor: AppColors.kBorder,

                                        valueColor: AlwaysStoppedAnimation(
                                          noticeData?["isExpired"] == true
                                              ? Colors.green
                                              : AppColors.kGreen,
                                        ),
                                      ),
                                    ],

                                    /// STATUS
                                    if (user.servingNoticePeriod == true ||
                                        noticeData?["isExpired"] == true) ...[
                                      const SizedBox(height: 12),

                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 8,
                                        ),

                                        decoration: BoxDecoration(
                                          color:
                                              noticeData?["isExpired"] == true
                                              ? Colors.green.withOpacity(.15)
                                              : Colors.orange.withOpacity(.15),

                                          borderRadius: BorderRadius.circular(
                                            30,
                                          ),
                                        ),

                                        child: Text(
                                          noticeData?["isExpired"] == true
                                              ? "Notice Period Complete"
                                              : "Serving Notice Period",

                                          style: TextStyle(
                                            color:
                                                noticeData?["isExpired"] == true
                                                ? Colors.green
                                                : Colors.orange,

                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ],
                                );
                              },
                            ),
                          ),

                          const SizedBox(height: 18),
                        ],
                      ),

                    /// ABOUT
                    _modernSection(
                      title: "About",
                      icon: Icons.person_outline,
                      iconColor: Colors.lightBlueAccent,

                      child: Text(
                        user.about ?? "-",

                        style: TextStyle(
                          color: AppColors.white.withOpacity(.7),
                          height: 1.6,
                          fontSize: 14,
                        ),
                      ),
                    ),

                    const SizedBox(height: 5),
                    if ((user.email?.isNotEmpty ?? false)) ...[
                      const SizedBox(height: 18),

                      GestureDetector(
                        onTap: () async {
                          final uri = Uri(scheme: 'mailto', path: user.email);

                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri);
                          }
                        },

                        child: Container(
                          width: double.infinity,

                          padding: const EdgeInsets.all(16),

                          decoration: BoxDecoration(
                            color: AppColors.kCard,
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: ThemeController.instance.isDark
                                  ? AppColors.kBorder
                                  : const Color(0xFFE5E7EB),
                              width: 1,
                            ),
                            boxShadow: ThemeController.instance.isDark
                                ? []
                                : [
                                    BoxShadow(
                                      color: AppColors.shadow,
                                      blurRadius: 16,
                                      offset: const Offset(0, 6),
                                    ),
                                  ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),

                                decoration: BoxDecoration(
                                  color: AppColors.kGreen.withOpacity(.12),

                                  borderRadius: BorderRadius.circular(14),
                                ),

                                child: Icon(
                                  Icons.email_outlined,
                                  color: AppColors.kGreen,
                                ),
                              ),

                              const SizedBox(width: 14),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Text(
                                      "Official Email",

                                      style: TextStyle(
                                        color: AppColors.secText,
                                        fontSize: 11,
                                      ),
                                    ),

                                    const SizedBox(height: 4),

                                    Text(
                                      user.email!,

                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12),

                              Icon(
                                Icons.open_in_new,
                                color: AppColors.secText,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                    SizedBox(height: 18),

                    /// DETAILS GRID
                    _modernSection(
                      title: "Personal Information",
                      icon: Icons.badge_outlined,
                      iconColor: Colors.orangeAccent,

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          _detailTile("Phone", user.phone),
                          _detailTile("Ethnicity", user.ethnicity),
                          _detailTile("Visa Status", user.visaStatus),
                          _detailTile("Gender", user.gender),
                          _detailTile("D.O.B", user.dob),
                          _detailTile("Marital Status", user.maritalStatus),

                          if ((user.languagesKnown ?? []).isNotEmpty)
                            _detailTile(
                              "Languages Known",
                              user.languagesKnown!.join(", "),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),

                    /// SKILLS
                    if ((user.skills ?? []).isNotEmpty) ...[
                      _modernSection(
                        title: "Skills",
                        icon: Icons.code,
                        iconColor: Colors.greenAccent,
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: (user.skills ?? [])
                              .map(
                                (e) => Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.blackwhite.withOpacity(
                                      .12,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: ThemeController.instance.isDark
                                          ? AppColors.kBorder
                                          : const Color(0xFFE5E7EB),
                                      width: 1,
                                    ),
                                    boxShadow: ThemeController.instance.isDark
                                        ? []
                                        : [
                                            BoxShadow(
                                              color: AppColors.shadow,
                                              blurRadius: 5,
                                              offset: const Offset(1, 2),
                                            ),
                                          ],
                                  ),
                                  child: Text(
                                    e,
                                    style: TextStyle(
                                      color: AppColors.chipText,
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      const SizedBox(height: 18),
                    ],

                    /// LANGUAGES
                    if ((user.languagesKnown ?? []).isNotEmpty) ...[
                      _modernSection(
                        title: "Languages",
                        assetIcon: "assets/images/globe.png",
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: (user.languagesKnown ?? [])
                              .map((e) => _chip(e))
                              .toList(),
                        ),
                      ),
                      const SizedBox(height: 18),
                    ],

                    /// DOMAIN KNOWLEDGE
                    if ((user.domainKnowledge ?? []).isNotEmpty) ...[
                      _modernSection(
                        title: "Domain Knowledge",
                        icon: Icons.psychology,
                        iconColor: Colors.purpleAccent,
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: (user.domainKnowledge ?? [])
                              .map((e) => _chip(e))
                              .toList(),
                        ),
                      ),
                      const SizedBox(height: 18),
                    ],

                    /// TOOLS & PLATFORMS
                    if ((user.toolsAndPlatforms ?? []).isNotEmpty) ...[
                      _modernSection(
                        title: "Tools & Platforms",
                        icon: Icons.build,
                        iconColor: Colors.blueAccent,
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: (user.toolsAndPlatforms ?? [])
                              .map((e) => _chip(e))
                              .toList(),
                        ),
                      ),
                      const SizedBox(height: 18),
                    ],

                    if ((user.industry ?? []).isNotEmpty) ...[
                      _modernSection(
                        title: "Industries",
                        icon: Icons.business_outlined,
                        iconColor: Colors.indigoAccent,
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: (user.industry ?? [])
                              .map((e) => _chip(e))
                              .toList(),
                        ),
                      ),
                    ],
                    if ((user.industry ?? []).isNotEmpty ||
                        (user.locations ?? []).isNotEmpty ||
                        (user.lookingFor ?? []).isNotEmpty ||
                        (user.employmentType ?? []).isNotEmpty ||
                        (user.jobRoles ?? []).isNotEmpty ||
                        (user.certifications?.isNotEmpty ?? false))
                      const SizedBox(height: 18),

                    /// PROFESSIONAL DETAILS
                    if ((user.locations ?? []).isNotEmpty ||
                        (user.lookingFor ?? []).isNotEmpty ||
                        (user.employmentType ?? []).isNotEmpty ||
                        (user.certifications?.isNotEmpty ?? false) ||
                        (user.currentSalaryAmount?.isNotEmpty ?? false) ||
                        (user.expectedSalaryAmount?.isNotEmpty ?? false) ||
                        (user.openToShift?.isNotEmpty ?? false))
                      _modernSection(
                        title: "Job Preferences",
                        assetIcon: "assets/images/pref.png",

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            /// CURRENT SALARY
                            if ((user.currentSalaryAmount?.isNotEmpty ??
                                    false) ||
                                (user.currentSalaryCurrency?.isNotEmpty ??
                                    false))
                              _detailTile(
                                "Current Salary",

                                "${user.currentSalaryCurrency ?? ''} "
                                    "${user.currentSalaryAmount ?? ''}",
                              ),

                            /// EXPECTED SALARY
                            if ((user.expectedSalaryAmount?.isNotEmpty ??
                                    false) ||
                                (user.expectedSalaryCurrency?.isNotEmpty ??
                                    false))
                              _detailTile(
                                "Expected Salary",

                                "${user.expectedSalaryCurrency ?? ''} "
                                    "${user.expectedSalaryAmount ?? ''}",
                              ),

                            /// OPEN TO SHIFT
                            if ((user.openToShift?.isNotEmpty ?? false))
                              _detailTile("Open To Shift", user.openToShift),

                            /// EMPLOYMENT TYPE
                            if ((user.employmentType ?? []).isNotEmpty) ...[
                              const SizedBox(height: 10),

                              Text(
                                "Employment Type",

                                style: TextStyle(
                                  color: AppColors.secText,
                                  fontSize: 11,
                                ),
                              ),

                              const SizedBox(height: 10),

                              Wrap(
                                spacing: 8,
                                runSpacing: 8,

                                children: (user.employmentType ?? [])
                                    .map((e) => _chip(e))
                                    .toList(),
                              ),
                            ],

                            /// LOOKING FOR
                            if ((user.lookingFor ?? []).isNotEmpty) ...[
                              const SizedBox(height: 18),

                              Text(
                                "Looking For",

                                style: TextStyle(
                                  color: AppColors.secText,
                                  fontSize: 11,
                                ),
                              ),

                              const SizedBox(height: 10),

                              Wrap(
                                spacing: 8,
                                runSpacing: 8,

                                children: (user.lookingFor ?? [])
                                    .map((e) => _chip(e))
                                    .toList(),
                              ),
                            ],

                            /// PREFERRED LOCATIONS
                            if ((user.locations ?? []).isNotEmpty) ...[
                              const SizedBox(height: 18),

                              Text(
                                "Preferred Locations",

                                style: TextStyle(
                                  color: AppColors.secText,
                                  fontSize: 11,
                                ),
                              ),

                              const SizedBox(height: 10),

                              Wrap(
                                spacing: 8,
                                runSpacing: 8,

                                children: (user.locations ?? [])
                                    .map((e) => _chip(e))
                                    .toList(),
                              ),
                            ],

                            /// JOB ROLES
                            if ((user.jobRoles ?? []).isNotEmpty) ...[
                              const SizedBox(height: 18),

                              Text(
                                "Preferred Job Roles",

                                style: TextStyle(
                                  color: AppColors.secText,
                                  fontSize: 11,
                                ),
                              ),

                              const SizedBox(height: 10),

                              Wrap(
                                spacing: 10,
                                runSpacing: 10,

                                children: (user.jobRoles ?? [])
                                    .map(
                                      (e) => _premiumChip(
                                        e,
                                        color: const Color(0xff7F5AF0),
                                        icon: Icons.work,
                                      ),
                                    )
                                    .toList(),
                              ),
                            ],

                            /// CERTIFICATIONS
                            if ((user.certifications?.isNotEmpty ?? false)) ...[
                              const SizedBox(height: 18),

                              Text(
                                "Certifications",

                                style: TextStyle(
                                  color: AppColors.secText,
                                  fontSize: 11,
                                ),
                              ),

                              const SizedBox(height: 10),

                              Wrap(
                                spacing: 8,
                                runSpacing: 8,

                                children: user.certifications!
                                    .split(',')
                                    .map((e) => _chip(e.trim()))
                                    .toList(),
                              ),
                            ],
                          ],
                        ),
                      ),
                    SizedBox(height: 18),

                    _modernSection(
                      title: "Education",
                      assetIcon: "assets/images/edu_cap.png",
                      iconColor: AppColors.primary,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: (user.educations ?? []).asMap().entries.map((
                          entry,
                        ) {
                          final index = entry.key;
                          final e = entry.value;

                          final isLast = index == (user.educations!.length - 1);

                          final hasDegree =
                              (e.degree?.trim().isNotEmpty ?? false);
                          final hasSpecialization =
                              (e.specialization?.trim().isNotEmpty ?? false);
                          final hasYear =
                              (e.yearOfGraduation?.trim().isNotEmpty ?? false);
                          final hasCgpa = (e.cgpa?.trim().isNotEmpty ?? false);

                          final contentChildren = <Widget>[];

                          /// DEGREE + CURRENT BADGE — only if there's a degree
                          /// or a "current" flag to show
                          if (hasDegree || e.isCurrent == true) {
                            contentChildren.add(
                              Row(
                                children: [
                                  if (hasDegree)
                                    Expanded(
                                      child: Text(
                                        e.degree!,
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    )
                                  else
                                    const Spacer(),

                                  if (e.isCurrent == true)
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.kGreen.withOpacity(
                                          .12,
                                        ),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Text(
                                        "Current ",
                                        style: TextStyle(
                                          color: AppColors.kGreen,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            );
                          }

                          /// SPECIALIZATION — only if present
                          if (hasSpecialization) {
                            if (contentChildren.isNotEmpty) {
                              contentChildren.add(const SizedBox(height: 5));
                            }
                            contentChildren.add(
                              Text(
                                e.specialization!,
                                style: TextStyle(
                                  color: AppColors.white.withOpacity(.7),
                                  fontSize: 14,
                                ),
                              ),
                            );
                          }

                          /// COLLEGE + YEAR — college always present, year
                          /// only if present
                          if (contentChildren.isNotEmpty) {
                            contentChildren.add(const SizedBox(height: 10));
                          }
                          contentChildren.add(
                            Wrap(
                              spacing: 14,
                              runSpacing: 10,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      "assets/images/edu_cap.png",
                                      width: 15,
                                      height: 15,
                                    ),

                                    const SizedBox(width: 6),

                                    Text(
                                      e.college ?? "",
                                      style: TextStyle(
                                        color: AppColors.primary,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),

                                if (hasYear)
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        "assets/images/calendar.png",
                                        width: 15,
                                        height: 15,
                                      ),

                                      const SizedBox(width: 6),

                                      Text(
                                        e.yearOfGraduation!,
                                        style: TextStyle(
                                          color: AppColors.white.withOpacity(
                                            .7,
                                          ),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          );

                          /// CGPA — only if present
                          if (hasCgpa) {
                            contentChildren.add(const SizedBox(height: 10));
                            contentChildren.add(
                              Text(
                                "CGPA: ${e.cgpa}",
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            );
                          }

                          return IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                /// TIMELINE
                                Column(
                                  children: [
                                    Container(
                                      width: 11,
                                      height: 11,
                                      margin: const EdgeInsets.only(top: 6),
                                      decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        shape: BoxShape.circle,
                                      ),
                                    ),

                                    if (!isLast)
                                      Expanded(
                                        child: Container(
                                          width: 1.5,
                                          margin: const EdgeInsets.symmetric(
                                            vertical: 4,
                                          ),
                                          color: AppColors.kBorder,
                                        ),
                                      ),
                                  ],
                                ),

                                const SizedBox(width: 16),

                                /// CONTENT
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 24),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: contentChildren,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    SizedBox(height: 18),

                    /// EXPERIENCE
                    _modernSection(
                      title: "Experience",
                      assetIcon: "assets/images/experience.png",
                      iconColor: Colors.purple,
                      child: Column(
                        children: (user.experiences ?? [])
                            .where(
                              (e) =>
                                  (e.company?.trim().isNotEmpty ?? false) ||
                                  (e.role?.trim().isNotEmpty ?? false),
                            )
                            .map(
                              (e) => Container(
                                margin: const EdgeInsets.only(bottom: 18),

                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    /// COMPANY BOX
                                    Container(
                                      height: 44,
                                      width: 44,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: isDark
                                            ? Colors.white
                                            : AppColors.white,
                                        borderRadius: BorderRadius.circular(14),
                                        border: Border.all(
                                          color: isDark
                                              ? AppColors.white.withOpacity(.25)
                                              : AppColors.white.withOpacity(
                                                  .18,
                                                ),
                                        ),
                                      ),
                                      child: Text(
                                        (e.company?.isNotEmpty ?? false)
                                            ? e.company!
                                                  .trim()
                                                  .substring(0, 1)
                                                  .toUpperCase()
                                            : "C",
                                        style: TextStyle(
                                          color: isDark
                                              ? Colors.black
                                              : AppColors.blackwhite,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 14),

                                    /// CONTENT
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,

                                        children: [
                                          /// TOP ROW
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  e.company ?? "",
                                                  style: TextStyle(
                                                    color: AppColors.white,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                              if (e.isCurrent == true)
                                                Container(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 12,
                                                        vertical: 6,
                                                      ),
                                                  decoration: BoxDecoration(
                                                    color: AppColors.kGreen
                                                        .withOpacity(.12),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          30,
                                                        ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Container(
                                                        width: 8,
                                                        height: 8,
                                                        decoration:
                                                            const BoxDecoration(
                                                              color:
                                                                  Colors.green,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                      ),

                                                      const SizedBox(width: 6),

                                                      Text(
                                                        "Current",
                                                        style: TextStyle(
                                                          color:
                                                              AppColors.kGreen,
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                            ],
                                          ),

                                          const SizedBox(height: 4),

                                          /// ROLE
                                          Text(
                                            e.role ?? "",

                                            style: TextStyle(
                                              color: AppColors.white
                                                  .withOpacity(.7),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),

                                          const SizedBox(height: 12),

                                          if ((e.startDate?.isNotEmpty ??
                                                  false) ||
                                              (e.endDate?.isNotEmpty ?? false))
                                            Row(
                                              children: [
                                                Image.asset(
                                                  "assets/images/calendar.png",
                                                  width: 15,
                                                  height: 15,
                                                ),
                                                const SizedBox(width: 7),
                                                Expanded(
                                                  child: Text(
                                                    "${e.startDate ?? ''}${(e.startDate?.isNotEmpty ?? false) ? ' - ' : ''}${e.endDate?.isNotEmpty == true ? e.endDate : ''}",
                                                    style: TextStyle(
                                                      color: AppColors.white
                                                          .withOpacity(.7),
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),

                                          /// DESCRIPTION
                                          if ((e.description
                                                  ?.trim()
                                                  .isNotEmpty ??
                                              false)) ...[
                                            const SizedBox(height: 12),

                                            Text(
                                              e.description!,

                                              style: TextStyle(
                                                color: AppColors.white
                                                    .withOpacity(.6),
                                                fontSize: 13,
                                                height: 1.5,
                                              ),
                                            ),
                                          ],
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    if ((user.leadershipExperiences ?? []).isNotEmpty) ...[
                      const SizedBox(height: 18),

                      _modernSection(
                        title: "Leadership Experience",
                        icon: Icons.groups_2_outlined,

                        child: Column(
                          children: (user.leadershipExperiences ?? [])
                              .map(
                                (e) => Container(
                                  width: double.infinity,

                                  margin: const EdgeInsets.only(bottom: 14),

                                  padding: const EdgeInsets.all(14),

                                  decoration: BoxDecoration(
                                    color: ThemeController.instance.isDark
                                        ? AppColors.text.withOpacity(.04)
                                        : AppColors.kTile,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: ThemeController.instance.isDark
                                          ? AppColors.kBorder
                                          : const Color(0xFFE5E7EB),
                                      width: 1,
                                    ),
                                    boxShadow: ThemeController.instance.isDark
                                        ? []
                                        : [
                                            BoxShadow(
                                              color: AppColors.shadow,
                                              blurRadius: 12,
                                              offset: const Offset(0, 4),
                                            ),
                                          ],
                                  ),

                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [
                                      Text(
                                        e.role ?? '-',

                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),

                                      const SizedBox(height: 6),

                                      Text(
                                        e.organization ?? '-',

                                        style: TextStyle(
                                          color: AppColors.kGreen,
                                          fontSize: 13,
                                        ),
                                      ),

                                      const SizedBox(height: 10),

                                      Text(
                                        "${e.startDate ?? ''} - ${e.endDate ?? ''}",

                                        style: TextStyle(
                                          color: AppColors.white.withOpacity(
                                            .7,
                                          ),
                                          fontSize: 12,
                                        ),
                                      ),

                                      const SizedBox(height: 12),

                                      Text(
                                        e.description ?? '-',

                                        style: TextStyle(
                                          color: AppColors.white.withOpacity(
                                            .7,
                                          ),
                                          height: 1.5,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                    if ((user.internationalExperiences ?? []).isNotEmpty) ...[
                      const SizedBox(height: 18),

                      _modernSection(
                        title: "International Experience",
                        icon: Icons.public,
                        iconColor: AppColors.primary,
                        child: Column(
                          children: (user.internationalExperiences ?? [])
                              .map(
                                (e) => Container(
                                  width: double.infinity,

                                  margin: const EdgeInsets.only(bottom: 14),

                                  padding: const EdgeInsets.all(14),

                                  decoration: BoxDecoration(
                                    color: ThemeController.instance.isDark
                                        ? AppColors.text.withOpacity(.04)
                                        : AppColors.kTile,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: ThemeController.instance.isDark
                                          ? AppColors.kBorder
                                          : const Color(0xFFE5E7EB),
                                      width: 1,
                                    ),
                                    boxShadow: ThemeController.instance.isDark
                                        ? []
                                        : [
                                            BoxShadow(
                                              color: AppColors.shadow,
                                              blurRadius: 12,
                                              offset: const Offset(0, 4),
                                            ),
                                          ],
                                  ),

                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [
                                      Text(
                                        e.role ?? '-',

                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),

                                      const SizedBox(height: 6),

                                      Text(
                                        e.country ?? '-',

                                        style: TextStyle(
                                          color: AppColors.kGreen,
                                          fontSize: 13,
                                        ),
                                      ),

                                      const SizedBox(height: 10),

                                      Text(
                                        "${e.startDate ?? ''} - ${e.endDate ?? ''}",

                                        style: TextStyle(
                                          color: AppColors.white.withOpacity(
                                            .7,
                                          ),
                                          fontSize: 12,
                                        ),
                                      ),

                                      const SizedBox(height: 12),

                                      Text(
                                        e.description ?? '-',

                                        style: TextStyle(
                                          color: AppColors.white.withOpacity(
                                            .7,
                                          ),
                                          height: 1.5,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                    if ((user.achievements ?? []).isNotEmpty) ...[
                      const SizedBox(height: 18),

                      _modernSection(
                        title: "Achievements",
                        assetIcon: "assets/images/achievements.png",
                        child: Column(
                          children: (user.achievements ?? [])
                              .map(
                                (e) => Container(
                                  width: double.infinity,

                                  margin: const EdgeInsets.only(bottom: 14),

                                  padding: const EdgeInsets.all(14),
                                  decoration: BoxDecoration(
                                    color: ThemeController.instance.isDark
                                        ? AppColors.text.withOpacity(.04)
                                        : AppColors.kTile,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: ThemeController.instance.isDark
                                          ? AppColors.kBorder
                                          : const Color(0xFFE5E7EB),
                                      width: 1,
                                    ),
                                    boxShadow: ThemeController.instance.isDark
                                        ? []
                                        : [
                                            BoxShadow(
                                              color: AppColors.shadow,
                                              blurRadius: 12,
                                              offset: const Offset(0, 4),
                                            ),
                                          ],
                                  ),

                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              e.title ?? '-',
                                              style: TextStyle(
                                                color: AppColors.kGreen,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 6),

                                      Text(
                                        e.event ?? '-',

                                        style: TextStyle(
                                          color: AppColors.secText,
                                          fontSize: 13,
                                        ),
                                      ),

                                      const SizedBox(height: 10),

                                      Text(
                                        e.date ?? '-',

                                        style: TextStyle(
                                          color: AppColors.white.withOpacity(
                                            .7,
                                          ),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],

                    if ((user.awards ?? []).isNotEmpty) ...[
                      const SizedBox(height: 18),

                      _modernSection(
                        title: "Awards",
                        assetIcon: "assets/images/awards.png",
                        child: Column(
                          children: (user.awards ?? [])
                              .map(
                                (e) => Container(
                                  width: double.infinity,

                                  margin: const EdgeInsets.only(bottom: 14),

                                  padding: const EdgeInsets.all(14),

                                  decoration: BoxDecoration(
                                    color: ThemeController.instance.isDark
                                        ? AppColors.text.withOpacity(.04)
                                        : AppColors.kTile,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: ThemeController.instance.isDark
                                          ? AppColors.kBorder
                                          : const Color(0xFFE5E7EB),
                                      width: 1,
                                    ),
                                    boxShadow: ThemeController.instance.isDark
                                        ? []
                                        : [
                                            BoxShadow(
                                              color: AppColors.shadow,
                                              blurRadius: 12,
                                              offset: const Offset(0, 4),
                                            ),
                                          ],
                                  ),

                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              e.title ?? '-',
                                              style: TextStyle(
                                                color: AppColors.kGreen,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 6),

                                      Text(
                                        e.organization ?? '-',

                                        style: TextStyle(
                                          color: AppColors.secText,
                                          fontSize: 13,
                                        ),
                                      ),

                                      const SizedBox(height: 12),

                                      Text(
                                        e.description ?? '-',

                                        style: TextStyle(
                                          color: AppColors.white.withOpacity(
                                            .7,
                                          ),
                                          height: 1.5,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],

                    if ((user.publications ?? []).isNotEmpty) ...[
                      const SizedBox(height: 18),

                      _modernSection(
                        title: "Publications",
                        icon: Icons.menu_book_outlined,

                        child: Column(
                          children: (user.publications ?? [])
                              .map(
                                (e) => Container(
                                  width: double.infinity,

                                  margin: const EdgeInsets.only(bottom: 14),

                                  padding: const EdgeInsets.all(14),

                                  decoration: BoxDecoration(
                                    color: ThemeController.instance.isDark
                                        ? AppColors.text.withOpacity(.04)
                                        : AppColors.kTile,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: ThemeController.instance.isDark
                                          ? AppColors.kBorder
                                          : const Color(0xFFE5E7EB),
                                      width: 1,
                                    ),
                                    boxShadow: ThemeController.instance.isDark
                                        ? []
                                        : [
                                            BoxShadow(
                                              color: AppColors.shadow,
                                              blurRadius: 12,
                                              offset: const Offset(0, 4),
                                            ),
                                          ],
                                  ),

                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [
                                      Text(
                                        e.title ?? '-',

                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),

                                      if ((e.url?.isNotEmpty ?? false)) ...[
                                        const SizedBox(height: 10),

                                        GestureDetector(
                                          onTap: () => openUrl(e.url!),

                                          child: Text(
                                            e.url!,

                                            style: TextStyle(
                                              color: AppColors.kGreen,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],

                    const SizedBox(height: 12),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: (user.github?.isNotEmpty ?? false)
                            ? () => openUrl(user.github!)
                            : null,
                        icon: const Icon(Icons.code),
                        label: const Text("Open GitHub"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: (user.github?.isNotEmpty ?? false)
                              ? AppColors.kGreen
                              : (ThemeController.instance.isDark
                                    ? AppColors.kBorder
                                    : const Color(0xFFF3F4F6)),
                          foregroundColor: (user.github?.isNotEmpty ?? false)
                              ? Colors.white
                              : (ThemeController.instance.isDark
                                    ? AppColors.secText
                                    : const Color(0xFF9CA3AF)),
                          disabledBackgroundColor:
                              ThemeController.instance.isDark
                              ? AppColors.kBorder
                              : const Color(0xFFF3F4F6),
                          disabledForegroundColor:
                              ThemeController.instance.isDark
                              ? AppColors.secText
                              : const Color(0xFF9CA3AF),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: (user.portfolio?.isNotEmpty ?? false)
                            ? () => openUrl(user.portfolio!)
                            : null,
                        icon: const Icon(Icons.web),
                        label: const Text("Open Portfolio"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: (user.portfolio?.isNotEmpty ?? false)
                              ? AppColors.kGreen
                              : (ThemeController.instance.isDark
                                    ? AppColors.kBorder
                                    : const Color(0xFFF3F4F6)),
                          foregroundColor: (user.portfolio?.isNotEmpty ?? false)
                              ? Colors.white
                              : (ThemeController.instance.isDark
                                    ? AppColors.secText
                                    : const Color(0xFF9CA3AF)),
                          disabledBackgroundColor:
                              ThemeController.instance.isDark
                              ? AppColors.kBorder
                              : const Color(0xFFF3F4F6),
                          disabledForegroundColor:
                              ThemeController.instance.isDark
                              ? AppColors.secText
                              : const Color(0xFF9CA3AF),
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _modernSection({
    required String title,
    IconData? icon,
    String? assetIcon,
    required Widget child,
    Color iconColor = Colors.greenAccent,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
      builder: (context, value, widget) {
        return Transform.translate(
          offset: Offset(0, 20 * (1 - value)),
          child: Opacity(opacity: value, child: widget),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: AppColors.kCard,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: ThemeController.instance.isDark
                ? AppColors.kBorder
                : const Color(0xFFE5E7EB),
            width: 1,
          ),
          boxShadow: ThemeController.instance.isDark
              ? []
              : [
                  BoxShadow(
                    color: AppColors.shadow,
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// HEADER
            Row(
              children: [
                assetIcon != null
                    ? Image.asset(assetIcon, width: 18, height: 18)
                    : Icon(icon, size: 18, color: iconColor),

                const SizedBox(width: 8),

                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            Container(height: 1, color: AppColors.kBorder),

            const SizedBox(height: 14),

            /// CONTENT
            child,
          ],
        ),
      ),
    );
  }

  Widget _smallInfoCard(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),

      decoration: BoxDecoration(
        color: AppColors.text.withOpacity(.05),

        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        children: [
          Icon(icon, color: AppColors.kGreen, size: 20),

          const SizedBox(height: 8),

          Text(
            value,

            style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          Text(title, style: TextStyle(color: AppColors.secText, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _detailTile(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(title, style: TextStyle(color: AppColors.secText, fontSize: 11)),

          const SizedBox(height: 4),

          Text(
            (value?.isNotEmpty ?? false) ? value! : "-",

            style: TextStyle(
              color: AppColors.white,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _premiumHeader(User user, dynamic currentEducation) {
    final currentStatus = user.status;
    final statusType = currentStatus?.type ?? '';

    String formattedStatus;

    switch (statusType) {
      case 'looking_job':
        formattedStatus = 'Looking for Job';
        break;
      case 'looking_internship':
        formattedStatus = 'Looking for Internship';
        break;
      case 'open_to_work':
        formattedStatus = 'Open to Work';
        break;
      case 'career_break':
        formattedStatus = 'Career Break';
        break;
      case 'preparing_exams':
        formattedStatus = 'Preparing for Exams';
        break;
      case 'not_looking':
        formattedStatus = 'Not Looking';
        break;
      case 'freelancing':
        formattedStatus = 'Freelancing';
        break;
      case 'building':
        formattedStatus = 'Building Something';
        break;
      default:
        formattedStatus = statusType
            .replaceAll('_', ' ')
            .split(' ')
            .map(
              (e) => e.isEmpty ? e : '${e[0].toUpperCase()}${e.substring(1)}',
            )
            .join(' ');
    }
    final totalExperience = (user.totalYearsOfExperience?.isNotEmpty ?? false)
        ? user.totalYearsOfExperience!
        : "0";
    final location = (user.locations?.isNotEmpty ?? false)
        ? user.locations!.first
        : "India";
    final companyCount =
        user.experiences
            ?.where((e) => (e.company?.trim().isNotEmpty ?? false))
            .length ??
        0;

    Experience? currentExp;

    if (user.experiences?.any((e) => e.isCurrent == true) ?? false) {
      currentExp = user.experiences!.firstWhere((e) => e.isCurrent == true);
    }
    final roleCompanyText = currentExp == null
        ? ''
        : [
            if ((currentExp.role ?? '').isNotEmpty) currentExp.role!,
            if ((currentExp.company ?? '').isNotEmpty) currentExp.company!,
          ].join(' @ ');
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeOut,

      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 30 * (1 - value)),
          child: Opacity(opacity: value, child: child),
        );
      },

      child: Container(
        width: double.infinity,

        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: AppColors.kCard,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: ThemeController.instance.isDark
                ? AppColors.kBorder
                : const Color(0xFFE5E7EB),
            width: 1,
          ),
          boxShadow: ThemeController.instance.isDark
              ? []
              : [
                  BoxShadow(
                    color: AppColors.shadow,
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
        ),

        child: Stack(
          children: [
            Column(
              children: [
                /// VERIFIED PROFILE
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,

                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),

                      decoration: BoxDecoration(
                        color: AppColors.kGreen.withOpacity(.10),

                        borderRadius: BorderRadius.circular(30),

                        border: Border.all(
                          color: AppColors.kGreen.withOpacity(.25),
                        ),
                      ),

                      child: Row(
                        mainAxisSize: MainAxisSize.min,

                        children: [
                          Icon(
                            Icons.verified,
                            color: AppColors.kGreen,
                            size: 14,
                          ),

                          const SizedBox(width: 6),

                          Text(
                            "Verified Profile",

                            style: TextStyle(
                              color: AppColors.kGreen,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                /// AVATAR
                Stack(
                  alignment: Alignment.center,

                  children: [
                    Container(
                      height: 118,
                      width: 118,

                      decoration: BoxDecoration(shape: BoxShape.circle),
                    ),

                    /// PROFILE
                    CircleAvatar(
                      radius: 48,
                      backgroundColor: AppColors.kGreen,

                      backgroundImage: (user.profileImage?.isNotEmpty ?? false)
                          ? NetworkImage(user.profileImage!)
                          : null,

                      child: (user.profileImage?.isEmpty ?? true)
                          ? Text(
                              user.name?.isNotEmpty == true
                                  ? user.name![0].toUpperCase()
                                  : "U",

                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 42,
                                fontWeight: FontWeight.w800,
                              ),
                            )
                          : null,
                    ),
                  ],
                ),

                const SizedBox(height: 22),

                /// NAME
                Text(
                  user.name ?? "",

                  textAlign: TextAlign.center,

                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -.8,
                  ),
                ),

                const SizedBox(height: 10),

                /// ROLE + COMPANY
                if (roleCompanyText.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 9,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.kGreen.withOpacity(.10),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: AppColors.kGreen.withOpacity(.25),
                      ),
                    ),
                    child: Text(
                      roleCompanyText,
                      style: TextStyle(
                        color: AppColors.kGreen,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                if (statusType.isNotEmpty && statusType != "employed") ...[
                  const SizedBox(height: 12),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(.12),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.orange.withOpacity(.25)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.info_outline,
                          size: 14,
                          color: Colors.orange,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          formattedStatus,
                          style: const TextStyle(
                            color: Colors.orange,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),

                  if ((currentStatus?.note ?? '').isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      currentStatus!.note!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.white.withOpacity(.6),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ],
                const SizedBox(height: 20),

                /// INFO ROW
                Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 14,
                  runSpacing: 10,

                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,

                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 15,
                          color: AppColors.white,
                        ),

                        const SizedBox(width: 5),

                        Text(
                          location,

                          style: TextStyle(
                            color: AppColors.white.withOpacity(.7),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),

                    Container(height: 12, width: 1, color: AppColors.kBorder),

                    Row(
                      mainAxisSize: MainAxisSize.min,

                      children: [
                        Icon(
                          Icons.work_outline,
                          size: 15,
                          color: AppColors.kGreen,
                        ),

                        const SizedBox(width: 5),

                        Text(
                          "Worked at $companyCount Companies",

                          style: TextStyle(
                            color: AppColors.white.withOpacity(.7),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 85,
                      child: _premiumStatCard(
                        title: "YOE",
                        value: totalExperience,
                        icon: Icons.work_outline,
                        gradient: const [Color(0xff0E1B12), Color(0xff101A13)],
                      ),
                    ),

                    const SizedBox(width: 6),

                    SizedBox(
                      width: 85,
                      child: _premiumStatCard(
                        title: "Skills",
                        value: "${user.skills?.length ?? 0}",
                        icon: Icons.star_border,
                        gradient: const [Color(0xff0E1B12), Color(0xff101A13)],
                      ),
                    ),

                    const SizedBox(width: 6),

                    SizedBox(
                      width: 85,
                      child: _premiumStatCard(
                        title: "Response",
                        value: user.responseRate != null
                            ? "${user.responseRate}%"
                            : "NA",
                        icon: Icons.trending_up,
                        gradient: const [Color(0xff0E1B12), Color(0xff101A13)],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),

                /// BUTTONS
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (user.resume?.isNotEmpty ?? false)
                            ? () {
                                final url = user.resume;

                                if (url == null) return;

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ResumeViewerPage(url: url),
                                  ),
                                );
                              }
                            : null,
                        child: _headerButton(
                          icon: Icons.picture_as_pdf,
                          title: "Resume",
                          filled: (user.resume?.isNotEmpty ?? false),
                          disabled: !(user.resume?.isNotEmpty ?? false),
                        ),
                      ),
                    ),

                    const SizedBox(width: 14),

                    Expanded(
                      child: GestureDetector(
                        onTap: (user.linkedin?.isNotEmpty ?? false)
                            ? () => openUrl(user.linkedin!)
                            : null,
                        child: _headerButton(
                          icon: Icons.business,
                          title: "LinkedIn",
                          filled: (user.linkedin?.isNotEmpty ?? false),
                          disabled: !(user.linkedin?.isNotEmpty ?? false),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _premiumChip(
    String text, {
    required Color color,
    required IconData icon,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),

      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),

      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(.22), color.withOpacity(.10)],
        ),

        borderRadius: BorderRadius.circular(16),

        border: Border.all(color: color.withOpacity(.30)),

        boxShadow: [
          BoxShadow(
            color: color.withOpacity(.15),
            blurRadius: 14,
            offset: const Offset(0, 8),
          ),
        ],
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,

        children: [
          Icon(icon, color: color, size: 15),

          const SizedBox(width: 8),

          Flexible(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,

              style: TextStyle(
                color: AppColors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _premiumStatCard({
    required String title,
    required String value,
    required IconData icon,
    required List<Color> gradient,
  }) {
    return Container(
      height: 75,
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.kCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: ThemeController.instance.isDark
              ? AppColors.kBorder
              : const Color(0xFFE5E7EB),
          width: 1,
        ),
        boxShadow: ThemeController.instance.isDark
            ? []
            : [
                BoxShadow(
                  color: AppColors.shadow,
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.kGreen, size: 14),

          const SizedBox(height: 4),

          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.white.withOpacity(.7),
              fontSize: 8,
            ),
          ),
        ],
      ),
    );
  }

  Widget _headerButton({
    required IconData icon,
    required String title,
    bool filled = false,
    bool disabled = false,
  }) {
    final isDark = ThemeController.instance.isDark;

    /// In light theme, an enabled/filled button drops the border and relies
    /// on a soft shadow instead. Dark theme keeps its existing look.
    final borderless = !isDark && filled && !disabled;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 54,
      decoration: BoxDecoration(
        gradient: disabled
            ? null
            : filled
            ? LinearGradient(
                colors: [AppColors.kGreen, AppColors.kGreen.withOpacity(.7)],
              )
            : null,
        color: disabled
            ? AppColors.text.withOpacity(.05)
            : filled
            ? null
            : AppColors.text.withOpacity(.06),
        borderRadius: BorderRadius.circular(5),
        border: borderless
            ? null
            : Border.all(
                color: disabled
                    ? AppColors.kBorder.withOpacity(.5)
                    : AppColors.kBorder,
              ),
        boxShadow: disabled
            ? []
            : filled
            ? [
                BoxShadow(
                  color: isDark
                      ? AppColors.kGreen.withOpacity(.35)
                      : AppColors.kGreen.withOpacity(.22),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ]
            : [],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: disabled ? AppColors.secText : Colors.white,
            size: 18,
          ),

          const SizedBox(width: 8),

          Text(
            title,
            style: TextStyle(
              color: disabled ? AppColors.secText : Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(String text) {
    final isDark = ThemeController.instance.isDark;

    final Color color = isDark
        ? const Color(0xFF7F5AF0) // Same purple as Preferred Job Roles
        : AppColors.kGreen;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(.22), color.withOpacity(.10)],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(.30)),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(.15),
            blurRadius: 14,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isDark ? AppColors.white : Colors.black87,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
