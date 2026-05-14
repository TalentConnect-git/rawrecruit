import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/index.dart';
import '../../../../core/index.dart';
import '../view_model/profile_detail_view_model.dart';

class ProfileDetailView
    extends StatefulWidget {

  final String userId;

  const ProfileDetailView({
    super.key,
    required this.userId,
  });

  @override
  State<ProfileDetailView> createState() =>
      _ProfileDetailViewState();
}

class _ProfileDetailViewState
    extends State<ProfileDetailView> {
Map<String, dynamic>? calculateNoticePeriodStatus(
  String? startDateStr,
  String? totalDays,
) {

  if (startDateStr == null ||
      totalDays == null ||
      startDateStr.isEmpty ||
      totalDays.isEmpty) {
    return null;
  }

  final start = DateTime.parse(
    startDateStr,
  );

  final today = DateTime.now();

  final startDate = DateTime(
    start.year,
    start.month,
    start.day,
  );

  final currentDate = DateTime(
    today.year,
    today.month,
    today.day,
  );

  const msPerDay =
      Duration.millisecondsPerDay;

  final daysPassed =
      currentDate
              .difference(startDate)
              .inMilliseconds ~/
          msPerDay;

  final total =
      int.tryParse(totalDays) ?? 0;

  final daysRemaining =
      (total - daysPassed)
          .clamp(0, total);

  final endDate = startDate.add(
    Duration(days: total),
  );

  return {
    "daysPassed":
        daysPassed.clamp(0, total),

    "daysRemaining":
        daysRemaining,

    "endDate":
        "${endDate.day}/${endDate.month}/${endDate.year}",

    "isExpired":
        daysPassed >= total,
  };
}
  final vm = ProfileDetailViewModel();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance
        .addPostFrameCallback((_) {
      vm.fetchProfile(widget.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: vm,

      child: Consumer<
          ProfileDetailViewModel>(
        builder: (_, vm, __) {
          if (vm.viewState ==
              ViewState.busy) {
            return  Scaffold(
              backgroundColor:
                  AppColors.secBorder,

              body: Center(
                child:
                    CircularProgressIndicator(),
              ),
            );
          }

          final user = vm.user;
final noticeData =
    calculateNoticePeriodStatus(
  user?.noticePeriodStartDate,
  user?.noticePeriod,
);
          if (user == null) {
            return const Scaffold(
              body: Center(
                child: Text(
                  "No profile found",
                ),
              ),
            );
          }

          return Scaffold(
            backgroundColor:
                AppColors.secBorder,

            appBar: AppBar(
              backgroundColor:
                  AppColors.kCard,

              iconTheme:
                  const IconThemeData(
                color: Colors.white,
              ),

              title: const Text(
                "Profile",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),

        body: SingleChildScrollView(
  padding: const EdgeInsets.all(16),

  child: Column(
    crossAxisAlignment:
        CrossAxisAlignment.start,

    children: [

      /// HEADER
      Container(
        width: double.infinity,

        padding:
            const EdgeInsets.all(18),

        decoration: BoxDecoration(
          color: AppColors.kCard,

          borderRadius:
              BorderRadius.circular(22),

          border: Border.all(
            color:
                Colors.white.withOpacity(.05),
          ),
        ),

        child: Column(
          children: [

            CircleAvatar(
              radius: 42,

              backgroundColor:
                  AppColors.kGreen,

              child: Text(
                user.name
                            ?.isNotEmpty ==
                        true
                    ? user.name![0]
                        .toUpperCase()
                    : "U",

                style:
                    const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 14),

            Text(
              user.name ?? '',

              textAlign:
                  TextAlign.center,

              style:
                  const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight:
                    FontWeight.w700,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              user.currentCompany
                          ?.isNotEmpty ==
                      true
                  ? user.currentCompany!
                  : user.college ?? '',

              style:
                  const TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 18),

            Row(
              children: [

                Expanded(
                  child: _smallInfoCard(
                    "Experience",
                    "${user.experiences?.length ?? 0}",
                    Icons.work_outline,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _smallInfoCard(
                    "Skills",
                    "${user.skills?.length ?? 0}",
                    Icons.code,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      const SizedBox(height: 18),
if (user.servingNoticePeriod ==
        true &&
    noticeData != null)
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
                    user.noticePeriod ??
                        "0",
                    Icons.date_range,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _smallInfoCard(
                    "Days Left",
                    noticeData[
                            "daysRemaining"]
                        .toString(),
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
                    "Days Served",
                    noticeData[
                            "daysPassed"]
                        .toString(),
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
              value: ((noticeData[
                              "daysPassed"] ??
                          0) /
                      ((int.tryParse(
                                user.noticePeriod ??
                                    "1",
                              ) ??
                              1)
                          .clamp(1, 999)))
                  .clamp(0, 1),

              backgroundColor:
                  Colors.white12,

              valueColor:
                  AlwaysStoppedAnimation(
                noticeData["isExpired"]
                    ? Colors.green
                    : AppColors.kGreen,
              ),
            ),

            const SizedBox(height: 10),

            Container(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),

              decoration: BoxDecoration(
                color: noticeData[
                        "isExpired"]
                    ? Colors.green
                        .withOpacity(.15)
                    : Colors.orange
                        .withOpacity(.15),

                borderRadius:
                    BorderRadius.circular(
                        30),
              ),

              child: Text(
                noticeData["isExpired"]
                    ? "Notice Period Complete"
                    : "Serving Notice Period",

                style: TextStyle(
                  color: noticeData[
                          "isExpired"]
                      ? Colors.green
                      : Colors.orange,

                  fontWeight:
                      FontWeight.w600,
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

          style:
              const TextStyle(
            color: Colors.white70,
            height: 1.6,
            fontSize: 14,
          ),
        ),
      ),

      const SizedBox(height: 18),

      /// DETAILS GRID
      Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          Expanded(
            child: _modernSection(
              title: "Education",
              icon:
                  Icons.school_outlined,

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .start,

                children: [

                  _detailTile(
                    "Degree",
                    user.degree,
                  ),

                  _detailTile(
                    "College",
                    user.college,
                  ),

                  _detailTile(
                    "CGPA",
                    user.cgpa,
                  ),

                  _detailTile(
                    "Graduation",
                    user
                        .yearOfGraduation,
                  ),
                  
                ],
              ),
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: _modernSection(
              title: "Profile",
              icon:
                  Icons.badge_outlined,

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .start,

                children: [

                  _detailTile(
                    "Specialization",
                    user.specialization,
                  ),
_detailTile(
  "Current Company",
  user.currentCompany,
),
                  _detailTile(
                    "Email",
                    user.email,
                  ),

                  _detailTile(
                    "Phone",
                    user.phone,
                  ),

                  _detailTile(
                    "Gender",
                    user.gender,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      const SizedBox(height: 18),

      /// SKILLS
      _modernSection(
        title: "Skills",
        icon: Icons.code,

        child: Wrap(
          spacing: 8,
          runSpacing: 8,

          children:
              (user.skills ?? [])
                  .map(
                    (e) => Container(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),

                      decoration:
                          BoxDecoration(
                        color: Colors.white
                            .withOpacity(.06),

                        borderRadius:
                            BorderRadius.circular(
                                30),
                      ),

                      child: Text(
                        e,

                        style:
                            const TextStyle(
                          color:
                              Colors.white,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  )
                  .toList(),
        ),
      ),

      const SizedBox(height: 18),
const SizedBox(height: 18),

if ((user.languagesKnown ?? [])
    .isNotEmpty)
  _modernSection(
    title: "Languages",
    icon: Icons.language,

    child: Wrap(
      spacing: 8,
      runSpacing: 8,

      children:
          (user.languagesKnown ?? [])
              .map((e) => _chip(e))
              .toList(),
    ),
  ),
  const SizedBox(height: 18),

if ((user.domainKnowledge ?? [])
    .isNotEmpty)
  _modernSection(
    title: "Domain Knowledge",
    icon: Icons.psychology,

    child: Wrap(
      spacing: 8,
      runSpacing: 8,

      children:
          (user.domainKnowledge ?? [])
              .map((e) => _chip(e))
              .toList(),
    ),
  ),
  const SizedBox(height: 18),

if ((user.toolsAndPlatforms ?? [])
    .isNotEmpty)
  _modernSection(
    title: "Tools & Platforms",
    icon: Icons.build,

    child: Wrap(
      spacing: 8,
      runSpacing: 8,

      children:
          (user.toolsAndPlatforms ?? [])
              .map((e) => _chip(e))
              .toList(),
    ),
  ),
 
      /// INDUSTRIES + ROLES
      Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          Expanded(
            child: _modernSection(
              title: "Industries",
              icon:
                  Icons.business_outlined,

              child: Wrap(
                spacing: 8,
                runSpacing: 8,

                children:
                    (user.industry ?? [])
                        .map(
                          (e) => _chip(e),
                        )
                        .toList(),
              ),
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: _modernSection(
              title: "Roles",
              icon:
                  Icons.work_outline,

              child: Wrap(
                spacing: 8,
                runSpacing: 8,

                children:
                    (user.jobRoles ?? [])
                        .map(
                          (e) => _chip(e),
                        )
                        .toList(),
              ),
            ),
          ),
        ],
      ),

      const SizedBox(height: 18),
const SizedBox(height: 18),

/// PROFESSIONAL DETAILS
if (
    (user.locations ?? []).isNotEmpty ||
    (user.lookingFor ?? []).isNotEmpty ||
    (user.employmentType ?? []).isNotEmpty ||
    (user.certifications?.isNotEmpty ?? false) ||
    (user.currentSalaryAmount?.isNotEmpty ?? false) ||
    (user.expectedSalaryAmount?.isNotEmpty ?? false) ||
    (user.openToShift?.isNotEmpty ?? false)
)
  _modernSection(
    title: "Professional Details",
    icon: Icons.workspace_premium_outlined,

    child: Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,

      children: [

        /// CURRENT SALARY
        if ((user.currentSalaryAmount
                    ?.isNotEmpty ??
                false) ||
            (user.currentSalaryCurrency
                    ?.isNotEmpty ??
                false))
          _detailTile(
            "Current Salary",

            "${user.currentSalaryCurrency ?? ''} "
            "${user.currentSalaryAmount ?? ''}",
          ),

        /// EXPECTED SALARY
        if ((user.expectedSalaryAmount
                    ?.isNotEmpty ??
                false) ||
            (user.expectedSalaryCurrency
                    ?.isNotEmpty ??
                false))
          _detailTile(
            "Expected Salary",

            "${user.expectedSalaryCurrency ?? ''} "
            "${user.expectedSalaryAmount ?? ''}",
          ),

        /// OPEN TO SHIFT
        if ((user.openToShift
                ?.isNotEmpty ??
            false))
          _detailTile(
            "Open To Shift",
            user.openToShift,
          ),

        /// EMPLOYMENT TYPE
        if ((user.employmentType ?? [])
            .isNotEmpty) ...[

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

            children:
                (user.employmentType ??
                        [])
                    .map(
                      (e) => _chip(e),
                    )
                    .toList(),
          ),
        ],

        /// LOOKING FOR
        if ((user.lookingFor ?? [])
            .isNotEmpty) ...[

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

            children:
                (user.lookingFor ?? [])
                    .map(
                      (e) => _chip(e),
                    )
                    .toList(),
          ),
        ],

        /// PREFERRED LOCATIONS
        if ((user.locations ?? [])
            .isNotEmpty) ...[

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

            children:
                (user.locations ?? [])
                    .map(
                      (e) => _chip(e),
                    )
                    .toList(),
          ),
        ],

        /// CERTIFICATIONS
        if ((user.certifications
                    ?.isNotEmpty ??
                false)) ...[

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

            children:
                user.certifications!
                    .split(',')

                    .map(
                      (e) => _chip(
                        e.trim(),
                      ),
                    )
                    .toList(),
          ),
        ],
      ],
    ),
  ),

  SizedBox(height: 10,),
      /// EXPERIENCE
      _modernSection(
        title: "Experience",
        icon: Icons.work_history,

        child: Column(
          children:
              (user.experiences ?? [])
                  .map(
                    (e) => Container(
                      width:
                          double.infinity,

                      margin:
                          const EdgeInsets.only(
                        bottom: 14,
                      ),

                      padding:
                          const EdgeInsets.all(
                        14,
                      ),

                      decoration:
                          BoxDecoration(
                        color: Colors.white
                            .withOpacity(.04),

                        borderRadius:
                            BorderRadius.circular(
                                16),

                        border: Border.all(
                          color: Colors
                              .white
                              .withOpacity(.05),
                        ),
                      ),

                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,

                        children: [

                          Row(
                            children: [

                              Expanded(
                                child: Text(
                                  e.role ?? '',

                                  style:
                                      const TextStyle(
                                    color: Colors
                                        .white,

                                    fontSize:
                                        15,

                                    fontWeight:
                                        FontWeight
                                            .w700,
                                  ),
                                ),
                              ),

                              if (e.isCurrent ==
                                  true)
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(
                                    horizontal:
                                        10,
                                    vertical:
                                        5,
                                  ),

                                  decoration:
                                      BoxDecoration(
                                    color: AppColors
                                        .kGreen,

                                    borderRadius:
                                        BorderRadius.circular(
                                            30),
                                  ),

                                  child:
                                      const Text(
                                    "Current",

                                    style:
                                        TextStyle(
                                      color: Colors
                                          .black,

                                      fontSize:
                                          10,

                                      fontWeight:
                                          FontWeight
                                              .w700,
                                    ),
                                  ),
                                ),
                            ],
                          ),

                          const SizedBox(
                              height: 6),

                          Text(
                            e.company ?? '',

                            style:
                                const TextStyle(
                              color:
                                  Colors.grey,
                              fontSize: 13,
                            ),
                          ),

                          const SizedBox(
                              height: 10),

                          Row(
                            children: [

                              Icon(
                                Icons
                                    .calendar_month,
                                color: Colors
                                    .grey,
                                size: 15,
                              ),

                              const SizedBox(
                                  width: 6),

                              Text(
                                "${e.startDate ?? ''} - ${e.endDate ?? ''}",

                                style:
                                    const TextStyle(
                                  color: Colors
                                      .white70,
                                  fontSize:
                                      12,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(
                              height: 12),

                          Text(
                            e.description ??
                                '-',

                            style:
                                const TextStyle(
                              color:
                                  Colors.white70,
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
if ((user.leadershipExperiences ?? [])
    .isNotEmpty) ...[

  const SizedBox(height: 18),

  _modernSection(
    title: "Leadership Experience",
    icon: Icons.groups_2_outlined,

    child: Column(
      children:
          (user.leadershipExperiences ?? [])
              .map(
                (e) => Container(
                  width: double.infinity,

                  margin:
                      const EdgeInsets.only(
                    bottom: 14,
                  ),

                  padding:
                      const EdgeInsets.all(14),

                  decoration:
                      BoxDecoration(
                    color: Colors.white
                        .withOpacity(.04),

                    borderRadius:
                        BorderRadius.circular(
                            16),

                    border: Border.all(
                      color: Colors.white
                          .withOpacity(.05),
                    ),
                  ),

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,

                    children: [

                      Text(
                        e.role ?? '-',

                        style:
                            const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight:
                              FontWeight.w700,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        e.organization ?? '-',

                        style:
                            const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "${e.startDate ?? ''} - ${e.endDate ?? ''}",

                        style:
                            const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),

                      const SizedBox(height: 12),

                      Text(
                        e.description ?? '-',

                        style:
                            const TextStyle(
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
if ((user.internationalExperiences ??
    []).isNotEmpty) ...[

  const SizedBox(height: 18),

  _modernSection(
    title: "International Experience",
    icon: Icons.public,

    child: Column(
      children:
          (user
                  .internationalExperiences ??
              [])
              .map(
                (e) => Container(
                  width: double.infinity,

                  margin:
                      const EdgeInsets.only(
                    bottom: 14,
                  ),

                  padding:
                      const EdgeInsets.all(14),

                  decoration:
                      BoxDecoration(
                    color: Colors.white
                        .withOpacity(.04),

                    borderRadius:
                        BorderRadius.circular(
                            16),

                    border: Border.all(
                      color: Colors.white
                          .withOpacity(.05),
                    ),
                  ),

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,

                    children: [

                      Text(
                        e.role ?? '-',

                        style:
                            const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight:
                              FontWeight.w700,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        e.country ?? '-',

                        style:
                            const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "${e.startDate ?? ''} - ${e.endDate ?? ''}",

                        style:
                            const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),

                      const SizedBox(height: 12),

                      Text(
                        e.description ?? '-',

                        style:
                            const TextStyle(
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
      const SizedBox(height: 22),

      if ((user.linkedin
              ?.isNotEmpty ??
          false))
        SizedBox(
          width: double.infinity,

          child:
              ElevatedButton.icon(
            onPressed: () async {
              final uri = Uri.parse(
                user.linkedin!,
              );

              await launchUrl(uri);
            },

            icon:
                const Icon(Icons.link),

            label: const Text(
              "Open LinkedIn",
            ),

            style:
                ElevatedButton.styleFrom(
              backgroundColor:
                  AppColors.kGreen,

              foregroundColor:
                  Colors.white,

              padding:
                  const EdgeInsets.symmetric(
                vertical: 14,
              ),

              shape:
                  RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(
                        14),
              ),
            ),
          ),
        ),

const SizedBox(height: 12),
if ((user.github?.isNotEmpty ?? false)) ...[
  const SizedBox(height: 12),

  SizedBox(
    width: double.infinity,

    child: ElevatedButton.icon(
      onPressed: () async {
        final uri = Uri.parse(
          user.github!,
        );

        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },

      icon: const Icon(Icons.code),

      label: const Text(
        "Open GitHub",
      ),

      style:
          ElevatedButton.styleFrom(
        backgroundColor:
            Colors.white12,

        foregroundColor:
            Colors.white,

        padding:
            const EdgeInsets.symmetric(
          vertical: 14,
        ),

        shape:
            RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(
                  14),
        ),
      ),
    ),
  ),
],
if ((user.portfolio?.isNotEmpty ??
    false)) ...[
  const SizedBox(height: 12),

  SizedBox(
    width: double.infinity,

    child: ElevatedButton.icon(
      onPressed: () async {
        final uri = Uri.parse(
          user.portfolio!,
        );

        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },

      icon: const Icon(Icons.web),

      label: const Text(
        "Open Portfolio",
      ),

      style:
          ElevatedButton.styleFrom(
        backgroundColor:
            Colors.white12,

        foregroundColor:
            Colors.white,

        padding:
            const EdgeInsets.symmetric(
          vertical: 14,
        ),

        shape:
            RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(
                  14),
        ),
      ),
    ),
  ),
],
if ((user.resume?.isNotEmpty ??
    false))
  SizedBox(
    width: double.infinity,

    child: ElevatedButton.icon(
      onPressed: () async {
        final uri = Uri.parse(
          user.resume!,
        );

        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },

      icon: const Icon(
        Icons.picture_as_pdf,
      ),

      label: const Text(
        "Open Resume",
      ),

      style:
          ElevatedButton.styleFrom(
        backgroundColor:
            Colors.white12,

        foregroundColor:
            Colors.white,

        padding:
            const EdgeInsets.symmetric(
          vertical: 14,
        ),

        shape:
            RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(
                  14),
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
  return Container(
    width: double.infinity,

    padding:
        const EdgeInsets.all(16),

    decoration: BoxDecoration(
      color: AppColors.kCard,

      borderRadius:
          BorderRadius.circular(18),

      border: Border.all(
        color:
            Colors.white.withOpacity(.05),
      ),
    ),

    child: Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,

      children: [

        Row(
          children: [

            Icon(
              icon,
              color: AppColors.kGreen,
              size: 18,
            ),

            const SizedBox(width: 8),

            Text(
              title,

              style:
                  const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight:
                    FontWeight.w700,
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        child,
      ],
    ),
  );
}

Widget _smallInfoCard(
  String title,
  String value,
  IconData icon,
) {
  return Container(
    padding:
        const EdgeInsets.symmetric(
      vertical: 14,
    ),

    decoration: BoxDecoration(
      color:
          Colors.white.withOpacity(.05),

      borderRadius:
          BorderRadius.circular(16),
    ),

    child: Column(
      children: [

        Icon(
          icon,
          color: AppColors.kGreen,
          size: 20,
        ),

        const SizedBox(height: 8),

        Text(
          value,

          style:
              const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight:
                FontWeight.bold,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          title,

          style:
              const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}

Widget _detailTile(
  String title,
  String? value,
) {
  return Padding(
    padding:
        const EdgeInsets.only(
      bottom: 14,
    ),

    child: Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,

      children: [

        Text(
          title,

          style:
              const TextStyle(
            color: Colors.grey,
            fontSize: 11,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          (value?.isNotEmpty ?? false)
              ? value!
              : "-",

          style:
              const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight:
                FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

Widget _chip(String text) {
  return Container(
    padding:
        const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 8,
    ),

    decoration: BoxDecoration(
      color:
          Colors.white.withOpacity(.06),

      borderRadius:
          BorderRadius.circular(30),
    ),

    child: Text(
      text,

      style: const TextStyle(
        color: Colors.white,
        fontSize: 11,
      ),
    ),
  );
}
}