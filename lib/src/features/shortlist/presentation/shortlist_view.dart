import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/feature/revamp_application/presentation/view_model/application_view_model.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/presentation/widgets/job_card.dart';
import 'package:rawrecruit/src/features/shortlist/presentation/view_model/shortlist_view_model.dart';

class ShortlistView extends StatefulWidget {
  const ShortlistView({super.key});

  @override
  State<ShortlistView> createState() => _ShortlistViewState();
}

class _ShortlistViewState extends State<ShortlistView> {
  final viewModel = ShortlistViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.fetchSaved();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: viewModel),
        ChangeNotifierProvider(
          create: (_) {
            final vm = ApplicationViewModel();

            vm.fetchApplications();

            return vm;
          },
        ),
      ],
      child: Consumer<ShortlistViewModel>(
        builder: (context, vm, _) {
          if (vm.viewState == ViewState.busy) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          final applicationVM = context.watch<ApplicationViewModel>();

          return Scaffold(
            backgroundColor: AppColors.secBorder,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Saved Opportunities",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),

                    const SizedBox(height: 16),

                    Expanded(
                      child: vm.saved.isEmpty
                          ? const Center(child: Text("No saved jobs"))
                          : ListView.builder(
                              itemCount: vm.saved.length,
                              itemBuilder: (context, index) {
                                final item = vm.saved[index];

                                if (item.job == null) {
                                  return const SizedBox();
                                }

                                final job = item.job!;

                                final isSaved = vm.savedJobIds.contains(job.id);

                                final isApplied = applicationVM.isApplied(
                                  job.id ?? '',
                                );

                                return JobCard(
                                  job: job,

                                  /// Bookmark
                                  isSaved: isSaved,
                                  onBookmarkToggle: () {
                                    vm.toggleSave(
                                      jobId: job.id ?? '',
                                      jobType: item.jobType ?? '',
                                      isSaved: isSaved,
                                    );
                                  },

                                  /// Apply
                                  isApplied: isApplied,
                                  onApply: () => applicationVM.apply(
                                    jobId: job.id ?? '',
                                    jobType:
                                        item.jobType ?? '', // or pass manually
                                    companyName: job.companyName ?? '',
                                  ),

                                  onTap: () {
                                    context.pushNamed(
                                      RouteNames.jobDetail,
                                      extra: job,
                                    );
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
      ),
    );
  }
}
