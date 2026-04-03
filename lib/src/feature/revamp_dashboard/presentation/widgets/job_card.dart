import 'package:flutter/material.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/entities/job_model.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/entities/internship_model.dart';
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
    /// 🔹 SAFE DATA EXTRACTION
    String title = "No Title";
    String company = "Unknown Company";
    String workMode = "On-site";
    String location = "India";
    String salary = "Not disclosed";

    if (job is JobModel) {
      final j = job as JobModel;

      title = j.jobTitle ?? "No Title";

      company = j.companyName ??
          j.companyPosted?.companyDetails?.companyName ??
          "Unknown Company";

      workMode = (j.workMode?.isNotEmpty ?? false)
          ? j.workMode!.first
          : "On-site";

      location = (j.location?.isNotEmpty ?? false)
          ? j.location!.first
          : (j.workLocation?.isNotEmpty ?? false)
              ? j.workLocation!.first
              : "India";

      salary = _formatSalary(j.packageDetails?.totalCTC);
    } else if (job is InternshipModel) {
      final j = job as InternshipModel;

      title = j.jobRoles?.isNotEmpty == true
          ? j.jobRoles!.first
          : "No Title";

      company =
          j.companyPosted?.companyDetails?.companyName ??
          "Unknown Company";

      workMode = (j.workMode?.isNotEmpty ?? false)
          ? j.workMode!.first
          : "On-site";

      location = (j.location?.isNotEmpty ?? false)
          ? j.location!.first
          : "India";

      salary = _formatSalary(j.packageDetails?.totalCTC);
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.kCard,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 🔥 TITLE + BOOKMARK
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

            const SizedBox(height: 6),

            /// 🔥 POSTED BY + APPLY BUTTON (NEW POSITION)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                     Icon(Icons.person_outline, size: 14,color: AppColors.kGreen,),
                    const SizedBox(width: 4),
                    Text(
                      "Posted by $company",
                      style: AppTextStyles.s12W400.copyWith(
                        color: AppColors.white.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),

                /// ✅ APPLY BUTTON HERE
                ElevatedButton(
                  onPressed: isApplied ? null : onApply,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.kGreen,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 6),
                  ),
                  child: Text(
                    isApplied ? "Applied" : "Apply",
                    style:  TextStyle(fontSize: 12,color: AppColors.white),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            /// 🔹 CHIPS
            Row(
              children: [
                _tag("0-1 years"),
                const SizedBox(width: 6),
                _tag(workMode),
              ],
            ),

            const SizedBox(height: 10),

            /// 🔹 LOCATION
            Row(
              children: [
                 Icon(Icons.location_on_outlined, size: 14,color: AppColors.kGreen,),
                const SizedBox(width: 4),
                Text(
                  location,
                  style: AppTextStyles.s12W400.copyWith(color: AppColors.white),
                ),
              ],
            ),

            const SizedBox(height: 6),

            /// 🔹 SALARY
            Text(
              salary,
              style: AppTextStyles.s14W600.copyWith(
                color: AppColors.kGreen,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: AppTextStyles.s12W600,
      ),
    );
  }

  String _formatSalary(int? ctc) {
    if (ctc == null) return "Not disclosed";
    final lpa = (ctc / 100000).toStringAsFixed(0);
    return "₹$lpa LPA";
  }
}