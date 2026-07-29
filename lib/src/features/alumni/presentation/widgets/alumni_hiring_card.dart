import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/common/theme/theme_controller.dart';
import 'package:rawrecruit/src/core/index.dart';

import '../../../../core/models/experience.dart';

class AlumniHiringCard extends StatelessWidget {
  final List<Job> jobs;

  const AlumniHiringCard({super.key, required this.jobs});

  @override
  Widget build(BuildContext context) {
    /// 🔥 SAFE CHECK
    if (jobs.isEmpty) {
      return const SizedBox();
    }

    final firstJob = jobs.first;

    final candidate = firstJob.candidatePosted;
    final currentStatus = candidate?.status;
    final statusType = currentStatus?.type;
    if (candidate == null) {
      return const SizedBox();
    }

    final referralJobs = candidate.referralJobs ?? [];

    final isHiring = referralJobs.isNotEmpty;

    final name = candidate.name ?? "User";
    final currentEducation =
        candidate.educations != null && candidate.educations!.isNotEmpty
        ? candidate.educations!.firstWhere(
            (e) => e.isCurrent == true,

            orElse: () => candidate.educations!.first,
          )
        : null;

    Experience? currentExp;

    if (candidate.experiences?.isNotEmpty ?? false) {
      currentExp = candidate.experiences!.firstWhere(
        (e) => e.isCurrent == true,
        orElse: () => candidate.experiences!.first,
      );
    }
    final college = currentEducation?.college;
    final year = currentEducation?.yearOfGraduation;

    final designation = currentExp?.role;
    final company = candidate.currentCompany;

    final initials = name.isNotEmpty
        ? name
              .split(" ")
              .where((e) => e.isNotEmpty)
              .map((e) => e[0])
              .take(2)
              .join()
        : "U";

    return InkWell(
      borderRadius: BorderRadius.circular(18),

      onTap: () {
        context.pushNamed(
          RouteNames.alumniDetail,
          extra: jobs.firstOrNull?.candidatePosted?.userId,
        );
      },

      child: Container(
        margin: const EdgeInsets.only(bottom: 14),

        padding: const EdgeInsets.all(18),
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
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            /// 🔥 AVATAR
            CircleAvatar(
              radius: 26,

              backgroundColor: AppColors.kGreen,

              backgroundImage: (candidate.profileImage ?? '').isNotEmpty
                  ? NetworkImage(candidate.profileImage!)
                  : null,

              child: (candidate.profileImage ?? '').isEmpty
                  ? Text(
                      initials,

                      style: const TextStyle(
                        color: Colors.black,

                        fontWeight: FontWeight.bold,

                        fontSize: 14,
                      ),
                    )
                  : null,
            ),

            const SizedBox(width: 14),

            /// 🔥 CONTENT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  /// NAME + CHIPS
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          name,

                          maxLines: 1,

                          overflow: TextOverflow.ellipsis,

                          style: TextStyle(
                            color: AppColors.white,

                            fontWeight: FontWeight.w600,

                            fontSize: 14,
                          ),
                        ),
                      ),

                      _chip(
                        isHiring ? "Hiring" : "Not Hiring",

                        isHiring ? Colors.green : AppColors.secText,
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  /// DESIGNATION + COMPANY
                  if ((designation?.isNotEmpty ?? false) ||
                      (company?.isNotEmpty ?? false))
                    Text(
                      [
                        if (designation?.isNotEmpty ?? false) designation,
                        if (company?.isNotEmpty ?? false) company,
                      ].join(' at '),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: AppColors.secText, fontSize: 13),
                    ),
                  if (statusType != null &&
                      statusType.isNotEmpty &&
                      statusType != "employed") ...[
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          size: 14,
                          color: Colors.orange.shade300,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            statusType
                                .replaceAll('_', ' ')
                                .split(' ')
                                .map(
                                  (e) => e.isEmpty
                                      ? e
                                      : e[0].toUpperCase() + e.substring(1),
                                )
                                .join(' '),
                            style: TextStyle(
                              color: Colors.orange.shade300,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                  const SizedBox(height: 6),

                  /// COLLEGE + YEAR
                  if ((college?.isNotEmpty ?? false) ||
                      (year?.toString().isNotEmpty ?? false))
                    Text(
                      [
                        if (college?.isNotEmpty ?? false) college,
                        if (year?.toString().isNotEmpty ?? false)
                          year.toString(),
                      ].join(' • '),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: AppColors.secText, fontSize: 13),
                    ),
                  const SizedBox(height: 10),

                  /// BOTTOM ROW
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          isHiring
                              ? "${referralJobs.length} open jobs available"
                              : "No jobs available",

                          overflow: TextOverflow.ellipsis,

                          style: TextStyle(
                            color: isHiring ? Colors.green : AppColors.secText,

                            fontSize: 10,

                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      /// MESSAGE BUTTON
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,

                        onTap: () {
                          context.pushNamed(
                            RouteNames.chatUser,

                            extra: candidate.userId,
                          );
                        },

                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,

                            vertical: 6,
                          ),

                          decoration: BoxDecoration(
                            color: AppColors.kGreen.withOpacity(0.15),

                            borderRadius: BorderRadius.circular(22),
                          ),

                          child: const Row(
                            mainAxisSize: MainAxisSize.min,

                            children: [
                              Icon(
                                Icons.message,

                                size: 14,

                                color: Colors.green,
                              ),

                              SizedBox(width: 6),

                              Text(
                                "Message",

                                style: TextStyle(
                                  color: Colors.green,

                                  fontSize: 12,

                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _chip(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),

      decoration: BoxDecoration(
        color: color.withOpacity(0.2),

        borderRadius: BorderRadius.circular(12),
      ),

      child: Text(
        text,

        style: TextStyle(
          color: color,

          fontSize: 11,

          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
