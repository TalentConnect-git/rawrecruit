import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/feature/revamp_application/presentation/view_model/application_view_model.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/presentation/widgets/job_card.dart';
import 'package:rawrecruit/src/features/shortlist/presentation/view_model/shortlist_view_model.dart';

import '../../../common/index.dart';
import '../../../core/index.dart';
import '../../revamp_dashboard/presentation/view_model/dashboard_view_model.dart';

class StudentJobsView extends StatefulWidget {
  const StudentJobsView({this.jobType, super.key});

  final StudentJobType? jobType;

  @override
  State<StudentJobsView> createState() => _StudentJobsViewState();
}

class _StudentJobsViewState extends State<StudentJobsView> {
  StudentJobType selectedTab = StudentJobType.referral;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        if (widget.jobType != null) {
          selectedTab = widget.jobType!;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DashboardViewModel()),
        ChangeNotifierProvider(create: (_) => ShortlistViewModel()),
        ChangeNotifierProvider(create: (_) => ApplicationViewModel()),
      ],
      child: Builder(
        builder: (context) {
          /// 🔥 LOAD DATA
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<DashboardViewModel>()
              ..getJobs()
              ..getInternships()
              ..fetchProfessionalData();

            context.read<ShortlistViewModel>().fetchSaved();
            context.read<ApplicationViewModel>().fetchApplications();
          });

          return Scaffold(
            backgroundColor: AppColors.kBg,
            body: Padding(
              padding: const EdgeInsets.all(16),
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
              .getInternships();

          await context
              .read<DashboardViewModel>()
              .fetchProfessionalData();

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

  /// 🔥 TABS (LIKE YOUR SCREENSHOT)
  Widget _buildTabs() {
    return Row(
      children: [
        ...StudentJobType.values.map((type) => _tab(type.label, type)),
      ],
    );
  }

  Widget _tab(String title, StudentJobType index) {
    final isSelected = selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedTab = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.kGreen : const Color(0xFF1F2937),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.white,
                fontSize: 12,
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
      case StudentJobType.referral:
        return _referralJobs();
      case StudentJobType.offCampus:
        return _offCampusJobs();
      case StudentJobType.internship:
        return _internships();
      case StudentJobType.saved:
        return _savedJobs();
    }
  }

  /// 🔥 REFERRAL TAB
  Widget _referralJobs() {
    return Consumer2<DashboardViewModel, ShortlistViewModel>(
      builder: (context, vm, shortlistVM, _) {
        final applicationVM = context.watch<ApplicationViewModel>();

        if (vm.referralJobs.isEmpty) return _empty();

        return ListView(
            physics: const AlwaysScrollableScrollPhysics(),
          children: vm.referralJobs.map((job) {
            return _jobCard(job, shortlistVM, applicationVM);
          }).toList(),
        );
      },
    );
  }

  /// 🔥 OFF CAMPUS TAB
  Widget _offCampusJobs() {
    return Consumer2<DashboardViewModel, ShortlistViewModel>(
      builder: (context, vm, shortlistVM, _) {
        final applicationVM = context.watch<ApplicationViewModel>();

        if (vm.jobs.isEmpty) return _empty();

        return ListView(
            physics: const AlwaysScrollableScrollPhysics(),
          children: vm.jobs.map((job) {
            return _jobCard(job, shortlistVM, applicationVM);
          }).toList(),
        );
      },
    );
  }

  /// 🔥 INTERNSHIP TAB
  Widget _internships() {
    return Consumer2<DashboardViewModel, ShortlistViewModel>(
      builder: (context, vm, shortlistVM, _) {
        final applicationVM = context.watch<ApplicationViewModel>();

        if (vm.internships.isEmpty) return _empty();

        return ListView(
            physics: const AlwaysScrollableScrollPhysics(),
          children: vm.internships.map((job) {
            return _jobCard(job, shortlistVM, applicationVM);
          }).toList(),
        );
      },
    );
  }

  /// 🔥 SAVED TAB
  Widget _savedJobs() {
    return Consumer<ShortlistViewModel>(
      builder: (context, vm, _) {
        final applicationVM = context.watch<ApplicationViewModel>();

        if (vm.saved.isEmpty) return _empty();

        return ListView(
            physics: const AlwaysScrollableScrollPhysics(),
          children: vm.saved.map((item) {
            final job = item.job;
            if (job == null) return const SizedBox();

            return _jobCard(job, vm, applicationVM);
          }).toList(),
        );
      },
    );
  }

  /// 🔥 COMMON CARD
  Widget _jobCard(
    Job job,
    ShortlistViewModel shortlistVM,
    ApplicationViewModel applicationVM,
  ) {
    final isSaved = shortlistVM.savedJobIds.contains(job.id);
    final isApplied = applicationVM.isApplied(job.id ?? '');

    return JobCard(
      job: job,
      isSaved: isSaved,
      isApplied: isApplied,
      onApply: () => applicationVM.apply(
        jobId: job.id ?? '',
        jobType: job.jobType ?? 'Off-campus',
      ),
      onBookmarkToggle: () {
        shortlistVM.toggleSave(
          jobId: job.id ?? '',
          jobType: job.jobType ?? '',
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
  }

 Widget _empty() {
  return ListView(
    physics: const AlwaysScrollableScrollPhysics(),

    children: const [
      SizedBox(height: 250),

      Center(
        child: Text(
          "No data available",
          style: TextStyle(color: Colors.grey),
        ),
      ),
    ],
  );
}
}
