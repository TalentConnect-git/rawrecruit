import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/presentation/widgets/job_card.dart';
import 'package:rawrecruit/src/features/professional/professional_dashbaord/presentation/view_model/prof_dashboard_view_model.dart';
import 'package:rawrecruit/src/features/shortlist/presentation/view_model/shortlist_view_model.dart';

import '../../../../core/index.dart';
import 'widgets/referal_job_card.dart';

class ReferralJobListing extends StatefulWidget {
  const ReferralJobListing({super.key});

  @override
  State<ReferralJobListing> createState() => _ReferalJobListingState();
}

class _ReferalJobListingState extends State<ReferralJobListing> {
  final viewModel = ProfessionalViewModel();
  final shortlistVm = getIt<ShortlistViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.fetchProfessionalData();
    shortlistVm.fetchSaved();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: viewModel),
        ChangeNotifierProvider.value(value: shortlistVm),
      ],
      child: Consumer<ProfessionalViewModel>(
        builder: (context, vm, _) {
          final shortlistVM = context.watch<ShortlistViewModel>();

          return Scaffold(
            backgroundColor: AppColors.secBorder,
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                context.pushNamed(RouteNames.referralPost);
              },
              label: const Text("Post"),
              icon: const Icon(Icons.add),
            ),

            body: vm.viewState == ViewState.busy
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.all(16),
                    child: ListView(
                      children: [
                        /// 🔥 Metrics
                        Row(
                          children: [
                            _metricBox(
                              "Total Jobs",
                              vm.metrics?.totalJobsPosted ?? 0,
                            ),
                            _metricBox(
                              "Approved",
                              vm.metrics?.approvedJobs ?? 0,
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        Row(
                          children: [
                            _metricBox(
                              "Rejected",
                              vm.metrics?.rejectedJobs ?? 0,
                            ),
                            _metricBox(
                              "Applications",
                              vm.metrics?.totalApplicationsDone ?? 0,
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        const Text(
                          "Referral Jobs",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 16),

                        ...vm.referralJobs.map((job) {
                          final isApplied = vm.isReferralApplied(job.id ?? '');

                          final isSaved = shortlistVM.savedJobIds.contains(
                            job.id,
                          );

                          return JobCard(
                            job: job,
                            isSaved: isSaved,
                            isApplied: isApplied,
                            onApply: () async {
                              await vm.applyReferral(job.id ?? '');

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Applied Successfully"),
                                ),
                              );
                            },
                            onTap: () {
                              context.pushNamed(
                                RouteNames.referralDetail,
                                extra: job.id,
                              );
                            },
                            onBookmarkToggle: () {
                              shortlistVM.toggleSave(
                                jobId: job.id ?? '',
                                jobType: "Off-campus",
                                isSaved: isSaved,
                              );
                            },
                          );
                        }),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }

  Widget _metricBox(String title, int value) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(6),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              value.toString(),
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(title),
          ],
        ),
      ),
    );
  }
}
