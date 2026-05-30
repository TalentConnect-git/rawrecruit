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
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<DashboardViewModel>().getJobs();
      context.read<ShortlistViewModel>().fetchSaved();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardViewModel>(
      builder: (context, vm, _) {
        print("JOBS LENGTH: ${vm.jobs.length}");

        if (vm.viewState == ViewState.busy) {
          return const Center(child: CircularProgressIndicator());
        }

        /// 🔥 Apply filters
        final dashboardProvider = context.watch<DashboardProvider>();

        final jobsToShow = vm.jobs;

        /// 🔥 Read shortlist viewmodel
        final shortlistVM = context.watch<ShortlistViewModel>();
        final applicationVM = context.watch<ApplicationViewModel>();

        return ListView.builder(
          itemCount: jobsToShow.length,
          itemBuilder: (context, index) {
            final job = jobsToShow[index];

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
                applicationVM.apply(
                  jobId: job.id ?? '',
                  jobType: "Off-campus",
                  companyName: job.companyName ?? '',
                );
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
    );
  }
}
