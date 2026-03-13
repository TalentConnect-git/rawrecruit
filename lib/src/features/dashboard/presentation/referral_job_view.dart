import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/features/shortlist/presentation/view_model/shortlist_view_model.dart';

import '../../../core/index.dart';
import '../../professional/professional_dashbaord/presentation/view_model/prof_dashboard_view_model.dart';
import '../../professional/professional_dashbaord/presentation/widgets/referal_job_card.dart';

class ReferralJobView extends StatefulWidget {
  const ReferralJobView({super.key});

  @override
  State<ReferralJobView> createState() => _ReferralJobViewState();
}

class _ReferralJobViewState extends State<ReferralJobView> {
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
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                context.pushNamed(RouteNames.referralPost);
              },
              label: const Text("Post"),
              icon: const Icon(Icons.add),
            ),

            body: vm.viewState == ViewState.busy
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                    children: [
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

                        return ReferralJobCard(
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
          );
        },
      ),
    );
  }
}
