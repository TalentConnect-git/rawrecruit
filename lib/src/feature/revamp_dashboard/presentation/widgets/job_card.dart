import 'package:flutter/material.dart';
import 'package:rawrecruit/src/core/index.dart';

import '../../../../common/index.dart';

class JobCard extends StatelessWidget {
  final dynamic job;
  final bool isSaved;
  final bool isApplied;
  final VoidCallback onBookmarkToggle;
  final VoidCallback onApply;
  final VoidCallback onTap;

  const JobCard({
    super.key,
    required this.job,
    required this.isSaved,
    required this.isApplied,
    required this.onBookmarkToggle,
    required this.onApply,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    print("Job runtime type: ${job.runtimeType}");

    /// 🔹 DEFAULT SAFE VALUES
    String title = "Opportunity";
    String company = "Company";
    String workMode = "Remote";
    String location = "India";
    String salary = "Check details";

    int match = 0;

    int alumni = 0;

    /// ✅ UNIVERSAL SAFE PARSER
    try {
      final j = job;

      /// 🔥 TITLE
      title =
          (j?.jobTitle ??
                  j?.jobRoles?.first ??
                  j?["jobTitle"] ??
                  (j?["jobRoles"] is List && j["jobRoles"].isNotEmpty
                      ? j["jobRoles"][0]
                      : null) ??
                  "Opportunity")
              .toString();

      /// 🔥 COMPANY
      company =
          (j?.companyName ??
                  j?.companyPosted?.companyDetails?.companyName ??
                  j?["companyName"] ??
                  j?["companyPosted"]?["companyDetails"]?["companyName"] ??
                  "Company")
              .toString();

      /// 🔥 WORK MODE
      workMode =
          (j?.workMode?.isNotEmpty == true
                  ? j.workMode.first
                  : (j?["workMode"] is List && j["workMode"].isNotEmpty
                      ? j["workMode"][0]
                      : null) ??
                      "Remote")
              .toString();

      /// 🔥 LOCATION
      location =
          (j?.location?.isNotEmpty == true
                  ? j.location.first
                  : (j?["location"] is List && j["location"].isNotEmpty
                      ? j["location"][0]
                      : null) ??
                      "India")
              .toString();

      /// 🔥 SALARY (FIXED)
      final ctc =
          j?.packageDetails?.totalCTC ?? j?["packageDetails"]?["totalCTC"];

      if (ctc != null) {
        salary = ctc < 100000
            ? "₹$ctc / month"
            : _formatSalary(ctc);
      }

      /// 🔥 MATCH
      match = j?.matchScore ?? j?["matchScore"] ?? 0;
      alumni = j?.alumniCount ?? j?["alumniCount"] ?? 0;
    } catch (e) {
      /// NEVER BREAK UI
      print("JobCard parsing error: $e");
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.kTile,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 🔥 TITLE + MATCH %
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.s16W600.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
                Text(
                  "$match% match",
                  style: AppTextStyles.s12W600.copyWith(
                    color: AppColors.kGreen,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 6),

            /// 🔹 COMPANY + LOCATION + MODE
            Text(
              "$company • $location • $workMode",
              style: AppTextStyles.s12W400.copyWith(
                color: AppColors.white.withOpacity(0.6),
              ),
            ),

            const SizedBox(height: 10),

            /// 🔹 BOTTOM ROW
            Row(
              children: [
                Text(
                  salary,
                  style: AppTextStyles.s12W600.copyWith(
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(width: 10),

                
          

                Row(
                  children: [
                    Icon(Icons.school,
                        size: 14, color: AppColors.kGreen),
                    const SizedBox(width: 4),
                    Text(
                      "$alumni alumni",
                      style: AppTextStyles.s12W600.copyWith(
                        color: AppColors.kGreen,
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                GestureDetector(
                  onTap: onBookmarkToggle,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      isSaved
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                      key: ValueKey(isSaved),
                      color: isSaved
                          ? AppColors.kGreen
                          : AppColors.white.withOpacity(0.6),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

 String _formatSalary(int? ctc) {
  if (ctc == null) return "Not disclosed";

  if (ctc < 100000) {
    return "₹$ctc / month";
  }

  final lpa = (ctc / 100000).toStringAsFixed(0);
  return "₹$lpa LPA";
}
}