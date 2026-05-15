import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/feature/revamp_application/presentation/view_model/application_view_model.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/presentation/widgets/job_card.dart';
import 'package:rawrecruit/src/feature/revamp_jobs/utils/enums.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/view_model/posted_job_view_model.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/widgets/my_job_card.dart';
import 'package:rawrecruit/src/features/shortlist/presentation/view_model/shortlist_view_model.dart';

import '../../../common/index.dart';
import '../../../core/index.dart';
import '../../revamp_dashboard/presentation/view_model/dashboard_view_model.dart';

class ProfessionalJobsView extends StatefulWidget {
  const ProfessionalJobsView({this.selectedType, super.key});
  final ProfessionalJobType? selectedType;

  @override
  State<ProfessionalJobsView> createState() => _ProfessionalJobsViewState();
}

class _ProfessionalJobsViewState extends State<ProfessionalJobsView> {
  ProfessionalJobType selectedTab = ProfessionalJobType.available;

  @override
  void initState() {
    super.initState();
    selectedTab = widget.selectedType ?? ProfessionalJobType.available;
  }

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
  child: Builder(
    builder: (context) {
      return RefreshIndicator(
        color: AppColors.kGreen,

        onRefresh: () async {
          await context
              .read<DashboardViewModel>()
              .getJobs();

          await context
              .read<DashboardViewModel>()
              .fetchProfessionalData();

          await context
              .read<PostedJobViewModel>()
              .getPostedJobs();

          await context
              .read<PostedJobViewModel>()
              .getJobs();

          await context
              .read<ShortlistViewModel>()
              .fetchSaved();

          await context
              .read<ApplicationViewModel>()
              .fetchApplications();
        },

        child: _buildBody(),
      );
    },
  ),
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
    return Row(children: [...ProfessionalJobType.values.map((t) => _tab(t))]);
  }

  Widget _tab(ProfessionalJobType type) {
    final isSelected = selectedTab == type;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedTab = type),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.kGreen : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              type.label,
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
      case ProfessionalJobType.available:
        return _availableJobs();
      case ProfessionalJobType.posted:
        return _postedJobs();
      case ProfessionalJobType.saved:
        return _savedJobs();
    }
  }

  /// 🔥 AVAILABLE TAB (UPDATED)
  Widget _availableJobs() {
    return Consumer2<DashboardViewModel, ShortlistViewModel>(
      builder: (context, vm, shortlistVM, _) {
        final applicationVM = context.watch<ApplicationViewModel>();

        return ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            if (getIt<AppStateProvider>().userType !=
                UserType.professional) ...[
              /// 🔥 OFF CAMPUS SECTION
              const SizedBox(height: 12),
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
                    onApply: () => applicationVM.apply(
                      jobId: job.id ?? '',
                      jobType: "Off-campus",
                    ),
                    onBookmarkToggle: () {
                      shortlistVM.toggleSave(
                        jobId: job.id ?? '',
                        jobType: "Off-campus",
                        isSaved: isSaved,
                      );
                    },
                    onTap: () {
                      context.pushNamed(RouteNames.jobDetail, extra: job);
                    },
                  );
                }),
            ],

            const SizedBox(height: 12),

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
                  onApply: () => applicationVM.apply(
                    jobId: job.id ?? '',
                    jobType: "Referral",
                  ),
                  onBookmarkToggle: () {
                    shortlistVM.toggleSave(
                      jobId: job.id ?? '',
                      jobType: "Referral",
                      isSaved: isSaved,
                    );
                  },
                  onTap: () {
                    context.pushNamed(RouteNames.referralDetail, extra: job.id);
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
        return ListView(
  physics: const AlwaysScrollableScrollPhysics(),

  children: const [
    SizedBox(height: 250),

    Center(
      child: Text(
        "No posted jobs",
        style: TextStyle(color: Colors.grey),
      ),
    ),
  ],
);
        }

        return ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: vm.jobs.length,
          itemBuilder: (_, index) {
            final job = vm.jobs[index];

            return MyJobCard(
              job: job,
              onTap: () {
                context.pushNamed(RouteNames.referralPostDetail, extra: job);
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
         return ListView(
  physics: const AlwaysScrollableScrollPhysics(),

  children: const [
    SizedBox(height: 250),

    Center(
      child: Text(
        "No saved jobs",
        style: TextStyle(color: Colors.grey),
      ),
    ),
  ],
);
        }

        return ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
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
              onApply: () => applicationVM.apply(
                jobId: job.id ?? '',
                jobType: item.jobType ?? "Off-campus",
              ),
              onBookmarkToggle: () {
                vm.toggleSave(
                  jobId: job.id ?? '',
                  jobType: item.jobType ?? '',
                  isSaved: isSaved,
                );
              },
              onTap: () {
                if (job.jobType == "Referral") {
                  context.pushNamed(RouteNames.referralDetail, extra: job.id);
                } else {
                  context.pushNamed(RouteNames.jobDetail, extra: job);
                }
              },
            );
          },
        );
      },
    );
  }
}
