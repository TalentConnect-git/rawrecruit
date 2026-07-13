import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart'
    show AppTextStyles, AppColors, RAppBar;
import 'package:rawrecruit/src/core/index.dart'
    show
        AppStateProvider,
        NotificationProvider,
        getIt,
        RouteNames,
        NavItemExt,
        FailureExt,
        ChatProvider;
import 'package:rawrecruit/src/core/provider/interview_provider.dart';
import 'package:rawrecruit/src/features/chat/index.dart' show ChatViewModel;
import 'package:rawrecruit/src/features/home/index.dart' show AppBottomNav;
import 'package:rawrecruit/src/features/notifications/index.dart'
    show NotificationViewModel;
import 'package:rawrecruit/src/features/onboarding/index.dart'
    show OnboardingLocalService;
import 'package:rawrecruit/src/features/scheduled_interviews/index.dart'
    show InterviewViewModel;

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
  final chatViewModel = getIt<ChatViewModel>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      chatViewModel.fetchUnreadCounts();
      if (!appStateProvider.isAuthComplete) {
        final failure = await appStateProvider.getAuthDetails();
        failure?.showError(context);

        await notificationVm.getNotifications();

        getIt<NotificationProvider>().checkForNewNotifications();
        getIt<InterviewProvider>().checkForNewInterviews();
        getIt<ChatProvider>().checkForNewChats();

        final failure2 = await interviewViewModel.getInterviews();
        failure2?.showError(context);
      }

      if (appStateProvider.isProfileRemaining) {
        final onboardingService = getIt<OnboardingLocalService>();

        final completed = await onboardingService.isCompleted();

        if (!completed) {
          context.pushReplacementNamed(RouteNames.onboarding);

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
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<ChatViewModel>.value(value: chatViewModel),
          ChangeNotifierProvider.value(value: interviewViewModel),
        ],
        child: Scaffold(
          key: _scaffoldKey,
          appBar: RAppBar(
            title: Text(
              'Referd',
              style: AppTextStyles.s24W600.copyWith(color: AppColors.kGreen),
            ),
            actions: [
              Selector<InterviewProvider, bool>(
                selector: (_, vm) => vm.hasNewInterviews,
                builder: (_, hasInterviews, _) => IconButton(
                  onPressed: () {
                    context.pushNamed(RouteNames.scheduledInterviews);
                  },
                  icon: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Icon(
                        Icons.calendar_today_outlined,
                        size: 20,
                        color: Colors.grey,
                      ),
                      if (hasInterviews)
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
              Selector<NotificationProvider, bool>(
                builder: (_, available, _) {
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

                        if (available)
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
                selector: (_, vm) => vm.hasNewNotifications,
              ),
              Selector<ChatProvider, bool>(
                builder: (_, available, _) {
                  return IconButton(
                    onPressed: () async {
                      context.pushNamed(RouteNames.chatUserList);
                    },

                    icon: Stack(
                      clipBehavior: Clip.none,

                      children: [
                        Image.asset(
                          'assets/images/chat.png',
                          height: 24,
                          width: 24,
                          color: Colors.white,
                        ),

                        if (available)
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
                selector: (_, vm) => vm.hasNewChats,
              ),
            ],
          ),
          body: widget.navigationShell,
          bottomNavigationBar: AppBottomNav(
            currentIndex: currentIndex,
            hasUnread: chatViewModel.totalUnreadCount > 0,
            onTap: (tab) {
              final extra = {'userType': appStateProvider.userType};

              context.goNamed(tab.path, extra: extra);
            },
          ),
        ),
      ),
    );
  }
}
