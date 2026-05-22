import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/feature/revamp_profile/presentation/resume_view_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/index.dart';
import '../../../../core/index.dart';
import '../view_model/profile_detail_view_model.dart';

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
    final start = DateTime(
      startDate.year,
      startDate.month,
      startDate.day,
    );

    final today = DateTime(
      now.year,
      now.month,
      now.day,
    );

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

            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  /// HEADER
                 _premiumHeader(user, currentEducation),
                  const SizedBox(height: 18),
                  if (user.servingNoticePeriod == true && noticeData != null)
                    Column(
                      children: [
                        _modernSection(
                          title: "Notice Period",
                          icon: Icons.timer_outlined,

                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: _smallInfoCard(
                                      "Notice Days",
                                      user.noticePeriod ?? "0",
                                      Icons.date_range,
                                    ),
                                  ),

                                  const SizedBox(width: 12),

                                  Expanded(
                                    child: _smallInfoCard(
                                    "${noticeData["daysRemaining"]} Days Left",
                                      noticeData["daysRemaining"].toString(),
                                      Icons.timelapse,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 14),

                              Row(
                                children: [
                                  Expanded(
                                    child: _smallInfoCard(
                                   "${noticeData["daysPassed"]} Days Served",
                                      noticeData["daysPassed"].toString(),
                                      Icons.check_circle,
                                    ),
                                  ),

                                  const SizedBox(width: 12),

                                  Expanded(
                                    child: _smallInfoCard(
                                      "Last Working Day",
                                      noticeData["endDate"],
                                      Icons.event,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 16),

                              LinearProgressIndicator(
                                value:
                                    ((noticeData["daysPassed"] ?? 0) /
                                            ((int.tryParse(
                                                      user.noticePeriod ?? "1",
                                                    ) ??
                                                    1)
                                                .clamp(1, 999)))
                                        .clamp(0, 1),

                                backgroundColor: Colors.white12,

                                valueColor: AlwaysStoppedAnimation(
                                  noticeData["isExpired"]
                                      ? Colors.green
                                      : AppColors.kGreen,
                                ),
                              ),

                              const SizedBox(height: 10),

                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),

                                decoration: BoxDecoration(
                                  color: noticeData["isExpired"]
                                      ? Colors.green.withOpacity(.15)
                                      : Colors.orange.withOpacity(.15),

                                  borderRadius: BorderRadius.circular(30),
                                ),

                                child: Text(
                                  noticeData["isExpired"]
                                      ? "Notice Period Complete"
                                      : "Serving Notice Period",

                                  style: TextStyle(
                                    color: noticeData["isExpired"]
                                        ? Colors.green
                                        : Colors.orange,

                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 18),
                      ],
                    ),

                  /// ABOUT
                  _modernSection(
                    title: "About",
                    icon: Icons.person_outline,

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
                    title: "Profile",
                    icon: Icons.badge_outlined,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        _detailTile(
                          "Specialization",
                          currentEducation?.specialization,
                        ),
                        _detailTile("Current Company", user.currentCompany),

                        _detailTile("Phone", user.phone),

                        _detailTile("Gender", user.gender),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  /// SKILLS
                  _modernSection(
                    title: "Skills",
                    icon: Icons.code,

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


                  if ((user.languagesKnown ?? []).isNotEmpty)
                    _modernSection(
                      title: "Languages",
                      icon: Icons.language,

                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,

                        children: (user.languagesKnown ?? [])
                            .map((e) => _chip(e))
                            .toList(),
                      ),
                      
                    ),
                  const SizedBox(height: 18),

                  if ((user.domainKnowledge ?? []).isNotEmpty)
                    _modernSection(
                      title: "Domain Knowledge",
                      icon: Icons.psychology,

                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,

                        children: (user.domainKnowledge ?? [])
                            .map((e) => _chip(e))
                            .toList(),
                      ),
                    ),
                  const SizedBox(height: 18),

                  if ((user.toolsAndPlatforms ?? []).isNotEmpty)
                    _modernSection(
                      title: "Tools & Platforms",
                      icon: Icons.build,

                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,

                        children: (user.toolsAndPlatforms ?? [])
                            .map((e) => _chip(e))
                            .toList(),
                      ),
                    ),

                  /// INDUSTRIES + ROLES
               /// INDUSTRIES
if ((user.industry ?? []).isNotEmpty)
  _modernSection(
    title: "Industries",
    icon: Icons.business_outlined,

    child: Wrap(
      spacing: 10,
      runSpacing: 10,

      children: (user.industry ?? [])
          .map(
            (e) => _premiumChip(
              e,
              color: const Color(0xff5B8CFF),
              icon: Icons.business_center,
            ),
          )
          .toList(),
    ),
  ),

const SizedBox(height: 18),

/// ROLES
if ((user.jobRoles ?? []).isNotEmpty)
  _modernSection(
    title: "Roles",
    icon: Icons.work_outline,

    child: Wrap(
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
  ),

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
                      title: "Professional Details",
                      icon: Icons.workspace_premium_outlined,

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          /// CURRENT SALARY
                          if ((user.currentSalaryAmount?.isNotEmpty ?? false) ||
                              (user.currentSalaryCurrency?.isNotEmpty ?? false))
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

                  SizedBox(height: 10),

                  _modernSection(
                    title: "Education",
                    icon: Icons.school_outlined,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: (user.educations ?? [])
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
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          e.degree ?? '',

                                          style: const TextStyle(
                                            color: Colors.white,

                                            fontSize: 15,

                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),

                                      if (e.isCurrent == true)
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 5,
                                          ),

                                          decoration: BoxDecoration(
                                            color: AppColors.kGreen,

                                            borderRadius: BorderRadius.circular(
                                              30,
                                            ),
                                          ),

                                          child: const Text(
                                            "Current",

                                            style: TextStyle(
                                              color: Colors.black,

                                              fontSize: 10,

                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),

                                  const SizedBox(height: 6),

                                  Text(
                                    e.college ?? '',

                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),

                                  const SizedBox(height: 10),

                                  Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_month,
                                        color: Colors.grey,
                                        size: 15,
                                      ),

                                      const SizedBox(width: 6),

                                      Text(
                                        "${e.startDate ?? ''} - ${e.endDate ?? ''}",

                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 12),

                                  Text(
                                    e.yearOfGraduation ?? '-',

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

                  SizedBox(height: 10),

                  /// EXPERIENCE
                  _modernSection(
                    title: "Experience",
                    icon: Icons.work_history,

                    child: Column(
                      children: (user.experiences ?? [])
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
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          e.role ?? '',

                                          style: const TextStyle(
                                            color: Colors.white,

                                            fontSize: 15,

                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),

                                      if (e.isCurrent == true)
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 5,
                                          ),

                                          decoration: BoxDecoration(
                                            color: AppColors.kGreen,

                                            borderRadius: BorderRadius.circular(
                                              30,
                                            ),
                                          ),

                                          child: const Text(
                                            "Current",

                                            style: TextStyle(
                                              color: Colors.black,

                                              fontSize: 10,

                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),

                                  const SizedBox(height: 6),

                                  Text(
                                    e.company ?? '',

                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),

                                  const SizedBox(height: 10),

                                  Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_month,
                                        color: Colors.grey,
                                        size: 15,
                                      ),

                                      const SizedBox(width: 6),

                                      Text(
                                        "${e.startDate ?? ''} - ${e.endDate ?? ''}",

                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
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
                                  crossAxisAlignment: CrossAxisAlignment.start,

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

                                      style: const TextStyle(
                                        color: Colors.grey,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,

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

                                      style: const TextStyle(
                                        color: Colors.grey,
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
                      icon: Icons.emoji_events_outlined,

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
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Text(
                                      e.title ?? '-',

                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
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
                      icon: Icons.workspace_premium_outlined,

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
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Text(
                                      e.title ?? '-',

                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,

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
                                        onTap: () async {
                                          final uri = Uri.parse(e.url!);

                                          if (await canLaunchUrl(uri)) {
                                            await launchUrl(uri);
                                          }
                                        },

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
               
                  if ((user.github?.isNotEmpty ?? false)) ...[
                    const SizedBox(height: 12),

                    SizedBox(
                      width: double.infinity,

                      child: ElevatedButton.icon(
                        onPressed: () async {
                          final uri = Uri.parse(user.github!);

                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri);
                          }
                        },

                        icon: const Icon(Icons.code),

                        label: const Text("Open GitHub"),

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white12,

                          foregroundColor: Colors.white,

                          padding: const EdgeInsets.symmetric(vertical: 14),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ),
                  ],
                  if ((user.portfolio?.isNotEmpty ?? false)) ...[
                    const SizedBox(height: 12),

                    SizedBox(
                      width: double.infinity,

                      child: ElevatedButton.icon(
                        onPressed: () async {
                          final uri = Uri.parse(user.portfolio!);

                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri);
                          }
                        },

                        icon: const Icon(Icons.web),

                        label: const Text("Open Portfolio"),

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white12,

                          foregroundColor: Colors.white,

                          padding: const EdgeInsets.symmetric(vertical: 14),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ),
                  ],

                  const SizedBox(height: 15),
                  if ((user.resume?.isNotEmpty ?? false))
                    SizedBox(
                      width: double.infinity,

                      child: ElevatedButton.icon(
                        onPressed: () {
                          final url = user.resume;

                          if (url == null) {
                            Toasts.showInfoToast(
                              context,
                              message: 'No Resume Found!',
                            );
                            return;
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ResumeViewerPage(url: url),
                            ),
                          );
                        },

                        icon: const Icon(Icons.picture_as_pdf),

                        label: const Text("Open Resume"),

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white12,

                          foregroundColor: Colors.white,

                          padding: const EdgeInsets.symmetric(vertical: 14),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
Widget _modernSection({
  required String title,
  required IconData icon,
  required Widget child,
}) {
  return TweenAnimationBuilder<double>(
    tween: Tween(begin: 0, end: 1),
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeOut,
    builder: (context, value, widget) {
      return Transform.translate(
        offset: Offset(0, 20 * (1 - value)),
        child: Opacity(
          opacity: value,
          child: widget,
        ),
      );
    },

    child: Container(
      width: double.infinity,

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),

        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withOpacity(.06),
            Colors.white.withOpacity(.03),
          ],
        ),

        border: Border.all(
          color: Colors.white.withOpacity(.07),
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.22),
            blurRadius: 24,
            offset: const Offset(0, 14),
          ),
        ],
      ),

      child: Stack(
        children: [
          /// BACKGROUND GLOW
          Positioned(
            top: -25,
            right: -15,
            child: Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.kGreen.withOpacity(.08),
              ),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              /// PREMIUM HEADER
              Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),

                    padding: const EdgeInsets.all(12),

                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.kGreen,
                          AppColors.kGreen.withOpacity(.7),
                        ],
                      ),

                      borderRadius: BorderRadius.circular(18),

                      boxShadow: [
                        BoxShadow(
                          color: AppColors.kGreen.withOpacity(.30),
                          blurRadius: 16,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),

                    child: Icon(
                      icon,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),

                  const SizedBox(width: 14),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          title,

                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -.4,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          "Professional profile information",

                          style: TextStyle(
                            color: Colors.white.withOpacity(.45),
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.05),

                      borderRadius: BorderRadius.circular(30),

                      border: Border.all(
                        color: Colors.white.withOpacity(.05),
                      ),
                    ),

                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 7,
                          width: 7,
                          decoration: BoxDecoration(
                            color: AppColors.kGreen,
                            shape: BoxShape.circle,
                          ),
                        ),

                        const SizedBox(width: 6),

                        const Text(
                          "Active",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Container(
                margin: const EdgeInsets.symmetric(vertical: 18),

                height: 1,

                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.white.withOpacity(.08),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),

              /// SECTION CONTENT
              child,
            ],
          ),
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
  return TweenAnimationBuilder<double>(
    tween: Tween(begin: 0, end: 1),
    duration: const Duration(milliseconds: 900),
    curve: Curves.easeOut,
    builder: (context, value, child) {
      return Transform.translate(
        offset: Offset(0, 30 * (1 - value)),
        child: Opacity(
          opacity: value,
          child: child,
        ),
      );
    },
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff171C3A),
            Color(0xff232B5D),
            Color(0xff111111),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.35),
            blurRadius: 30,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: Stack(
        children: [
          /// GLOW CIRCLES
          Positioned(
            top: -40,
            right: -30,
            child: Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(.18),
              ),
            ),
          ),

          Positioned(
            bottom: -50,
            left: -30,
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.kGreen.withOpacity(.12),
              ),
            ),
          ),

          Column(
            children: [
              /// TOP ACTION ROW
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(.12),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.green.withOpacity(.25),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.verified,
                          color: Colors.green,
                          size: 14,
                        ),
                        SizedBox(width: 6),
                        Text(
                          "Verified Profile",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),

              const SizedBox(height: 24),

              /// AVATAR
              TweenAnimationBuilder<double>(
                tween: Tween(begin: .8, end: 1),
                duration: const Duration(milliseconds: 700),
                curve: Curves.elasticOut,
                builder: (context, scale, child) {
                  return Transform.scale(
                    scale: scale,
                    child: child,
                  );
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 105,
                      width: 105,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            AppColors.kGreen.withOpacity(.7),
                            Colors.black.withOpacity(.7),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withOpacity(.15),
                          width: 2,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 44,
                        backgroundColor: Colors.black,
                        child: Text(
                          user.name?.isNotEmpty == true
                              ? user.name![0].toUpperCase()
                              : "U",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 4,
                      right: 4,
                      child: Container(
                        height: 18,
                        width: 18,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              /// NAME
              Text(
                user.name ?? "",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -.5,
                ),
              ),

              const SizedBox(height: 8),

              /// COMPANY
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.06),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  user.currentCompany?.isNotEmpty == true
                      ? user.currentCompany!
                      : currentEducation?.college ?? "",
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              /// INFO ROW
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _topInfo(Icons.location_on_outlined, "Mumbai"),
                  _headerDivider(),
                  _topInfo(
                    Icons.work_outline,
                    "${user.experiences?.length ?? 0}+ Exp",
                  ),
                  _headerDivider(),
                  _topInfo(
                    Icons.code,
                    "${user.skills?.length ?? 0} Skills",
                  ),
                ],
              ),

              const SizedBox(height: 24),

              /// STATS
              Row(
                children: [
                  Expanded(
                    child: _premiumStatCard(
                      title: "Experience",
                      value: "${user.experiences?.length ?? 0}",
                      icon: Icons.work_outline,
                      gradient: const [
                        Color(0xff7F5AF0),
                        Color(0xff6246EA),
                      ],
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: _premiumStatCard(
                      title: "Skills",
                      value: "${user.skills?.length ?? 0}",
                      icon: Icons.auto_awesome,
                      gradient: const [
                        Color(0xff00C6FB),
                        Color(0xff005BEA),
                      ],
                    ),
                  ),

                  const SizedBox(width: 12),

                
                ],
              ),

              const SizedBox(height: 22),

           /// ACTION BUTTONS
Row(
  children: [
    /// RESUME
    Expanded(
      child: GestureDetector(
        onTap: (user.resume?.isNotEmpty ?? false)
            ? () {
                final url = user.resume;

                if (url == null) {
                  Toasts.showInfoToast(
                    context,
                    message: 'No Resume Found!',
                  );
                  return;
                }

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

    const SizedBox(width: 12),

    /// LINKEDIN
    Expanded(
      child: GestureDetector(
        onTap: (user.linkedin?.isNotEmpty ?? false)
            ? () async {
                final uri = Uri.parse(user.linkedin!);

                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                }
              }
            : null,
        child: _headerButton(
          icon: Icons.link,
          title: "LinkedIn",
          filled: true,
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
Widget _topInfo(IconData icon, String text) {
  return Row(
    children: [
      Icon(icon, size: 14, color: Colors.grey),
      const SizedBox(width: 5),
      Text(
        text,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}
Widget _premiumChip(
  String text, {
  required Color color,
  required IconData icon,
}) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),

    padding: const EdgeInsets.symmetric(
      horizontal: 14,
      vertical: 10,
    ),

    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          color.withOpacity(.22),
          color.withOpacity(.10),
        ],
      ),

      borderRadius: BorderRadius.circular(16),

      border: Border.all(
        color: color.withOpacity(.30),
      ),

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
        Icon(
          icon,
          color: color,
          size: 15,
        ),

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
Widget _headerDivider() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 12),
    height: 12,
    width: 1,
    color: Colors.white.withOpacity(.12),
  );
}

Widget _premiumStatCard({
  required String title,
  required String value,
  required IconData icon,
  required List<Color> gradient,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 16),
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: gradient),
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: gradient.first.withOpacity(.25),
          blurRadius: 18,
          offset: const Offset(0, 10),
        ),
      ],
    ),
    child: Column(
      children: [
        Icon(icon, color: Colors.white, size: 20),
        const SizedBox(height: 10),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 11,
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
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    height: 54,
    decoration: BoxDecoration(
      gradient: disabled
          ? null
          : filled
              ? LinearGradient(
                  colors: [
                    AppColors.kGreen,
                    AppColors.kGreen.withOpacity(.7),
                  ],
                )
              : null,
      color: disabled
          ? Colors.white.withOpacity(.05)
          : filled
              ? null
              : Colors.white.withOpacity(.06),
      borderRadius: BorderRadius.circular(18),
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
        Icon(
          icon,
          color: disabled ? Colors.grey : Colors.white,
          size: 18,
        ),

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
