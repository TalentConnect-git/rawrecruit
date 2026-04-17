import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/feature/revamp_application/presentation/view_model/application_view_model.dart';
import 'package:rawrecruit/src/feature/revamp_application/presentation/widget/application_card.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/data/dashboard_provider.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/presentation/view_model/dashboard_view_model.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/presentation/widgets/dashboard_card.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/presentation/widgets/job_card.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/index.dart';
import 'package:rawrecruit/src/features/shortlist/presentation/view_model/shortlist_view_model.dart';

import 'widgets/alumni_card.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});
  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  MyProfileViewModel myProfileViewModel = MyProfileViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final failure = await myProfileViewModel.getCandidateStats();
      failure?.showError(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
        ChangeNotifierProvider(create: (_) => ShortlistViewModel()),
        ChangeNotifierProvider(create: (_) => DashboardViewModel()),
        ChangeNotifierProvider(create: (_) => ApplicationViewModel()),
        ChangeNotifierProvider<MyProfileViewModel>(
          create: (_) => myProfileViewModel,
        ),
      ],
      child: const _DashboardBody(),
    );
  }
}

class _DashboardBody extends StatelessWidget {
  const _DashboardBody();

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: AppColors.kBg,

          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  /// 🔥 NEW HEADER
                  DashboardCard(vm: context.watch<MyProfileViewModel>()),

                  const SizedBox(height: 16),

                  /// 🔥 NEW CAREER CARD
                  const _CareerReadinessCard(),

                  const SizedBox(height: 16),

                  // const _SortFilterRow(),
                  // const SizedBox(height: 16),
                  Expanded(child: const _DashboardCombinedView()),
                ],
              ),
            ),
          ),

          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     context.pushNamed(RouteNames.jobPosted);
          //   },
          //   child: Icon(Icons.add),
          // ),
        );
      },
    );
  }
}

class _DashboardCombinedView extends StatefulWidget {
  const _DashboardCombinedView();

  @override
  State<_DashboardCombinedView> createState() => _DashboardCombinedViewState();
}

class _DashboardCombinedViewState extends State<_DashboardCombinedView> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<DashboardViewModel>().getJobs();
      context.read<DashboardViewModel>().getInternships();
      context.read<DashboardViewModel>().fetchProfessionalData();
      context.read<DashboardViewModel>().getAlumniData();
      context.read<ShortlistViewModel>().fetchSaved();
      context.read<ApplicationViewModel>().fetchApplications();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardViewModel>(
      builder: (context, vm, _) {
        if (vm.viewState == ViewState.busy) {
          return const Center(child: CircularProgressIndicator());
        }

        final shortlistVM = context.watch<ShortlistViewModel>();
        final applicationVM = context.watch<ApplicationViewModel>();
        final all = applicationVM.appliedApplications;

        final referrals = all
            .where((e) => (e.jobType ?? "").toLowerCase() == "referral")
            .take(1)
            .toList();

        final internships = all
            .where((e) => (e.jobType ?? "").toLowerCase() == "internship")
            .take(1)
            .toList();

        final offCampus = all
            .where((e) => (e.jobType ?? "").toLowerCase() == "off-campus")
            .take(1)
            .toList();

        final mixed = [...referrals, ...internships, ...offCampus];
        return ListView(
          children: [
            /// 🔥 MY APPLICATIONS SECTION
            _SectionHeader(title: "My Applications"),

            if (applicationVM.appliedApplications.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "No Applications Yet",
                  style: TextStyle(color: Colors.grey),
                ),
              )
            else
              ...mixed.map((job) {
                return ApplicationCard(model: job);
              }),
            _SectionHeader(title: "Alumni Hiring Network"),

            SizedBox(
              height: 190,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: vm.groupedAlumni.values.take(3).length,
                itemBuilder: (context, index) {
                  final jobs = vm.groupedAlumni.values.toList()[index];
                  return AlumniCard(jobs: jobs);
                },
              ),
            ),

            /// 🔥 REFERRAL SECTION
            _SectionHeader(title: "Referral Jobs for You"),
            ...vm.referralJobs.take(3).map((job) {
              final isSaved = shortlistVM.savedJobIds.contains(job.id);
              final isApplied = applicationVM.isApplied(job.id ?? '');

              return JobCard(
                job: job,
                isSaved: isSaved,
                isApplied: isApplied,
                onApply: () => applicationVM.apply(
                  jobId: job.id ?? '',
                  jobType: 'Referral',
                ),
                onTap: () {
                  context.pushNamed(RouteNames.referralDetail, extra: job.id);
                },
                onBookmarkToggle: () {
                  shortlistVM.toggleSave(
                    jobId: job.id ?? '',
                    jobType: "Referral",
                    isSaved: isSaved,
                  );
                },
              );
            }),

            /// 🔥 INTERNSHIP SECTION
            _SectionHeader(title: "Internship Opportunities"),
            ...vm.internships.take(3).map((job) {
              final isSaved = shortlistVM.savedJobIds.contains(job.id);
              final isApplied = applicationVM.isApplied(job.id ?? '');

              return JobCard(
                job: job,
                isSaved: isSaved,
                isApplied: isApplied,
                onApply: () => applicationVM.apply(
                  jobId: job.id ?? '',
                  jobType: "Internship",
                ),
                onBookmarkToggle: () {
                  shortlistVM.toggleSave(
                    jobId: job.id ?? '',
                    jobType: "Internship",
                    isSaved: isSaved,
                  );
                },
                onTap: () async {
                  await context.pushNamed(
                    RouteNames.internshipDetail,
                    extra: job,
                  );
                  if (context.mounted) {
                    context.read<ShortlistViewModel>().fetchSaved();
                    context.read<ApplicationViewModel>().fetchApplications();
                  }
                },
              );
            }),

            /// 🔥 OFF CAMPUS SECTION
            _SectionHeader(title: "Off-Campus Drives"),
            ...vm.jobs.take(3).map((job) {
              final isSaved = shortlistVM.savedJobIds.contains(job.id);
              final isApplied = applicationVM.isApplied(job.id ?? '');

              return JobCard(
                job: job,
                isSaved: isSaved,
                isApplied: isApplied,
                onApply: () => applicationVM.apply(
                  jobId: job.id ?? '',
                  jobType: 'Off-campus',
                ),
                onBookmarkToggle: () {
                  shortlistVM.toggleSave(
                    jobId: job.id ?? '',
                    jobType: "Off-campus",
                    isSaved: isSaved,
                  );
                },
                onTap: () async {
                  await context.pushNamed(RouteNames.jobDetail, extra: job);
                  if (context.mounted) {
                    context.read<ShortlistViewModel>().fetchSaved();
                    context.read<ApplicationViewModel>().fetchApplications();
                  }
                },
              );
            }),
          ],
        );
      },
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "View All",
            style: TextStyle(
              color: AppColors.kGreen,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _SegmentToggle extends StatelessWidget {
  const _SegmentToggle();

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, provider, _) {
        return Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.white, width: 2),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth / 3;

              return Stack(
                children: [
                  ///  Sliding Background
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    left: provider.selectedTab.index * width,
                    child: Container(
                      width: width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.kGreen,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  /// Text Row
                  Row(
                    children: [
                      _segmentItem(
                        title: "Internships",
                        isSelected:
                            provider.selectedTab == DashboardTab.internships,
                        onTap: () =>
                            provider.changeTab(DashboardTab.internships),
                      ),
                      _segmentItem(
                        title: "Jobs",
                        isSelected: provider.selectedTab == DashboardTab.jobs,
                        onTap: () => provider.changeTab(DashboardTab.jobs),
                      ),
                      _segmentItem(
                        title: "Referrals",
                        isSelected:
                            provider.selectedTab == DashboardTab.referral,
                        onTap: () => provider.changeTab(DashboardTab.referral),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget _segmentItem({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class _CareerReadinessCard extends StatelessWidget {
  const _CareerReadinessCard();

  @override
  Widget build(BuildContext context) {
    final percent = 70; // 🔥 later from API

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.kCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.kBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔹 TITLE
          Row(
            children: [
              Icon(Icons.auto_awesome, color: AppColors.kGreen, size: 18),
              const SizedBox(width: 8),
              const Text(
                "Career Readiness",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          /// 🔹 PERCENT + TEXT
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "$percent%",
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  "ready for Backend Engineer roles",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// 🔹 PROGRESS BAR
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: percent / 100,
              minHeight: 8,
              backgroundColor: Colors.black.withOpacity(0.3),
              valueColor: AlwaysStoppedAnimation(AppColors.kGreen),
            ),
          ),

          const SizedBox(height: 12),

          /// 🔹 SKILLS CHIPS
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              _smallChip("System Design"),
              _smallChip("AWS"),
              _smallChip("Microservices"),
            ],
          ),
        ],
      ),
    );
  }
}

class _smallChip extends StatelessWidget {
  final String text;
  const _smallChip(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.kGreen.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.kBorder),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 11, color: AppColors.kGreen),
      ),
    );
  }
}
