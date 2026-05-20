import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/common/index.dart';

import '../../../../core/index.dart';

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
        context.pushNamed("alumniDetail", extra: jobs);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 14),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        width: 200,
        decoration: BoxDecoration(
          color: const Color(0xFF111827),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white.withOpacity(0.08)),
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

  backgroundImage:
      (candidate?.profileImage ?? '')
              .isNotEmpty
          ? NetworkImage(
              candidate!.profileImage!,
            )
          : null,

  child:
      (candidate?.profileImage ?? '')
              .isEmpty
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

                const SizedBox(height: 12),

                /// NAME
                Text(
                  name,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 4),

                // /// ROLE
                // Text(
                //   role,
                //   textAlign: TextAlign.center,
                //   maxLines: 1,
                //   overflow: TextOverflow.ellipsis,
                //   style: const TextStyle(color: Colors.grey, fontSize: 12),
                // ),

                // const SizedBox(height: 4),

                /// DESIGNATION + COMPANY
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        (candidate?.jobRoles != null &&
                                candidate!.jobRoles!.isNotEmpty)
                            ? candidate.jobRoles!.first
                            : '-',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        candidate?.currentCompany ?? 'Company', // ✅ FIXED
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                    candidate?.educations != null &&
        candidate!
            .educations!
            .isNotEmpty
    ? candidate
            .educations!
            .firstWhere(
              (e) =>
                  e.isCurrent ==
                  true,

              orElse: () =>
                  candidate
                      .educations!
                      .first,
            )
            .college ??
        '-'
    : '-',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
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
                        color: isHiring ? Colors.green : Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),

                    const SizedBox(width: 6),

                    Text(
                      isHiring ? "Hiring • $jobCount jobs" : "Not Hiring",
                      style: TextStyle(
                        color: isHiring ? Colors.green : Colors.red,
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
                  context.pushNamed(RouteNames.chatUser, extra: candidate);
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
