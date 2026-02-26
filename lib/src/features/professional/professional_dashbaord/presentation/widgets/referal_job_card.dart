import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart';
import '../../data/entities/referral_job_model.dart';
import 'package:flutter/material.dart';
import '../../data/entities/referral_job_model.dart';

class ReferralJobCard extends StatelessWidget {
  final ReferralJobModel job;
  final VoidCallback onApply;
  final VoidCallback onTap;
  final bool isApplied;

  const ReferralJobCard({
    super.key,
    required this.job,
    required this.onApply,
    required this.onTap,
    required this.isApplied,
  });

  @override
  Widget build(BuildContext context) {
    final package =
        "${job.packageDetails?.currency ?? ""} ${job.packageDetails?.totalCTC ?? 0}";

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 Title + Status
            Row(
              children: [
                Expanded(
                  child: Text(
                    job.jobTitle ?? "",
                    style: AppTextStyles.s18W600.copyWith(
                      color: AppColors.text,
                    ),
                  ),
                ),

                _statusChip(job.approvalStatus),
              ],
            ),

            const SizedBox(height: 8),

            /// 🔹 YOE + Work Mode
            Row(
              children: [
                _chip("YOE : ${job.yearsOfExperience ?? "-"}"),
                const SizedBox(width: 8),
                Text(job.workMode?.first ?? "", style: AppTextStyles.s12W400),
              ],
            ),

            const SizedBox(height: 10),

            /// 🔹 Skills
            Wrap(
              spacing: 8,
              runSpacing: 6,
              children: (job.skills ?? []).map((e) => _skillChip(e)).toList(),
            ),

            const SizedBox(height: 10),

            /// 🔹 Description
            Text(
              job.description ?? "",
              style: AppTextStyles.s12W400,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 14),

            /// 🔹 Bottom Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          job.location?.first ?? "",
                          style: AppTextStyles.s12W400,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text("Package", style: AppTextStyles.s12W400),
                    Text(package, style: AppTextStyles.s14W600),
                  ],
                ),

                ElevatedButton(
                  onPressed: isApplied ? null : onApply,
                  child: Text(isApplied ? "Applied" : "Apply"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _chip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: AppTextStyles.s12W600),
    );
  }

  Widget _skillChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: AppTextStyles.s12W600.copyWith(color: AppColors.primary),
      ),
    );
  }

  Widget _statusChip(String? status) {
    final isApproved = status?.toLowerCase() == "approved";

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isApproved
            ? Colors.green.withOpacity(0.1)
            : Colors.orange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status ?? "",
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: isApproved ? Colors.green : Colors.orange,
        ),
      ),
    );
  }
}
