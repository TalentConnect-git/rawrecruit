import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/features/dashboard/data/dashboard_provider.dart';
import 'package:rawrecruit/src/features/dashboard/presentation/widgets/job_card.dart';

class ShortlistView extends StatelessWidget {
  const ShortlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, provider, _) {
        final shortlisted = provider.shortlistedJobs;

        return Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    "Browse your saved opportunities",
                    style: AppTextStyles.s22W600,
                  ),
                  const SizedBox(height: 20),

                  if (shortlisted.isEmpty)
                    const Expanded(
                      child: Center(
                        child: Text(
                          "No saved jobs yet",
                        ),
                      ),
                    )
                  else
                    Expanded(
                      child: ListView.builder(
                        itemCount:
                            shortlisted.length,
                        itemBuilder:
                            (context, index) {
                          final jobId =
                              shortlisted[index];
return JobCard(
  jobId: jobId,
  title: "Software Developer II",
  yoe: 2,
  workMode: "Remote/Hybrid",
  location: "Mumbai",
  package: "2.4 LPA",
  description:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
  skills: const ["Java", "VSCode"],
  onApply: () {
    provider.markApplied(jobId);
  },
);

                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
