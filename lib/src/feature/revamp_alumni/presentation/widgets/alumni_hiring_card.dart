import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';

class AlumniHiringCard extends StatelessWidget {
  final List<Job> jobs;

  const AlumniHiringCard({super.key, required this.jobs});

  @override
  Widget build(BuildContext context) {
    final job = jobs.first;
    final candidate = job.candidatePosted;

    final name = candidate?.name ?? "User";

    final college = candidate?.college ?? "Your College";
    final year = "2024";
    final designation = "Software Engineer";
    final company = job.companyName ?? "Company Name";

    final location = job.location;

    final initials = name.isNotEmpty
        ? name.split(" ").map((e) => e[0]).take(2).join()
        : "U";

    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        context.pushNamed("alumniDetail", extra: jobs);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(18), // 🔥 increased padding
        decoration: BoxDecoration(
          color: const Color(0xFF111827),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white.withOpacity(0.06)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 Avatar (bigger)
            CircleAvatar(
              radius: 26, // 🔥 increased
              backgroundColor: AppColors.kGreen,
              child: Text(
                initials,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),

            const SizedBox(width: 14),

            /// 🔹 Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// 🔹 Name + Chips
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14, // 🔥 bigger
                          ),
                        ),
                      ),
                      _chip("Hiring", Colors.green),
                      const SizedBox(width: 6),
                      _chip("Refer", Colors.blue),
                    ],
                  ),

                  const SizedBox(height: 6),

                  /// 🔥 DESIGNATION + COMPANY
                  Text(
                    "$designation at $company",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 6),

                  /// 🔥 COLLEGE + YEAR
                  Text(
                    "$college • $year",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 10), // 🔥 more spacing

                  /// 🔹 Bottom Row
                  Row(
                    children: [
                      /// Location
                      Expanded(
                        child: Text(
                          location?.join(", ") ?? "",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      /// Jobs
                      Text(
                        "${jobs.length} open jobs available",
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(width: 12),

                      /// 🔥 Message Button (bigger)
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          if (candidate != null) {
                            context.pushNamed(
                              RouteNames.chatUser,
                              extra: candidate,
                            );
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.kGreen.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.message,
                                  size: 14, color: Colors.green),
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
          fontSize: 11, // 🔥 slightly bigger
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}