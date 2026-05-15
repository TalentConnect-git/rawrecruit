import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/feature/revamp_application/presentation/view_model/application_view_model.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/presentation/view_model/dashboard_view_model.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/presentation/widgets/alumni_card.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/presentation/widgets/job_card.dart';
import 'package:rawrecruit/src/feature/revamp_jobs/utils/enums.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/index.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/widgets/my_job_card.dart';
import 'package:rawrecruit/src/features/referral/presentation/index.dart';
import 'package:rawrecruit/src/features/referral/presentation/widgets/incoming_request_card.dart';

import '../../../core/index.dart';
import '../../../feature/revamp_referrer/utils/enums.dart';
import '../../professional/job_postng/presentation/entities/referral_application.dart';
import '../../professional/job_postng/presentation/view_model/posted_job_view_model.dart';
import '../../shortlist/presentation/view_model/shortlist_view_model.dart';

class ReferralHome extends StatefulWidget {
  const ReferralHome({super.key});

  @override
  State<ReferralHome> createState() => _ReferralHomeState();
}

class _ReferralHomeState extends State<ReferralHome> {
  final ReferralHomeViewModel referralHomeViewModel = ReferralHomeViewModel();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await referralHomeViewModel.getRequests();
      await postedJobViewModel.getPostedJobs();
      await postedJobViewModel.getJobs();
    });
  }

  final PostedJobViewModel postedJobViewModel = PostedJobViewModel();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: referralHomeViewModel),
        ChangeNotifierProvider.value(value: postedJobViewModel),
        ChangeNotifierProvider(
          create: (_) => DashboardViewModel()..getAlumniData(),
        ),

        ChangeNotifierProvider(
          create: (_) => MyProfileViewModel()
            ..getUser()
            ..getReferralMetrics(),
        ),

        /// 🔥 ADD THESE (missing!)
        ChangeNotifierProvider(create: (_) => ShortlistViewModel()),
        ChangeNotifierProvider(create: (_) => ApplicationViewModel()),
      ],
      child: Builder(
        // 👈 IMPORTANT
        builder: (context) {
          final shortlistVM = context.watch<ShortlistViewModel>();
          final applicationVM = context.watch<ApplicationViewModel>();

          return Scaffold(
            backgroundColor: AppColors.kBg,
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// 🔥 NEW HEADER
                  ReferralHomeHeader(vm: context.watch<MyProfileViewModel>()),

                  const SizedBox(height: 16),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 8,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.goNamed(
                              RouteNames.referrer,
                              extra: {
                                'userType': UserType.professional,
                                'applicationType':
                                    ProfessionalReferrerApplicationType
                                        .requestsReceived,
                              },
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              border: Border.all(
                                color: AppColors.white,
                                width: 0.5,
                              ),
                              color: Color(0xff222222),
                            ),
                            child: Text(
                              '${context.watch<ReferralHomeViewModel>().referralApplications.length} candidates waiting for response',
                              style: AppTextStyles.s12W400.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.goNamed(RouteNames.shortlist);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              border: Border.all(
                                color: AppColors.white,
                                width: 0.5,
                              ),
                              color: Color(0xff222222),
                            ),
                            child: Text(
                              '${context.watch<DashboardViewModel>().groupedAlumni.values.length} alumni from your network hiring',
                              style: AppTextStyles.s12W400.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// Post referral CTA
                  const ReferralTile(),

                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Incoming Requests',
                        style: AppTextStyles.s16W600.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.goNamed(
                            RouteNames.referrer,
                            extra: {
                              'userType': UserType.professional,
                              'applicationType':
                                  ProfessionalReferrerApplicationType
                                      .requestsReceived,
                            },
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            'View All',
                            style: AppTextStyles.s14W600.copyWith(
                              color: AppColors.kGreen,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  /// Incoming Requests List
                  Selector<ReferralHomeViewModel, List<ReferralApplication>>(
                    selector: (_, vm) => vm.referralApplications,
                    builder: (_, requests, __) => ListView.separated(
                      itemCount: requests.take(3).length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (_, _) => const SizedBox(height: 8),
                      itemBuilder: (_, index) {
                        log('Request $index: ${requests[index]}');
                        return IncomingRequestCard(request: requests[index]);
                      },
                    ),
                  ),
                  const SizedBox(height: 10),

                  /// 🔥 MY POSTED JOBS SECTION
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Alumni Hiring Network',
                        style: AppTextStyles.s16W600.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(RouteNames.shortlist);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          child: Text(
                            'View All',
                            style: AppTextStyles.s14W600.copyWith(
                              color: AppColors.kGreen,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Consumer<DashboardViewModel>(
                    builder: (context, vm, _) {
                      if (vm.groupedAlumni.isEmpty) {
                        return Text(
                          "No alumni available",
                          style: AppTextStyles.s14W400.copyWith(
                            color: AppColors.secText,
                          ),
                        );
                      }

                      return SizedBox(
                        height: 260,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: vm.groupedAlumni.values.take(3).length,
                          itemBuilder: (context, index) {
                            final jobs = vm.groupedAlumni.values
                                .toList()[index];

                            return AlumniCard(jobs: jobs);
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),

                  /// Jobs Section
                  /// Jobs Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Jobs For You',
                        style: AppTextStyles.s16W600.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(
                            RouteNames.application,
                            extra: {
                              'userType': UserType.professional,
                              'jobType': ProfessionalJobType.available,
                            },
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            'View All',
                            style: AppTextStyles.s14W600.copyWith(
                              color: AppColors.kGreen,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Consumer<PostedJobViewModel>(
                    builder: (context, vm, _) {
                      if (vm.isLoading) {
                        return const Center(child: AppLoadingIndicator());
                      }

                      if (vm.job.isEmpty) {
                        // 👈 your offcampus list
                        return Text(
                          "No jobs available",
                          style: AppTextStyles.s14W400.copyWith(
                            color: AppColors.secText,
                          ),
                        );
                      }

                      return ListView.separated(
                        itemCount: vm.job.length.clamp(0, 3),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (_, __) => const SizedBox(height: 8),
                        itemBuilder: (_, index) {
                          final job = vm.job[index];

                          final isSaved = shortlistVM.savedJobIds.contains(
                            job.id,
                          );
                          final isApplied = applicationVM.isApplied(
                            job.id ?? '',
                          );

                          return JobCard(
                            job: job,
                            isSaved: isSaved,
                            isApplied: isApplied,
                            onApply: () => applicationVM.apply(
                              jobId: job.id ?? '',
                              jobType: 'Referral',
                              companyName:
                                  job.companyName ?? '', // or pass manually
                            ),
                            onBookmarkToggle: () {
                              shortlistVM.toggleSave(
                                jobId: job.id ?? '',
                                jobType: "Referral",
                                isSaved: isSaved,
                              );
                            },
                            onTap: () {
                              final candidate = job.candidatePosted;

                              final company =
                                  candidate?.currentCompany?.trim() ?? "";

                              context.pushNamed(
                                RouteNames.referralDetail,

                                extra: "${job.id}|||$company",
                              );
                            },
                          );
                        },
                      );
                    },
                  ),

                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My Posted Jobs',
                        style: AppTextStyles.s16W600.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(
                            RouteNames.application,
                            extra: {
                              'userType': UserType.professional,
                              'jobType': ProfessionalJobType.posted,
                            },
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            'View All',
                            style: AppTextStyles.s14W600.copyWith(
                              color: AppColors.kGreen,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Consumer<PostedJobViewModel>(
                    builder: (context, vm, _) {
                      if (vm.isLoading) {
                        return const Center(child: AppLoadingIndicator());
                      }

                      if (vm.jobs.isEmpty) {
                        return Text(
                          "No jobs posted yet",
                          style: AppTextStyles.s14W400.copyWith(
                            color: AppColors.secText,
                          ),
                        );
                      }

                      return ListView.separated(
                        itemCount: vm.jobs.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (_, __) => const SizedBox(height: 8),
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
                  ),
                ],
              ),
            ),
          );
        }, // 👈 closes Builder
      ),
    ); // 👈 closes MultiProvider
  }
}
