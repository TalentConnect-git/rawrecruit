import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/common/theme/theme_controller.dart';

import '../../../../core/index.dart';
import '../../../../core/models/experience.dart';

class AlumniCard extends StatelessWidget {
  final List<Job> jobs;

  const AlumniCard({super.key, required this.jobs});

  @override
  Widget build(BuildContext context) {
    if (jobs.isEmpty) {
      return const SizedBox(); // or empty container
    }

    final first = jobs.first;
    final candidate = first.candidatePosted;
    final currentExperience =
        (candidate?.experiences ?? []).any((e) => e.isCurrent == true)
        ? candidate!.experiences!.firstWhere((e) => e.isCurrent == true)
        : null;
    final currentStatus = candidate?.status;
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
    final currentEducation = (candidate?.educations?.isNotEmpty ?? false)
        ? candidate!.educations!.firstWhere(
            (e) => e.isCurrent == true,
            orElse: () => candidate.educations!.first,
          )
        : null;
    final name = candidate?.name ?? "User";
    // final role = first.jobTitle ?? "Professional";
    final initials = name.trim().isNotEmpty
        ? name
              .trim()
              .split(" ")
              .where((e) => e.trim().isNotEmpty)
              .map((e) => e[0])
              .take(2)
              .join()
        : "U";

    final referralJobs = candidate?.referralJobs ?? [];
    final jobCount = referralJobs.length;
    final isHiring = jobCount > 0;

    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        context.pushNamed(
          RouteNames.alumniDetail,
          extra: jobs.firstOrNull?.candidatePosted?.userId,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 14),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        width: 200,
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
        child: Column(
          mainAxisSize: MainAxisSize.min, // 🔥 prevents overflow
          children: [
            /// 🔹 TOP CONTENT
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// AVATAR
                CircleAvatar(
                  radius: 26,
                  backgroundColor: AppColors.kGreen,

                  backgroundImage: (candidate?.profileImage ?? '').isNotEmpty
                      ? NetworkImage(candidate!.profileImage!)
                      : null,

                  child: (candidate?.profileImage ?? '').isEmpty
                      ? Text(
                          initials,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        )
                      : null,
                ),

                const SizedBox(height: 12),

                /// NAME
                Text(
                  name,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 4),

                /// COMPANY
                if (currentExperience != null) ...[
                  if (currentExperience.company?.isNotEmpty == true)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.business_center_outlined,
                          size: 14,
                          color: AppColors.white.withOpacity(.7),
                        ),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            currentExperience.company!,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),

                  const SizedBox(height: 4),

                  if (currentExperience.role?.isNotEmpty == true)
                    Text(
                      currentExperience.role!,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: AppColors.secText, fontSize: 12),
                    ),
                ] else if (statusType.isNotEmpty &&
                    statusType != 'employed') ...[
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(.12),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      formattedStatus,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 6),

                /// COLLEGE
                if (currentEducation?.college?.isNotEmpty == true)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.school_outlined,
                        size: 14,
                        color: AppColors.kGreen,
                      ),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          currentEducation!.college!,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.kGreen,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 8),

                /// 🔹 HIRING STATUS
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: isHiring ? Colors.green : AppColors.secText,
                        shape: BoxShape.circle,
                      ),
                    ),

                    const SizedBox(width: 6),

                    Text(
                      isHiring ? "Hiring • $jobCount jobs" : "Not Hiring",
                      style: TextStyle(
                        color: isHiring ? Colors.green : AppColors.secText,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 12),

            /// 🔥 MESSAGE BUTTON
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                if (candidate != null) {
                  context.pushNamed(
                    RouteNames.chatUser,
                    extra: candidate.userId,
                  );
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.kGreen.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.message, size: 14, color: Colors.green),
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
      ),
    );
  }
}
