import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../common/index.dart';
import '../../../core/index.dart';
import '../data/entities/web_job.dart';
import 'widgets/web_job_card.dart';

class WebJobsListView extends StatelessWidget {
  final CompanyJobsDiscovery jobsData;

  const WebJobsListView({super.key, required this.jobsData});

  @override
  Widget build(BuildContext context) {
    final jobs = jobsData.jobs ?? [];
    if (jobs.isEmpty) {
      return Scaffold(
        backgroundColor: AppColors.kBg,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.work_off_outlined,
                  size: 64,
                  color: Colors.grey,
                ),
                const SizedBox(height: 16),
                Text(
                  'No Jobs Available',
                  style: AppTextStyles.s20W600.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  'Try searching another company',
                  style: AppTextStyles.s14W400.copyWith(color: Colors.white70),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: AppColors.kBg,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                '${jobsData.companyName ?? ''} Jobs',
                style: AppTextStyles.s20W600.copyWith(color: Colors.white),
              ),
            ),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: jobs.length,
                itemBuilder: (_, index) {
                  final job = jobs[index];

                  return WebJobCard(
                    job: job,
                    onTap: () {
                      context.pushNamed(RouteNames.webJobDetail, extra: job);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
