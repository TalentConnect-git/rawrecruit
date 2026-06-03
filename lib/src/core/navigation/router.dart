import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/core/index.dart'
    show RouteNames, User, UserType, Job, StudentJobType, NavigationRepository;
import 'package:rawrecruit/src/core/navigation/not_found_view.dart';
import 'package:rawrecruit/src/features/alumni/presentation/alumni_tab.dart';
import 'package:rawrecruit/src/features/application/index.dart'
    show ApplicationDetailView, ApplicationModel;
import 'package:rawrecruit/src/features/auth/index.dart'
    show LoginView, RegisterView, ForgotPasswordView;
import 'package:rawrecruit/src/features/chat/presentation/chat_detail_view.dart';
import 'package:rawrecruit/src/features/dashboard/presentation/alumni_detail_view.dart';
import 'package:rawrecruit/src/features/dashboard/presentation/dashboard_view.dart';
import 'package:rawrecruit/src/features/dashboard/presentation/internship_detail_page.dart';
import 'package:rawrecruit/src/features/dashboard/presentation/job_detail_page.dart';
import 'package:rawrecruit/src/features/home/presentation/index.dart';
import 'package:rawrecruit/src/features/jobs/presentation/student_jobs_tab.dart';
import 'package:rawrecruit/src/features/jobs/utils/enums.dart';
import 'package:rawrecruit/src/features/notifications/index.dart';
import 'package:rawrecruit/src/features/onboarding/presentation/first_step.dart';
import 'package:rawrecruit/src/features/onboarding/presentation/flow_controller.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/applicant_detail_screen.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_application.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_post_model.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/job_posting_view.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/posted_job_application_view.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/referral_post_detail_view.dart';
import 'package:rawrecruit/src/features/professional/professional_dashbaord/presentation/referal_detail_view.dart';
import 'package:rawrecruit/src/features/professional/professional_dashbaord/presentation/referal_job_listing.dart';
import 'package:rawrecruit/src/features/profile/presentation/profile_cv_page.dart';
import 'package:rawrecruit/src/features/referral/presentation/index.dart';
import 'package:rawrecruit/src/features/referrer/presentation/professional_referrer_tab.dart';
import 'package:rawrecruit/src/features/referrer/student_referrer_tab.dart';
import 'package:rawrecruit/src/features/referrer/utils/enums.dart';
import 'package:rawrecruit/src/features/scheduled_interviews/presentation/interview_screen.dart';

import '../../features/chat/index.dart';
import '../../features/jobs/presentation/professional_jobs_tab.dart';
import '../../features/professional/application_listing/presentation/application_detail_view.dart';
import '../../features/professional/job_postng/presentation/referral_detail_page.dart';
import '../../features/professional/job_postng/presentation/referred_detail_page.dart';
import '../../features/profile/presentation/add_edit_profile_view.dart';
import '../../features/profile/presentation/modern_profile_page.dart';
import '../../features/scheduled_interviews/presentation/interview_detail_screen.dart';
import '../services/dependency_locator.dart';

GoRouter appRouter = GoRouter(
  initialLocation: '/',
  navigatorKey: getIt<NavigationRepository>().navigatorKey,
  routes: [
    GoRoute(
      name: RouteNames.splash,
      path: '/',
      builder: (_, _) => SplashView(),
    ),
    GoRoute(
      name: RouteNames.login,
      path: '/login',
      builder: (_, _) => LoginView(),
    ),
    GoRoute(
      name: RouteNames.register,
      path: '/register',
      builder: (_, _) => RegisterView(),
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

        return ReferralDetailView(jobId: jobId, companyName: companyName);
      },
    ),
    GoRoute(
      name: RouteNames.referredCandidateDetail,
      path: '/referredCandidateDetail',

      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;

        return ReferredCandidateDetailPage(
          application: data['application'],
          showStatusActions: data['showStatusActions'] ?? false,
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
      builder: (context, state) => ReferralPostView(),
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
        final applicationId = state.extra as String?;
        if (applicationId == null) return NotFoundView();
        return ApplicationDetailView(applicationId: applicationId);
      },
    ),
    GoRoute(
      name: RouteNames.jobDetail,
      path: '/jobDetail',
      builder: (context, state) {
        final job = state.extra as Job;
        return JobDetailView(job: job);
      },
    ),
    GoRoute(
      name: RouteNames.internshipDetail,
      path: '/internshipDetail',
      builder: (context, state) {
        final internship = state.extra as Job;
        return InternshipDetailView(internship: internship);
      },
    ),
    GoRoute(
      path: '/profile-detail',

      name: RouteNames.profileDetail,

      builder: (context, state) {
        final userId = state.extra as String;

        return ProfileDetailView(userId: userId);
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
      name: RouteNames.referralApplicationDetail,
      path: '/referralApplicationDetail',

      builder: (context, state) {
        final application = state.extra as ApplicationModel;

        return ReferralApplicationDetailScreen(application: application);
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
      builder: (_, __) => const InterviewsScreen(),
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
        return HomeView(navigationShell: navigationShell);
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
  errorBuilder: (_, _) => NotFoundView(),
);
