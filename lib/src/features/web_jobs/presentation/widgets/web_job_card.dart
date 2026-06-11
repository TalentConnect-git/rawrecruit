import 'package:flutter/material.dart';
import '../../../../common/index.dart';
import '../../data/entities/company_job.dart';

class WebJobCard extends StatelessWidget {
  final CompanyJob job;
  final VoidCallback? onTap;

  const WebJobCard({super.key, required this.job, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xff222222),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    job.title ?? '',
                    style: AppTextStyles.s16W600.copyWith(color: Colors.white),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.kGreen.withOpacity(.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${job.matchScore ?? 0}% Match',
                    style: AppTextStyles.s12W600.copyWith(
                      color: AppColors.kGreen,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            Text(
              job.companyName ?? '',
              style: AppTextStyles.s14W600.copyWith(color: AppColors.kGreen),
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  size: 16,
                  color: Colors.grey,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    job.location ?? 'Not specified',
                    style: AppTextStyles.s12W400.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                ),
              ],
            ),

            if ((job.workMode ?? '').isNotEmpty) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.work_outline, size: 16, color: Colors.grey),
                  const SizedBox(width: 6),
                  Text(
                    job.workMode ?? '',
                    style: AppTextStyles.s12W400.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ],

            if ((job.jdSnippet ?? '').isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(
                job.jdSnippet ?? '',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.s12W400.copyWith(color: Colors.white70),
              ),
            ],

            const SizedBox(height: 12),

            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'View Details →',
                style: AppTextStyles.s12W600.copyWith(color: AppColors.kGreen),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
