import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/feature/revamp_application/presentation/view_model/application_view_model.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/presentation/view_model/dashboard_view_model.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/presentation/widgets/alumni_card.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/presentation/widgets/job_card.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/index.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/widgets/my_job_card.dart';
import 'package:rawrecruit/src/features/referral/presentation/index.dart';
import '../../../core/index.dart';
import '../../professional/job_postng/presentation/view_model/posted_job_view_model.dart';
import '../../shortlist/presentation/view_model/shortlist_view_model.dart';

class ReferralHome extends StatefulWidget {
  const ReferralHome({super.key});

  @override
  State<ReferralHome> createState() => _ReferralHomeState();
}

class _ReferralHomeState extends State<ReferralHome> {
  final ReferralHomeViewModel referralHomeViewModel =
      ReferralHomeViewModel();
@override
void initState() {
  super.initState();

  WidgetsBinding.instance.addPostFrameCallback((_) async {
    await postedJobViewModel.getPostedJobs();
    await postedJobViewModel.getJobs();
  });
}
final PostedJobViewModel postedJobViewModel =
    PostedJobViewModel();
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
    child: Builder( // 👈 IMPORTANT
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
ReferralHomeHeader(
  vm: context.watch<MyProfileViewModel>(),
),

              const SizedBox(height: 24),

              /// Post referral CTA
              const ReferralTile(),

              const SizedBox(height: 24),

              /// Incoming Requests Header
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       'Incoming Requests',
              //       style:
              //           AppTextStyles.s16W600.copyWith(color: Colors.white),
              //     ),
              //     Container(
              //       padding: const EdgeInsets.symmetric(
              //           horizontal: 12, vertical: 4),
              //       decoration: BoxDecoration(
              //         color: AppColors.kGreen,
              //         borderRadius: BorderRadius.circular(16),
              //       ),
              //       child: Text(
              //         '3 new',
              //         style: AppTextStyles.s14W600
              //             .copyWith(color: AppColors.kBg),
              //       ),
              //     ),
              //   ],
              // ),

              // const SizedBox(height: 12),

              // /// Incoming Requests List
              // ListView.separated(
              //   itemCount: 3,
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   separatorBuilder: (_, _) => const SizedBox(height: 8),
              //   itemBuilder: (_, index) {
              //     return ListTile(
              //       contentPadding: const EdgeInsets.symmetric(
              //           horizontal: 12, vertical: 4),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(12),
              //       ),
              //       tileColor: AppColors.kTile,
              //       leading: Container(
              //         padding: const EdgeInsets.all(8),
              //         decoration: BoxDecoration(
              //           color: AppColors.kGreen,
              //           borderRadius: BorderRadius.circular(8),
              //         ),
              //         child: Text(
              //           'JD',
              //           style: AppTextStyles.s16W600
              //               .copyWith(color: AppColors.kBg),
              //         ),
              //       ),
              //       title: Text(
              //         'John Doe',
              //         style: AppTextStyles.s16W600
              //             .copyWith(color: AppColors.white),
              //       ),
              //       subtitle: Text(
              //         'Java, Flutter',
              //         style: AppTextStyles.s16W600
              //             .copyWith(color: AppColors.secText),
              //       ),
              //       trailing: Text(
              //         'Review',
              //         style: AppTextStyles.s16W600
              //             .copyWith(color: AppColors.kGreen),
              //       ),
              //     );
              //   },
              // ),

              const SizedBox(height: 10),
/// 🔥 MY POSTED JOBS SECTION
const SizedBox(height: 24),

Text(
  'My Posted Jobs',
  style: AppTextStyles.s16W600.copyWith(color: Colors.white),
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
             
            const SizedBox(height: 24),

Text(
  'Alumni Hiring Network',
  style: AppTextStyles.s16W600.copyWith(color: Colors.white),
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
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: vm.groupedAlumni.values.take(3).length,
        itemBuilder: (context, index) {
          final jobs = vm.groupedAlumni.values.toList()[index];

          return AlumniCard(jobs: jobs);
        },
      ),
    );
  },
),
              const SizedBox(height: 24),

              /// Jobs Section
              Text(
                'Jobs For You',
                style:
                    AppTextStyles.s16W600.copyWith(color: Colors.white),
              ),

              const SizedBox(height: 12),

            Consumer<PostedJobViewModel>(
  builder: (context, vm, _) {
    if (vm.isLoading) {
      return const Center(child: AppLoadingIndicator());
    }

    if (vm.job.isEmpty) { // 👈 your offcampus list
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

          final isSaved =
                  shortlistVM.savedJobIds.contains(job.id);
              final isApplied =
                  applicationVM.isApplied(job.id ?? '');

              return JobCard(
                job: job,
                isSaved: isSaved,
                isApplied: isApplied,
onApply: () => applicationVM.apply(
  jobId: job.id ?? '',
  jobType: 'Referral', // or pass manually
),                onBookmarkToggle: () {
                  shortlistVM.toggleSave(
                    jobId: job.id ?? '',
                    jobType: "Referral",
                    isSaved: isSaved,
                  );
                },
                      onTap: () {
  context.pushNamed(
    RouteNames.referralDetail,
    extra: job.id, // ✅ ONLY ID
  );
}
              );
      },
    );
  },
),  ],
          ),
        ),
      );
    }, // 👈 closes Builder
  )); // 👈 closes MultiProvider
}
}