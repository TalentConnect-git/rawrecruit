import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/core/index.dart' show RouteNames, UserType;
import 'package:rawrecruit/src/feature/revamp_onboarding/data/revamp_entities/onboarding_model.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/first_step.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/flow_controller.dart';

import 'package:rawrecruit/src/features/application/entities/application_model.dart';
import 'package:rawrecruit/src/features/application/presentation/application_detail_view.dart';
import 'package:rawrecruit/src/features/application/presentation/application_view.dart';
import 'package:rawrecruit/src/features/auth/index.dart'
    show LoginView, RegisterView;
import 'package:rawrecruit/src/features/dashboard/entities/internship_model.dart';
import 'package:rawrecruit/src/features/dashboard/entities/job_model.dart';
import 'package:rawrecruit/src/features/dashboard/presentation/dashboard_view.dart';
import 'package:rawrecruit/src/features/home/presentation/home_view.dart';
import 'package:rawrecruit/src/features/home/presentation/index.dart';
import 'package:rawrecruit/src/features/notifications/index.dart';
import 'package:rawrecruit/src/features/onboarding/data/entities/index.dart';
import 'package:rawrecruit/src/features/onboarding/index.dart'
    show MyProfileView;
import 'package:rawrecruit/src/features/professional/application_listing/presentation/application_list_view.dart';
import 'package:rawrecruit/src/features/professional/application_listing/presentation/view_model/application_view_model.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/applicant_detail_screen.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_application.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_post_model.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/job_posting_view.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/posted_job_application_view.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/referral_post_detail_view.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/view_model/job_posting_view_model.dart';
import 'package:rawrecruit/src/features/professional/professional_dashbaord/presentation/referal_detail_view.dart';
import 'package:rawrecruit/src/features/professional/professional_dashbaord/presentation/referal_job_listing.dart';
import 'package:rawrecruit/src/features/scheduled_interviews/presentation/view/interview_screen.dart';
import 'package:rawrecruit/src/features/shortlist/presentation/shortlist_view.dart';
import 'package:rawrecruit/src/features/shortlist/presentation/view_model/shortlist_view_model.dart';

import '../../feature/revamp_auth/index.dart';
import '../../feature/revamp_profile/presentation/modern_profile_page.dart';
import '../../features/application/presentation/view_model/application_view_model.dart';
import '../../features/chat/index.dart';
import '../../features/dashboard/presentation/internship_detail_page.dart';
import '../../features/dashboard/presentation/job_detail_page.dart';
import '../../features/onboarding/presentation/add_edit_profile_view.dart';
import '../../features/professional/job_postng/presentation/posted_job_view.dart';
import '../../features/scheduled_interviews/presentation/view/interview_detail_screen.dart';
import '../../features/scheduled_interviews/presentation/view_model/scheduled_interview_view_model.dart';
import '../services/dependency_locator.dart';

class AppRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: RouteNames.splash,
        path: '/',
        builder: (_, _) => SplashView(),
      ),
      GoRoute(
        name: RouteNames.login,
        path: '/login',
        builder: (_, _) => RevampLoginView(),
      ),
      GoRoute(
        name: RouteNames.register,
        path: '/register',
        builder: (_, _) => RevampRegisterView(),
      ),
      GoRoute(
        name: RouteNames.referralPostDetail,
        path: '/referral-post-detail',
        builder: (context, state) {
          final job = state.extra as ReferralPostModel;
          return ReferralPostDetailView(job: job);
        },
      ),
      GoRoute(
        name: RouteNames.referralDetail,
        path: '/referralDetail',
        builder: (context, state) {
          final jobId = state.extra as String;
          return ReferralDetailView(jobId: jobId);
        },
      ),

      GoRoute(
        name: RouteNames.referralPost,
        path: '/referralPost',
        builder: (context, state) {
          return ChangeNotifierProvider(
            create: (_) => ReferralPostViewModel(),
            child: const ReferralPostView(),
          );
        },
      ),

      GoRoute(
        name: RouteNames.postedJobApplication,
        path: '/postedJobApplication',
        builder: (context, state) {
          final id = state.extra as String?;
          return PostedJobApplicationView(id: id);
        },
      ),
      GoRoute(
        name: RouteNames.referalJobListing,
        path: '/referalJobListing',
        builder: (context, state) {
          return const ReferralJobListing();
        },
      ),
      GoRoute(
        name: RouteNames.applicationDetail,
        path: '/applicationDetail',
        builder: (context, state) {
          final model = state.extra as ApplicationModel?;
          return ApplicationDetailView(model: model);
        },
      ),
      GoRoute(
        name: RouteNames.jobDetail,
        path: '/jobDetail',
        builder: (context, state) {
          final job = state.extra as JobModel;
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => ShortlistViewModel()..fetchSaved(),
              ),
              ChangeNotifierProvider(
                create: (_) => ApplicationViewModel()..fetchApplications(),
              ),
            ],
            child: JobDetailView(job: job),
          );
        },
      ),
      GoRoute(
        name: RouteNames.internshipDetail,
        path: '/internshipDetail',
        builder: (context, state) {
          final internship = state.extra as InternshipModel;
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => ShortlistViewModel()..fetchSaved(),
              ),
              ChangeNotifierProvider(
                create: (_) => ApplicationViewModel()..fetchApplications(),
              ),
            ],
            child: InternshipDetailView(internship: internship),
          );
        },
      ),

      GoRoute(
        name: RouteNames.addEditProfileView,
        path: '/add-edit-profile-view',
        builder: (context, state) {
          final userProfile = state.extra as UserProfile?;
          return AddEditProfileView(userProfile: userProfile);
        },
      ),
       GoRoute(
        name: RouteNames.onboarding,
        path: '/onboarding',
        builder: (context, state) {
          return OnboardingFlow();
        },
      ),
      
      GoRoute(
        name: RouteNames.userType,
        path: '/userType',
        builder: (context, state) {
          return PreferencesPage();
        },
      ),
          
     
      GoRoute(
        name: RouteNames.applicantDetail,
        path: '/applicantDetail',
        builder: (context, state) {
          final application = state.extra as ReferralApplication;
          return ApplicationDetailsView(application: application);
        },
      ),
      GoRoute(
        name: RouteNames.notification,
        path: '/notification',
        builder: (context, state) {
          return NotificationView();
        },
      ),
      GoRoute(
        path: '/scheduled-interviews',
        name: RouteNames.scheduledInterviews,
        builder: (_, __) => ChangeNotifierProvider(
          create: (_) => getIt<InterviewViewModel>(),
          child: const InterviewsScreen(),
        ),
      ),
      GoRoute(
        path: "/interviewDetail",
        name: RouteNames.interviewDetail,
        builder: (_, state) =>
            InterviewDetailScreen(interviewId: state.extra as String?),
      ),

      ShellRoute(
        builder: (context, state, navigationShell) {
          return ChangeNotifierProvider.value(
            value: getIt<ChatViewModel>(),
            child: HomeView(navigationShell: navigationShell),
          );
        },
        routes: [
          GoRoute(
            name: RouteNames.dashboard,
            path: '/dashboard',
            builder: (_, state) {
              final type = state.extra as UserType?;
              if (type == UserType.professional) {
                return ReferralJobListing();
              } else {
                return DashboardView();
              }
            },
          ),

          GoRoute(
            name: RouteNames.jobPosted,
            path: '/jobPosted',
            builder: (context, state) {
              return const PostedJobView();
            },
          ),
          GoRoute(
            name: RouteNames.shortlist,
            path: '/shortlist',
            builder: (_, _) => ShortlistView(),
          ),

          GoRoute(
            name: RouteNames.application,
            path: '/application',
            builder: (_, state) {
              final type = state.extra as UserType?;

              if (type == UserType.professional) {
                return ChangeNotifierProvider(
                  create: (_) => ReferralApplicationsViewModel(),
                  child: const ReferralApplicationsScreen(),
                );
              } else {
                return ApplicationsView();
              }
            },
          ),

          GoRoute(
            name: RouteNames.myProfile,
            path: '/my-profile',
            builder: (_, _) => ModernProfilePage(),
          ),
          GoRoute(
            name: RouteNames.chatUserList,
            path: '/chatUsers',
            builder: (context, state) {
              return const ChatUserListView();
            },
          ),
        ],
      ),
    ],
    errorBuilder: (_, _) => Scaffold(),
  );
}
