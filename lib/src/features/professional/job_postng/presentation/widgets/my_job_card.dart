import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_post_model.dart';

import '../../../../../common/index.dart';

class MyJobCard extends StatelessWidget {
  final ReferralPostModel job;
  final VoidCallback? onTap;

  const MyJobCard({super.key, required this.job, this.onTap});

  @override
  Widget build(BuildContext context) {
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
            /// 🔹 Title + Bookmark
            Row(
              children: [
                Expanded(
                  child: Text(
                    job.jobTitle ?? '-',
                    style: AppTextStyles.s18W600.copyWith(
                      color: AppColors.text,
                    ),
                  ),
                ),

                _chip(job.approvalStatus ?? '-'),
              ],
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                _chip("YOE : ${job.yearsOfExperience}"),
                const SizedBox(width: 8),
                Text(job.workMode ?? '-', style: AppTextStyles.s12W400),
              ],
            ),

            const SizedBox(height: 10),

            Wrap(
              spacing: 8,
              runSpacing: 6,
              children: (job.skills ?? []).map((e) => _skillChip(e)).toList(),
            ),

            const SizedBox(height: 10),

            Text(
              job.description ?? '-',
              style: AppTextStyles.s12W400,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 14),

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
                          job.location?.firstOrNull ?? '-',
                          style: AppTextStyles.s12W400,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text("Package", style: AppTextStyles.s12W400),
                    Text(
                      job.packageDetails?.fixedPay.toString() ?? '-',
                      style: AppTextStyles.s14W600,
                    ),
                  ],
                ),

                if (job.approvalStatus == 'Approved')
                  ElevatedButton(
                    onPressed: () {
                      context.pushNamed(
                        RouteNames.postedJobApplication,
                        extra: job.id,
                      );
                    },
                    child: Text('View Applications'),
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
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: AppTextStyles.s12W600.copyWith(color: Colors.white),
      ),
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
}
