import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/widgets/onboarding_local_service.dart';
import 'package:rawrecruit/src/features/home/presentation/widgets/app_bottom_nav.dart';
import 'package:rawrecruit/src/features/notifications/index.dart';

import '../../../feature/revamp_onboarding/presentation/flow_controller.dart';
import '../../chat/index.dart';
import '../../scheduled_interviews/data/entity/interview_model.dart';
import '../../scheduled_interviews/presentation/view_model/scheduled_interview_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({required this.navigationShell, super.key});

  final Widget navigationShell;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final appStateProvider = getIt<AppStateProvider>();
  final notificationVm = getIt<NotificationViewModel>();
  final interviewViewModel = getIt<InterviewViewModel>();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final chatVm = context.read<ChatViewModel>();
      chatVm.fetchUnreadCounts();
      await notificationVm.getNotifications();
      if (!appStateProvider.isAuthComplete) {
        final failure = await appStateProvider.getAuthDetails();
        failure?.showError(context);

        final failure2 = await interviewViewModel.getInterviews();
        failure2?.showError(context);
      }

      if (appStateProvider.isProfileRemaining) {
        final onboardingService = getIt<OnboardingLocalService>();

        final completed = await onboardingService.isCompleted();

        if (!completed) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const OnboardingFlow()),
          );

          return;
        }
      }
    });
    super.initState();
  }

  int _calculateIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    if (location.startsWith('/application')) {
      return 1; // ✅ Jobs
    }

    if (location.startsWith('/referrer')) {
      return 2; // ✅ Referrer
    }

    if (location.startsWith('/shortlist')) {
      return 3; // ✅ Alumnis
    }

    if (location.startsWith('/my-profile')) {
      return 4; // ✅ Chat
    }

    return 0; // ✅ Home
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _calculateIndex(context);
    final chatVm = context.watch<ChatViewModel>();
    return PopScope(
      canPop: currentIndex == 0,
      onPopInvokedWithResult: (bool didPop, _) async {
        if (didPop) {
          return;
        }

        if (currentIndex != 0) {
          context.goNamed(
            RouteNames.dashboard,
            extra: appStateProvider.userType,
          );
        }
      },
      child: ChangeNotifierProvider.value(
        value: interviewViewModel,
        child: Scaffold(
          key: _scaffoldKey,
          appBar: RAppBar(
            title: Text(
              'RawRecruit',
              style: AppTextStyles.s24W600.copyWith(color: AppColors.kGreen),
            ),
            actions: [
              Selector<InterviewViewModel, List<InterviewModel>>(
                selector: (_, vm) => vm.interviews,
                builder: (_, interviews, _) => IconButton(
                  onPressed: () {
                    context.pushNamed(RouteNames.scheduledInterviews);
                  },
                  icon: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Icon(Icons.calendar_month_outlined),
                      if (interviews.isNotEmpty)
                        Positioned(
                          right: -1,
                          top: -1,

                          child: Container(
                            width: 10,
                            height: 10,

                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                    ],
                  ),
                  color: Colors.white,
                  tooltip: 'Scheduled Interviews',
                ),
              ),
              ListenableBuilder(
                listenable: notificationVm,
                builder: (_, __) {
                  return IconButton(
                    onPressed: () async {
                      await context.pushNamed(RouteNames.notification);

                      if (context.mounted) {
                        await notificationVm.getNotifications();
                      }
                    },

                    icon: Stack(
                      clipBehavior: Clip.none,

                      children: [
                        const Icon(Icons.notifications),

                        if (notificationVm.hasUnreadNotifications)
                          Positioned(
                            right: -1,
                            top: -1,

                            child: Container(
                              width: 10,
                              height: 10,

                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                      ],
                    ),

                    color: Colors.white,
                  );
                },
              ),
              IconButton(
                onPressed: () {
                  context.pushNamed(RouteNames.chatUserList);
                },
                icon: Image.asset(
                  'assets/images/chat.png',
                  height: 24,
                  width: 24,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          body: widget.navigationShell,
          bottomNavigationBar: AppBottomNav(
            currentIndex: currentIndex,
            hasUnread: chatVm.totalUnreadCount > 0,
            onTap: (tab) {
              final extra = {'userType': appStateProvider.userType};

              context.goNamed(tab.path, extra: extra);

              // switch (tab) {
              //   // case 0:
              //   //   context.goNamed(
              //   //     RouteNames.dashboard,
              //   //     extra: appStateProvider.userType,
              //   //   );
              //   //   break;
              //   // case 1:
              //   //   if (appStateProvider.isProfessional) {
              //   //     context.goNamed(RouteNames.jobPosted);
              //   //   } else {
              //   //     context.goNamed(RouteNames.application);
              //   //   }
              //   //   break;
              //   // case 2:
              //   //   if (appStateProvider.isProfessional) {
              //   //     context.goNamed(
              //   //       RouteNames.application,
              //   //       extra: appStateProvider.userType,
              //   //     );
              //   //   } else {
              //   //     context.goNamed(RouteNames.shortlist);
              //   //   }
              //   //   break;
              //   // case 3:
              //   //   if (appStateProvider.isProfessional) {
              //   //     context.goNamed(RouteNames.shortlist);
              //   //   } else {
              //   //     context.goNamed(RouteNames.myProfile);
              //   //   }
              //   //   break;
              //   // case 4:
              //   //   if (appStateProvider.isProfessional) {
              //   //     context.goNamed(RouteNames.myProfile);
              //   //   } else {
              //   //     context.goNamed(RouteNames.chatUserList);
              //   //   }
              //   //   break;
              //   // case 5:
              //   //   context.goNamed(RouteNames.chatUserList);
              //   case NavItem.home:
              //     // TODO: Handle this case.
              //     throw UnimplementedError();
              //   case NavItem.referrer:
              //     // TODO: Handle this case.
              //     throw UnimplementedError();
              //   case NavItem.applications:
              //     // TODO: Handle this case.
              //     throw UnimplementedError();
              //   case NavItem.shortlist:
              //     // TODO: Handle this case.
              //     throw UnimplementedError();
              //   case NavItem.chat:
              //     // TODO: Handle this case.
              //     throw UnimplementedError();
              // }
            },
          ),
        ),
      ),
    );
  }
}
