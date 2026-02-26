import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_application.dart';
import 'package:rawrecruit/src/features/professional/job_postng/utils/enum.dart';

class ApplicationListItem extends StatelessWidget {
  final ReferralApplication application;
  final void Function(ApplicationStatus) onApplyOrReject;
  final VoidCallback? onTap;
  const ApplicationListItem({
    super.key,
    required this.application,
    required this.onApplyOrReject,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final employmentType = application.applicant?.employmentType?.firstOrNull;

    final name = application.applicant?.name;

    final location = application.applicant?.locations?.firstOrNull;

    final status = application.currentStatus;

    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFDCE3F1),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Left Content
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(employmentType ?? '-', style: AppTextStyles.s16W600),
                const SizedBox(height: 6),
                Text(name ?? '-', style: AppTextStyles.s18W600),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16),
                    const SizedBox(width: 4),
                    Text(location ?? '-', style: AppTextStyles.s12W400),
                  ],
                ),
              ],
            ),

            /// Status Badge
            if (status != null && status != ApplicationStatus.pending)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: status.labelBGColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  status.label,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: status.labelColor,
                  ),
                ),
              )
            else
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 16,
                children: [
                  GestureDetector(
                    onTap: () {
                      onApplyOrReject.call(ApplicationStatus.accepted);
                    },
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.check, color: Colors.white, size: 20),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      onApplyOrReject.call(ApplicationStatus.rejected);
                    },
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.close, color: Colors.white, size: 20),
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
