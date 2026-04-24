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
      final results = await Future.wait([
        myProfileViewModel.getCandidateStats(),
        myProfileViewModel.getCareerInsights(), // 🔥 THIS WAS MISSING
      ]);

      results[0]?.showError(context); // candidate stats error
      results[1]?.showError(context); // career insights error
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

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InfoChip(
                          text:
                              "you have applied to ${context.watch<ApplicationViewModel>().appliedApplications.length} applications",
                        ),

                        const SizedBox(width: 8),

                        InfoChip(
                          text:
                              "${context.watch<DashboardViewModel>().groupedAlumni.values.length} alumni hiring in your network",
                        ),

                        const SizedBox(width: 8),

                        InfoChip(
                          text:
                              "you have ${context.watch<ShortlistViewModel>().savedJobIds.length} saved jobs",
                        ),
                      ],
                    ),
                  ),

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
            _SectionHeader(
              title: "My Applications",
              onTap: () {
                context.pushNamed(
                  RouteNames.referrer,
                  extra: {'userType': UserType.fresher},
                );
              },
            ),

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
            _SectionHeader(
              title: "Alumni Hiring Network",
              onTap: () {
                context.pushNamed(
                  RouteNames.shortlist,
                  extra: {'userType': UserType.fresher},
                );
              },
            ),

            SizedBox(
              height: 240,
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
            _SectionHeader(
              title: "Referral Jobs for You",
              onTap: () {
                context.pushNamed(
                  RouteNames.application,
                  extra: {
                    'userType': UserType.fresher,
                    'studentJobType': StudentJobType.referral,
                  },
                );
              },
            ),
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
            _SectionHeader(
              title: "Internship Opportunities",
              onTap: () {
                context.pushNamed(
                  RouteNames.application,
                  extra: {
                    'userType': UserType.fresher,
                    'studentJobType': StudentJobType.internship,
                  },
                );
              },
            ),
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
            _SectionHeader(
              title: "Off-Campus Drives",
              onTap: () {
                context.pushNamed(
                  RouteNames.application,
                  extra: {
                    'userType': UserType.fresher,
                    'studentJobType': StudentJobType.offCampus,
                  },
                );
              },
            ),
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
  final VoidCallback onTap;

  const _SectionHeader({required this.title, required this.onTap});

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
          GestureDetector(
            onTap: onTap,
            child: Text(
              "View All",
              style: TextStyle(
                color: AppColors.kGreen,
                fontWeight: FontWeight.w600,
              ),
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

class InfoChip extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const InfoChip({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          border: Border.all(color: AppColors.white, width: 0.5),
          color: const Color(0xff222222),
        ),
        child: Text(
          text,
          style: AppTextStyles.s12W400.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
