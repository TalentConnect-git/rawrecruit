import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

      /// NOTICE START DATE
      final startDate = DateTime.parse(startDateStr);

      /// TODAY
      final now = DateTime.now();

      /// REMOVE TIME PART
      final start = DateTime(startDate.year, startDate.month, startDate.day);

      final today = DateTime(now.year, now.month, now.day);

      /// DAYS SERVED
      int daysPassed = today.difference(start).inDays;

      if (daysPassed < 0) {
        daysPassed = 0;
      }

      /// DAYS REMAINING
      int daysRemaining = totalDays - daysPassed;

      if (daysRemaining < 0) {
        daysRemaining = 0;
      }

      /// END DATE
      final endDate = start.add(Duration(days: totalDays));

      /// PROGRESS
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
              backgroundColor: AppColors.secBorder,

              body: Center(child: CircularProgressIndicator()),
            );
          }

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
            backgroundColor: AppColors.secBorder,

            appBar: AppBar(
              backgroundColor: AppColors.kCard,

              iconTheme: const IconThemeData(color: Colors.white),

              title: const Text(
                "Profile",
                style: TextStyle(color: Colors.white),
              ),
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

                                    child: const Text(
                                      "No Notice Period",

                                      style: TextStyle(
                                        color: Colors.white54,
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
                                        backgroundColor: Colors.white12,

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

                        style: const TextStyle(
                          color: Colors.white70,
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
                              color: Colors.white.withOpacity(.05),
                            ),
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
                                    const Text(
                                      "Official Email",

                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 11,
                                      ),
                                    ),

                                    const SizedBox(height: 4),

                                    Text(
                                      user.email!,

                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12), // <- add this

                              const Icon(
                                Icons.open_in_new,
                                color: Colors.grey,
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
                                    color: Colors.white.withOpacity(.06),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Text(
                                    e,
                                    style: const TextStyle(
                                      color: Colors.white,
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

                              const Text(
                                "Employment Type",

                                style: TextStyle(
                                  color: Colors.grey,
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

                              const Text(
                                "Looking For",

                                style: TextStyle(
                                  color: Colors.grey,
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

                              const Text(
                                "Preferred Locations",

                                style: TextStyle(
                                  color: Colors.grey,
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

                              const Text(
                                "Preferred Job Roles",

                                style: TextStyle(
                                  color: Colors.grey,
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

                              const Text(
                                "Certifications",

                                style: TextStyle(
                                  color: Colors.grey,
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
                                          color: Colors.white12,
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
                                      children: [
                                        /// DEGREE
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                e.degree ?? "",
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),

                                            if (e.isCurrent == true)
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 5,
                                                    ),
                                                decoration: BoxDecoration(
                                                  color: AppColors.kGreen
                                                      .withOpacity(.12),
                                                  borderRadius:
                                                      BorderRadius.circular(30),
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

                                        const SizedBox(height: 5),

                                        if ((e.specialization?.isNotEmpty ??
                                            false))
                                          Text(
                                            e.specialization!,
                                            style: const TextStyle(
                                              color: Colors.white70,
                                              fontSize: 14,
                                            ),
                                          ),

                                        const SizedBox(height: 10),

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

                                            if ((e
                                                    .yearOfGraduation
                                                    ?.isNotEmpty ??
                                                false))
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
                                                    style: const TextStyle(
                                                      color: Colors.white70,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                          ],
                                        ),

                                        if ((e.cgpa?.isNotEmpty ?? false)) ...[
                                          const SizedBox(height: 10),

                                          Text(
                                            "CGPA: ${e.cgpa}",
                                            style: TextStyle(
                                              color: AppColors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ],
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
                                        color: AppColors.white,

                                        borderRadius: BorderRadius.circular(14),

                                        border: Border.all(
                                          color: AppColors.white.withOpacity(
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
                                          color: AppColors.secBorder,
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
                                                  style: const TextStyle(
                                                    color: Colors.white,
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

                                            style: const TextStyle(
                                              color: Colors.white70,
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
                                                    "${e.startDate ?? ''}${(e.startDate?.isNotEmpty ?? false) ? ' - ' : ''}${e.endDate?.isNotEmpty == true ? e.endDate : 'Present'}",
                                                    style: const TextStyle(
                                                      color: Colors.white70,
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

                                              style: const TextStyle(
                                                color: Colors.white60,
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
                                    color: Colors.white.withOpacity(.04),

                                    borderRadius: BorderRadius.circular(16),

                                    border: Border.all(
                                      color: Colors.white.withOpacity(.05),
                                    ),
                                  ),

                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [
                                      Text(
                                        e.role ?? '-',

                                        style: const TextStyle(
                                          color: Colors.white,
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

                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontSize: 12,
                                        ),
                                      ),

                                      const SizedBox(height: 12),

                                      Text(
                                        e.description ?? '-',

                                        style: const TextStyle(
                                          color: Colors.white70,
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
                                    color: Colors.white.withOpacity(.04),

                                    borderRadius: BorderRadius.circular(16),

                                    border: Border.all(
                                      color: Colors.white.withOpacity(.05),
                                    ),
                                  ),

                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [
                                      Text(
                                        e.role ?? '-',

                                        style: const TextStyle(
                                          color: Colors.white,
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

                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontSize: 12,
                                        ),
                                      ),

                                      const SizedBox(height: 12),

                                      Text(
                                        e.description ?? '-',

                                        style: const TextStyle(
                                          color: Colors.white70,
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
                        // iconColor: Colors.yellow,
                        child: Column(
                          children: (user.achievements ?? [])
                              .map(
                                (e) => Container(
                                  width: double.infinity,

                                  margin: const EdgeInsets.only(bottom: 14),

                                  padding: const EdgeInsets.all(14),

                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(.04),

                                    borderRadius: BorderRadius.circular(16),

                                    border: Border.all(
                                      color: Colors.white.withOpacity(.05),
                                    ),
                                  ),

                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [
                                      Row(
                                        children: [
                                          // const Icon(
                                          //   Icons.star,
                                          //   color: Colors.amber,
                                          //   size: 18,
                                          // ),

                                          // const SizedBox(width: 8),
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

                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 13,
                                        ),
                                      ),

                                      const SizedBox(height: 10),

                                      Text(
                                        e.date ?? '-',

                                        style: const TextStyle(
                                          color: Colors.white70,
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
                        // iconColor: Colors.orangeAccent,
                        child: Column(
                          children: (user.awards ?? [])
                              .map(
                                (e) => Container(
                                  width: double.infinity,

                                  margin: const EdgeInsets.only(bottom: 14),

                                  padding: const EdgeInsets.all(14),

                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(.04),

                                    borderRadius: BorderRadius.circular(16),

                                    border: Border.all(
                                      color: Colors.white.withOpacity(.05),
                                    ),
                                  ),

                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [
                                      Row(
                                        children: [
                                          // const Icon(
                                          //   Icons.star,
                                          //   color: Colors.amber,
                                          //   size: 18,
                                          // ),

                                          // const SizedBox(width: 8),
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

                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 13,
                                        ),
                                      ),

                                      const SizedBox(height: 12),

                                      Text(
                                        e.description ?? '-',

                                        style: const TextStyle(
                                          color: Colors.white70,
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
                                    color: Colors.white.withOpacity(.04),

                                    borderRadius: BorderRadius.circular(16),

                                    border: Border.all(
                                      color: Colors.white.withOpacity(.05),
                                    ),
                                  ),

                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [
                                      Text(
                                        e.title ?? '-',

                                        style: const TextStyle(
                                          color: Colors.white,
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
                              : Colors.white12,
                          foregroundColor: (user.github?.isNotEmpty ?? false)
                              ? Colors.white
                              : Colors.grey,
                          disabledBackgroundColor: Colors.white12,
                          disabledForegroundColor: Colors.grey,
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
                              : Colors.white12,
                          foregroundColor: (user.portfolio?.isNotEmpty ?? false)
                              ? Colors.white
                              : Colors.grey,
                          disabledBackgroundColor: Colors.white12,
                          disabledForegroundColor: Colors.grey,
                        ),
                      ),
                    ),

                    //                     const SizedBox(height: 15),

                    // SizedBox(
                    //   width: double.infinity,
                    //   child: ElevatedButton.icon(
                    //     onPressed: (user.resume?.isNotEmpty ?? false)
                    //         ? () {
                    //             final url = user.resume;

                    //             if (url == null) {
                    //               Toasts.showInfoToast(
                    //                 context,
                    //                 message: 'No Resume Found!',
                    //               );
                    //               return;
                    //             }

                    //             Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                 builder: (_) => ResumeViewerPage(url: url),
                    //               ),
                    //             );
                    //           }
                    //         : null,
                    //     icon: const Icon(Icons.picture_as_pdf),
                    //     label: const Text("Open Resume"),
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor: (user.resume?.isNotEmpty ?? false)
                    //           ? AppColors.kGreen
                    //           : Colors.white12,
                    //       foregroundColor: (user.resume?.isNotEmpty ?? false)
                    //           ? Colors.white
                    //           : Colors.grey,
                    //       disabledBackgroundColor: Colors.white12,
                    //       disabledForegroundColor: Colors.grey,
                    //       padding: const EdgeInsets.symmetric(vertical: 14),
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(14),
                    //       ),
                    //     ),
                    //   ),
                    // ),
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

          border: Border.all(color: Colors.white.withOpacity(.06)),
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
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            Container(height: 1, color: Colors.white.withOpacity(.06)),

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
        color: Colors.white.withOpacity(.05),

        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        children: [
          Icon(icon, color: AppColors.kGreen, size: 20),

          const SizedBox(height: 8),

          Text(
            value,

            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
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
          Text(title, style: const TextStyle(color: Colors.grey, fontSize: 11)),

          const SizedBox(height: 4),

          Text(
            (value?.isNotEmpty ?? false) ? value! : "-",

            style: const TextStyle(
              color: Colors.white,
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
    final totalExperience = (user.totalYearsOfExperience?.isNotEmpty ?? false)
        ? user.totalYearsOfExperience!
        : "0";
    final defaultRole = getIt<AppStateProvider>().isProfessional
        ? 'Professional'
        : 'Student/Fresher';
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

          border: Border.all(color: Colors.white.withOpacity(.06)),
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
                    /// OUTER RING
                    Container(
                      height: 118,
                      width: 118,

                      decoration: BoxDecoration(shape: BoxShape.circle),
                    ),

                    /// PROFILE
                    CircleAvatar(
                      radius: 48,
                      backgroundColor: Colors.black,

                      backgroundImage: (user.profileImage?.isNotEmpty ?? false)
                          ? NetworkImage(user.profileImage!)
                          : null,

                      child: (user.profileImage?.isEmpty ?? true)
                          ? Text(
                              user.name?.isNotEmpty == true
                                  ? user.name![0].toUpperCase()
                                  : "U",

                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 42,
                                fontWeight: FontWeight.w800,
                              ),
                            )
                          : null,
                    ),

                    /// VERIFIED TICK
                    // Positioned(
                    //   bottom: 10,
                    //   right: 6,

                    //   child: Container(
                    //     height: 24,
                    //     width: 24,

                    //     decoration: BoxDecoration(
                    //       color: AppColors.kGreen,
                    //       shape: BoxShape.circle,

                    //       border: Border.all(color: Colors.black, width: 3),

                    //       boxShadow: [
                    //         BoxShadow(
                    //           color: AppColors.kGreen.withOpacity(.5),
                    //           blurRadius: 12,
                    //         ),
                    //       ],
                    //     ),

                    //     child: const Icon(
                    //       Icons.check,
                    //       size: 14,
                    //       color: Colors.black,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),

                const SizedBox(height: 22),

                /// NAME
                Text(
                  user.name ?? "",

                  textAlign: TextAlign.center,

                  style: const TextStyle(
                    color: Colors.white,
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
                          statusType
                              .replaceAll('_', ' ')
                              .split(' ')
                              .map(
                                (e) => e.isEmpty
                                    ? e
                                    : '${e[0].toUpperCase()}${e.substring(1)}',
                              )
                              .join(' '),
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
                      style: const TextStyle(
                        color: Colors.white60,
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

                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),

                    Container(height: 12, width: 1, color: Colors.white24),

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

                          style: const TextStyle(
                            color: Colors.white70,
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

  // Widget _topInfo(IconData icon, String text) {
  //   return Row(
  //     children: [
  //       Icon(icon, size: 14, color: Colors.grey),
  //       const SizedBox(width: 5),
  //       Text(
  //         text,
  //         style: const TextStyle(
  //           color: Colors.grey,
  //           fontSize: 12,
  //           fontWeight: FontWeight.w500,
  //         ),
  //       ),
  //     ],
  //   );
  // }

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

              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _headerDivider() {
  //   return Container(
  //     margin: const EdgeInsets.symmetric(horizontal: 12),
  //     height: 12,
  //     width: 1,
  //     color: Colors.white.withOpacity(.12),
  //   );
  // }
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
        border: Border.all(color: Colors.white.withOpacity(.06)),
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
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white70, fontSize: 8),
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
            ? Colors.white.withOpacity(.05)
            : filled
            ? null
            : Colors.white.withOpacity(.06),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: disabled
              ? Colors.white.withOpacity(.04)
              : Colors.white.withOpacity(.08),
        ),
        boxShadow: disabled
            ? []
            : filled
            ? [
                BoxShadow(
                  color: AppColors.kGreen.withOpacity(.35),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ]
            : [],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: disabled ? Colors.grey : Colors.white, size: 18),

          const SizedBox(width: 8),

          Text(
            title,
            style: TextStyle(
              color: disabled ? Colors.grey : Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.06),

        borderRadius: BorderRadius.circular(30),
      ),

      child: Text(
        text,

        style: const TextStyle(color: Colors.white, fontSize: 11),
      ),
    );
  }
}
