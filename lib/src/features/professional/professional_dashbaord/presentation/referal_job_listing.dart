import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/features/professional/professional_dashbaord/presentation/view_model/prof_dashboard_view_model.dart';

import '../../../../core/index.dart';
import 'widgets/referal_job_card.dart';

class ProfessionalView extends StatefulWidget {
  const ProfessionalView({super.key});

  @override
  State<ProfessionalView> createState() => _ProfessionalViewState();
}

class _ProfessionalViewState extends State<ProfessionalView> {
  final viewModel = ProfessionalViewModel();

  @override
  void initState() {
    super.initState();
    _setHardcodedToken();
    viewModel.fetchProfessionalData();
  }

  Future<void> _setHardcodedToken() async {
    await SecretRepo.setString(
      'auth_token',
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2OTkwMjA1NTM2YzYzZGIzYjQxOTliNmUiLCJlbWFpbCI6ImdoYXdhbmVzbWl0aGFAZ21haWwuY29tIiwidXNlclR5cGUiOiJwcm9mZXNzaW9uYWwiLCJpYXQiOjE3NzE5MjAzMzMsImV4cCI6MTc3MjUyNTEzM30.kkIDxUgCsQ9UeXXJYdSR268WbVEsUySepbWuZYCuOLA",
    );
  }
@override
Widget build(BuildContext context) {
  return ChangeNotifierProvider.value(
    value: viewModel,
    child: Consumer<ProfessionalViewModel>(
      builder: (context, vm, _) {
        return Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              context.pushNamed(RouteNames.referralPost);
            },
            label: const Text("Post"),
            icon: const Icon(Icons.add),
          ),

          body: vm.viewState == ViewState.busy
              ? const Center(
                  child: CircularProgressIndicator(),
                )
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

                      ...vm.referralJobs.map(
                        (job) {
                          final isApplied =
                              vm.isReferralApplied(job.id ?? '');

                          return ReferralJobCard(
                            job: job,
                            isApplied: isApplied,
                            onApply: () async {
                              await vm.applyReferral(job.id ?? '');

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Applied Successfully",
                                  ),
                                ),
                              );
                            },
                            onTap: () {
                              context.pushNamed(
                                RouteNames.referralDetail,
                                extra: job.id,
                              );
                            },
                          );
                        },
                      ),
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
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(title),
          ],
        ),
      ),
    );
  }
}