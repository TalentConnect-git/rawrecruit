import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/feature/revamp_application/presentation/view_model/application_view_model.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/data/dashboard_provider.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/presentation/view_model/dashboard_view_model.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/presentation/widgets/job_card.dart';

import 'package:rawrecruit/src/features/shortlist/presentation/view_model/shortlist_view_model.dart';

import '../../../core/index.dart';

class JobView extends StatefulWidget {
  const JobView({super.key});

  @override
  State<JobView> createState() => _JobViewState();
}

class _JobViewState extends State<JobView> {
  final viewModel = DashboardViewModel();

  @override
  void initState() {
    super.initState();

    viewModel.getJobs();

    /// 🔥 Fetch saved opportunities once
    Future.microtask(() {
      context.read<ShortlistViewModel>().fetchSaved();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<DashboardViewModel>(
        builder: (context, vm, _) {
          if (vm.viewState == ViewState.busy) {
            return const Center(child: CircularProgressIndicator());
          }

          /// 🔥 Apply filters
          final dashboardProvider = context.watch<DashboardProvider>();

          final filteredJobs = dashboardProvider.applyJobFilters(vm.jobs);

          /// 🔥 Read shortlist viewmodel
          final shortlistVM = context.watch<ShortlistViewModel>();
          final applicationVM = context.watch<ApplicationViewModel>();

          return ListView.builder(
            itemCount: filteredJobs.length,
            itemBuilder: (context, index) {
              final job = filteredJobs[index];

              /// 🔥 Check if saved
              final isSaved = shortlistVM.savedJobIds.contains(job.id);
    return JobCard(
                job: job, // ✅ THIS IS THE MAIN FIX
                isSaved: isSaved,
                onBookmarkToggle: () {
                  shortlistVM.toggleSave(
                    jobId: job.id ?? '',
                    jobType: "Off-campus",
                    isSaved: isSaved,
                  );
                },
                onApply: () {
                  applicationVM.apply(job.id ?? '');
                },
                isApplied: applicationVM.isApplied(job.id ?? ''),
              onTap: () async {
  await context.pushNamed(RouteNames.jobDetail, extra: job);
  if (context.mounted) {
    context.read<ShortlistViewModel>().fetchSaved();
    context.read<ApplicationViewModel>().fetchApplications();
  }
},
              );
            },
          );
        },
      ),
    );
  }
}
