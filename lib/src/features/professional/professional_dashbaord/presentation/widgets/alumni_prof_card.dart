import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/features/professional/professional_dashbaord/data/entities/referral_job_model.dart';

class ProfAlumniCard extends StatelessWidget {
  final List<ReferralJobModel> jobs; // 👈 grouped jobs

  const ProfAlumniCard({super.key, required this.jobs});

  @override
  Widget build(BuildContext context) {
    final first = jobs.first;

    final name = first.candidatePosted?.name ?? "User";
    final role = first.jobTitle ?? "Professional";

    final initials = name.isNotEmpty
        ? name.split(" ").map((e) => e[0]).take(2).join()
        : "U";

    final jobCount = jobs.length;

    return GestureDetector(
      onTap: () {
        context.pushNamed("alumniDetail", extra: jobs.firstOrNull?.id);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 14),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
        width: 190,
        decoration: BoxDecoration(
          color: const Color(0xFF111827), // 🔥 DARK CARD
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white.withOpacity(0.08)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// 🔥 CIRCLE INITIALS (GREEN)
            CircleAvatar(
              radius: 26,
              backgroundColor: AppColors.kGreen,
              child: Text(
                initials,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 12),

            /// NAME
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 4),

            /// ROLE
            Text(
              role,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),

            const SizedBox(height: 10),

            /// 🔥 HIRING STATUS
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  "Hiring • $jobCount jobs",
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
