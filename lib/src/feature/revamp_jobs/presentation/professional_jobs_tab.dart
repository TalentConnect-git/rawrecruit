import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/feature/revamp_application/presentation/view_model/application_view_model.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/presentation/widgets/job_card.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/view_model/posted_job_view_model.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/widgets/my_job_card.dart';
import 'package:rawrecruit/src/features/shortlist/presentation/view_model/shortlist_view_model.dart';

import '../../../common/index.dart';
import '../../../core/index.dart';
import '../../revamp_dashboard/presentation/view_model/dashboard_view_model.dart';
class ProfessionalJobsView extends StatefulWidget {
  const ProfessionalJobsView({super.key});

  @override
  State<ProfessionalJobsView> createState() => _ProfessionalJobsViewState();
}

class _ProfessionalJobsViewState extends State<ProfessionalJobsView> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DashboardViewModel()),
        ChangeNotifierProvider(create: (_) => PostedJobViewModel()),
        ChangeNotifierProvider(create: (_) => ShortlistViewModel()),
        ChangeNotifierProvider(create: (_) => ApplicationViewModel()),
      ],
      child: Builder(
        builder: (context) {
          /// 🔥 LOAD DATA
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<DashboardViewModel>()
              ..getJobs()
              ..fetchProfessionalData(); // ✅ IMPORTANT

            context.read<PostedJobViewModel>()
              ..getPostedJobs()
              ..getJobs();

            context.read<ShortlistViewModel>().fetchSaved();
            context.read<ApplicationViewModel>().fetchApplications();
          });

          return Scaffold(
            backgroundColor: AppColors.kBg,
            body: Padding(
              padding: const EdgeInsets.all(16), // ✅ ADDED PADDING
              child: Column(
                children: [
                  _buildTabs(),
                  const SizedBox(height: 10),

                  Expanded(
                    child: _buildBody(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// 🔥 TABS
  Widget _buildTabs() {
    return Row(
      children: [
        _tab("Available", 0),
        _tab("My Posted", 1),
        _tab("Saved", 2),
      ],
    );
  }

  Widget _tab(String title, int index) {
    final isSelected = selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedTab = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.kGreen : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 🔥 BODY SWITCH
  Widget _buildBody() {
    switch (selectedTab) {
      case 0:
        return _availableJobs();
      case 1:
        return _postedJobs();
      case 2:
        return _savedJobs();
      default:
        return const SizedBox();
    }
  }

  /// 🔥 AVAILABLE TAB (UPDATED)
 Widget _availableJobs() {
  return Consumer2<DashboardViewModel, ShortlistViewModel>(
    builder: (context, vm, shortlistVM, _) {
      final applicationVM = context.watch<ApplicationViewModel>();

      return ListView(
        children: [
          /// 🔥 OFF CAMPUS SECTION
          const Text(
            "Off-Campus Jobs",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),

          if (vm.jobs.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "No data available",
                style: TextStyle(color: Colors.grey),
              ),
            )
          else
            ...vm.jobs.map((job) {
              final isSaved = shortlistVM.savedJobIds.contains(job.id);
              final isApplied = applicationVM.isApplied(job.id ?? '');

              return JobCard(
                job: job,
                isSaved: isSaved,
                isApplied: isApplied,
                onApply: () => applicationVM.apply(job.id ?? ''),
                onBookmarkToggle: () {
                  shortlistVM.toggleSave(
                    jobId: job.id ?? '',
                    jobType: "Off-campus",
                    isSaved: isSaved,
                  );
                },
                onTap: () {
                  context.pushNamed(
                    RouteNames.jobDetail,
                    extra: job,
                  );
                },
              );
            }),

          const SizedBox(height: 20),

          /// 🔥 REFERRAL SECTION
          const Text(
            "Referral Jobs",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),

          if (vm.referralJobs.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "No data available",
                style: TextStyle(color: Colors.grey),
              ),
            )
          else
            ...vm.referralJobs.map((job) {
              final isSaved = shortlistVM.savedJobIds.contains(job.id);
              final isApplied = applicationVM.isApplied(job.id ?? '');

              return JobCard(
                job: job,
                isSaved: isSaved,
                isApplied: isApplied,
                onApply: () => applicationVM.apply(job.id ?? ''),
                onBookmarkToggle: () {
                  shortlistVM.toggleSave(
                    jobId: job.id ?? '',
                    jobType: "Referral",
                    isSaved: isSaved,
                  );
                },
                onTap: () {
                  context.pushNamed(
                    RouteNames.referralDetail,
                    extra: job.id,
                  );
                },
              );
            }),
        ],
      );
    },
  );
}

  /// 🔥 POSTED TAB
  Widget _postedJobs() {
    return Consumer<PostedJobViewModel>(
      builder: (context, vm, _) {
        if (vm.jobs.isEmpty) {
          return const Center(child: Text("No posted jobs"));
        }

        return ListView.builder(
          itemCount: vm.jobs.length,
          itemBuilder: (_, index) {
            final job = vm.jobs[index];

            return MyJobCard(
              job: job,
              onTap: () {
                context.pushNamed(
                  RouteNames.referralPostDetail,
                  extra: job,
                );
              },
            );
          },
        );
      },
    );
  }

  /// 🔥 SAVED TAB
  Widget _savedJobs() {
    return Consumer<ShortlistViewModel>(
      builder: (context, vm, _) {
        final applicationVM = context.watch<ApplicationViewModel>();

        if (vm.viewState == ViewState.busy) {
          return const Center(child: CircularProgressIndicator());
        }

        if (vm.saved.isEmpty) {
          return const Center(
            child: Text(
              "No saved jobs",
              style: TextStyle(color: Colors.grey),
            ),
          );
        }

        return ListView.builder(
          itemCount: vm.saved.length,
          itemBuilder: (_, index) {
            final item = vm.saved[index];
            final job = item.job;

            if (job == null) return const SizedBox();

            final isSaved = vm.savedJobIds.contains(job.id);
            final isApplied = applicationVM.isApplied(job.id ?? '');

            return JobCard(
              job: job,
              isSaved: isSaved,
              isApplied: isApplied,
              onApply: () => applicationVM.apply(job.id ?? ''),
              onBookmarkToggle: () {
                vm.toggleSave(
                  jobId: job.id ?? '',
                  jobType: item.jobType ?? '',
                  isSaved: isSaved,
                );
              },
              onTap: () {
                if (job.jobType == "Referral") {
                  context.pushNamed(
                    RouteNames.referralDetail,
                    extra: job.id,
                  );
                } else {
                  context.pushNamed(
                    RouteNames.jobDetail,
                    extra: job,
                  );
                }
              },
            );
          },
        );
      },
    );
  }
}