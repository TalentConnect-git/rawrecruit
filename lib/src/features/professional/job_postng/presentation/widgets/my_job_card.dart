import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/theme/theme_controller.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_post_model.dart';

import '../../../../../common/index.dart';

class MyJobCard extends StatelessWidget {
  final ReferralPostModel job;
  final VoidCallback? onTap;

  const MyJobCard({super.key, required this.job, this.onTap});

  @override
  Widget build(BuildContext context) {
    final title = job.jobTitle is List
        ? (job.jobTitle as List).join(", ")
        : job.jobTitle?.toString() ?? "Frontend Engineer";
    final location = job.location?.firstOrNull ?? "India";
    final workMode = job.workMode ?? "Remote";

    final salary = _formatSalary(job.packageDetails?.totalCTC);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.kTile,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: ThemeController.instance.isDark
                ? AppColors.border
                : const Color(0xFFE5E7EB), // subtle grey border
            width: 1,
          ),
          boxShadow: ThemeController.instance.isDark
              ? []
              : [
                  BoxShadow(
                    color: AppColors.shadow,
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔥 TITLE + STATUS CHIP
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

                _statusChip(!(job.inactive ?? false), job.approvalStatus),
              ],
            ),

            const SizedBox(height: 6),

            /// 🔹 COMPANY + LOCATION + MODE
            Text(
              " $location • $workMode",
              style: AppTextStyles.s12W400.copyWith(
                color: AppColors.white.withOpacity(0.6),
              ),
            ),

            const SizedBox(height: 8),

            /// 🔹 STATS ROW
            Row(
              children: [
                _iconText(
                  Icons.group_outlined,
                  "${job.metrics?.totalApplicationsReceived ?? 0} applications",
                ),
                const SizedBox(width: 12),

                _iconText(
                  Icons.send_outlined,
                  "${job.metrics?.totalReferredToCompany ?? 0} referred",
                ),
                const SizedBox(width: 12),

                Row(
                  children: [
                    Icon(Icons.school, size: 14, color: AppColors.kGreen),
                    const SizedBox(width: 4),
                    Text(
                      "0 alumni",
                      style: AppTextStyles.s12W600.copyWith(
                        color: AppColors.kGreen,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),

            /// 🔹 SALARY
            Text(
              salary,
              style: AppTextStyles.s12W600.copyWith(color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔥 STATUS CHIP (LIVE / PENDING / APPROVED)
  Widget _statusChip(bool active, String? status) {
    final isApproved = status?.toLowerCase() == "approved";

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isApproved
            ? active
                  ? AppColors.kGreen.withOpacity(0.15)
                  : AppColors.errorBorder.withOpacity(0.15)
            : Colors.orange.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        isApproved
            ? active
                  ? "live"
                  : 'paused'
            : (status ?? "pending"),
        style: AppTextStyles.s12W600.copyWith(
          color: isApproved
              ? active
                    ? AppColors.kGreen
                    : AppColors.errorBorder
              : Colors.orange,
        ),
      ),
    );
  }

  Widget _iconText(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 14, color: AppColors.white.withOpacity(0.6)),
        const SizedBox(width: 4),
        Text(
          text,
          style: AppTextStyles.s12W400.copyWith(
            color: AppColors.white.withOpacity(0.6),
          ),
        ),
      ],
    );
  }

  String _formatSalary(int? ctc) {
    if (ctc == null) return "Not disclosed";

    if (ctc < 100000) {
      return "₹$ctc LPA";
    }

    final lpa = (ctc / 100000).toStringAsFixed(0);
    return "₹$lpa LPA";
  }
}
