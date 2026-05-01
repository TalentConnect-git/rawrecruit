import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/core/index.dart'
    show RouteNames, User, UserType, Job, StudentJobType;
import 'package:rawrecruit/src/feature/revamp_alumni/presentation/alumni_tab.dart';
import 'package:rawrecruit/src/feature/revamp_application/presentation/application_detail_view.dart';
import 'package:rawrecruit/src/feature/revamp_application/presentation/view_model/application_view_model.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/presentation/alumni_detail_view.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/presentation/dashboard_view.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/presentation/internship_detail_page.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/presentation/job_detail_page.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/presentation/view_model/dashboard_view_model.dart';
import 'package:rawrecruit/src/feature/revamp_jobs/presentation/student_jobs_tab.dart';
import 'package:rawrecruit/src/feature/revamp_jobs/utils/enums.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/first_step.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/flow_controller.dart';
import 'package:rawrecruit/src/feature/revamp_referrer/presentation/professional_referrer_tab.dart';
import 'package:rawrecruit/src/feature/revamp_referrer/student_referrer_tab.dart';
import 'package:rawrecruit/src/feature/revamp_referrer/utils/enums.dart';
import 'package:rawrecruit/src/features/chat/presentation/chat_detail_view.dart';
import 'package:rawrecruit/src/features/home/presentation/home_view.dart';
import 'package:rawrecruit/src/features/home/presentation/index.dart';
import 'package:rawrecruit/src/features/notifications/index.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/applicant_detail_screen.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_application.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_post_model.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/job_posting_view.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/posted_job_application_view.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/referral_post_detail_view.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/view_model/job_posting_view_model.dart';
import 'package:rawrecruit/src/features/professional/professional_dashbaord/presentation/referal_detail_view.dart';
import 'package:rawrecruit/src/features/professional/professional_dashbaord/presentation/referal_job_listing.dart';
import 'package:rawrecruit/src/features/referral/presentation/index.dart';
import 'package:rawrecruit/src/features/scheduled_interviews/presentation/view/interview_screen.dart';
import 'package:rawrecruit/src/features/shortlist/presentation/view_model/shortlist_view_model.dart';

import '../../feature/revamp_auth/index.dart';
import '../../feature/revamp_jobs/presentation/professional_jobs_tab.dart';
import '../../feature/revamp_profile/presentation/modern_profile_page.dart';
import '../../features/chat/index.dart';
import '../../features/onboarding/presentation/add_edit_profile_view.dart';
import '../../features/professional/job_postng/presentation/referral_detail_page.dart';
import '../../features/scheduled_interviews/presentation/view/interview_detail_screen.dart';
import '../../features/scheduled_interviews/presentation/view_model/scheduled_interview_view_model.dart';
import '../services/dependency_locator.dart';

class AppRouter {
  GoRouter router = GoRouter(
    initialLocation: '/',
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
        name: RouteNames.forgotPassword,
        path: '/forgot-password',
        builder: (_, _) => ForgotPasswordView(),
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
          String jobId = "";
          String? companyName;

          final extra = state.extra;

          if (extra is String) {
            if (extra.contains("|||")) {
              final data = extra.split("|||");
              jobId = data[0];
              companyName = data.length > 1 ? data[1] : null;
            } else {
              jobId = extra;
            }
          } else if (extra is Map<String, dynamic>) {
            jobId = extra["id"] ?? "";
            companyName = extra["companyName"];
          }

          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => DashboardViewModel()..getAlumniData(),
              ),
              ChangeNotifierProvider(
                create: (_) => ApplicationViewModel()..fetchApplications(),
              ),
              ChangeNotifierProvider(
                create: (_) => ShortlistViewModel()..fetchSaved(),
              ),
            ],
            child: ReferralDetailView(jobId: jobId, companyName: companyName),
          );
        },
      ),
      GoRoute(
        name: RouteNames.alumniDetail,
        path: "/alumni-detail",
        builder: (context, state) {
          final jobs = state.extra as List<Job>;
          return AlumniDetailView(jobs: jobs);
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
          final model = state.extra as Job?;
          return ApplicationDetailView(model: model);
        },
      ),
      GoRoute(
        name: RouteNames.jobDetail,
        path: '/jobDetail',
        builder: (context, state) {
          final job = state.extra as Job;
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => ShortlistViewModel()..fetchSaved(),
              ),
              ChangeNotifierProvider(
                create: (_) => ApplicationViewModel()..fetchApplications(),
              ),
              ChangeNotifierProvider(
                create: (_) => DashboardViewModel()..getAlumniData(),
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
          final internship = state.extra as Job;
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => ShortlistViewModel()..fetchSaved(),
              ),
              ChangeNotifierProvider(
                create: (_) => ApplicationViewModel()..fetchApplications(),
              ),
              ChangeNotifierProvider(
                create: (_) => DashboardViewModel()..getAlumniData(),
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
          final user = state.extra as User?;
          return AddEditProfileView(user: user);
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

      GoRoute(
        name: RouteNames.chatUserList,
        path: '/chatUsers',
        builder: (context, state) {
          return const ChatUserListView();
        },
      ),

      GoRoute(
        name: RouteNames.chatUser,
        path: '/chat-user',
        builder: (context, state) {
          User? user = state.extra as User?;
          if (user == null) return Scaffold();
          return ChatDetailView(user: user);
        },
      ),

      GoRoute(
        name: RouteNames.referrerDetail,
        path: '/referrer-detail',
        builder: (context, state) {
          ReferralApplication? args = state.extra as ReferralApplication?;

          if (args == null) return Scaffold();

          return ReferralDetailPage(application: args);
        },
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
              final extra = state.extra;

              UserType? type;

              /// ✅ SAFE PARSING (handles all cases)
              if (extra is Map<String, dynamic>) {
                type = extra['userType'] as UserType?;
              } else if (extra is UserType) {
                type = extra;
              }

              /// ✅ DEFAULT FALLBACK (VERY IMPORTANT)
              type ??= UserType.student; // or fetch from AppStateProvider

              if (type == UserType.professional) {
                return ReferralHome();
              } else {
                return DashboardView();
              }
            },
          ),

          GoRoute(
            name: RouteNames.referrer,
            path: '/referrer',
            builder: (context, state) {
              final args = state.extra as Map<String, dynamic>?;

              if (args == null || args.isEmpty) return Scaffold();

              final type = args['userType'];

              if (type == UserType.professional) {
                return ProfessionalReferralView(
                  selectedType:
                      args['applicationType']
                          as ProfessionalReferrerApplicationType?,
                ); // ✅ professional
              } else {
                return const StudentApplicationsView(); // ✅ student
              }
            },
          ),
          GoRoute(
            name: RouteNames.shortlist,
            path: '/shortlist',
            builder: (_, _) => AlumniHiringView(),
          ),

          GoRoute(
            name: RouteNames.application,
            path: '/application',
            builder: (_, state) {
              final args = state.extra as Map<String, dynamic>?;

              if (args == null || args.isEmpty) return Scaffold();

              final type = args['userType'];

              if (type == UserType.professional) {
                return ProfessionalJobsView(
                  selectedType: args['jobType'] as ProfessionalJobType?,
                ); // ✅
              } else {
                return StudentJobsView(
                  jobType: args['studentJobType'] as StudentJobType?,
                ); // ✅
              }
            },
          ),
          GoRoute(
            name: RouteNames.myProfile,
            path: '/my-profile',
            builder: (_, _) => ModernProfilePage(),
          ),
        ],
      ),
    ],
    errorBuilder: (_, _) => Scaffold(),
  );
}
