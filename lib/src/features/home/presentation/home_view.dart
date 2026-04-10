import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/home/presentation/widgets/app_bottom_nav.dart';

import '../../chat/index.dart';

class HomeView extends StatefulWidget {
  const HomeView({required this.navigationShell, super.key});

  final Widget navigationShell;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final appStateProvider = getIt<AppStateProvider>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final chatVm = context.read<ChatViewModel>();
      chatVm.fetchUnreadCounts();

      if (!appStateProvider.isAuthComplete) {
        final failure = await appStateProvider.getAuthDetails();
        failure?.showError(context);
      }

      if (appStateProvider.isProfileRemaining) {
        final failure = await appStateProvider.getUserDetails();
        Toasts.showSuccessOrFailureToast(
          context,
          failure: failure,
          hideSuccess: true,
          popOnSuccess: false,
        );
        if (appStateProvider.isProfileRemaining) {
          context.goNamed(RouteNames.onboarding);
        }
      }
    });
    super.initState();
  }

  int _calculateIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    if (location.startsWith('/application') ||
        location.startsWith('/referrer')) {
      return 2;
    }
    // if (location.startsWith('/my-profile')) {
    //   return appStateProvider.isProfessional ? 4 : 3;
    // }
    if (location.startsWith('/shortlist')) {
      return 3;
    }
    if (location.startsWith('/chatUsers')) {
      return 4;
    }

    return 0;
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
      child: Scaffold(
        key: _scaffoldKey,
        appBar: RAppBar(
          title: Text(
            'RawRecruit',
            style: AppTextStyles.s24W600.copyWith(color: AppColors.kGreen),
          ),
          actions: [
            IconButton(
              onPressed: () {
                context.pushNamed(RouteNames.scheduledInterviews);
              },
              icon: const Icon(Icons.calendar_month_outlined),
              color: Colors.white,
              tooltip: 'Scheduled Interviews',
            ),
            IconButton(
              onPressed: () async {
                context.pushNamed(RouteNames.notification);
              },
              icon: Icon(Icons.notifications),
              color: Colors.white,
            ),
            InkWell(
              onTap: () {
                context.pushNamed(RouteNames.myProfile);
              },
              child: Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.kGreen,
                ),
                child: Center(
                  child: Text(
                    appStateProvider.user?.name?.getInitials ?? '',
                    style: AppTextStyles.s12W600.copyWith(color: AppColors.kBg),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: widget.navigationShell,
        bottomNavigationBar: AppBottomNav(
          currentIndex: currentIndex,
          hasUnread: chatVm.totalUnreadCount > 0,
          onTap: (tab) {
            final extra = appStateProvider.userType;
            bool needExtra = false;
            if (tab == NavItem.home || tab == NavItem.referrals) {
              needExtra = true;
            }
            if (tab == NavItem.jobs || tab == NavItem.alumnis) {
              Toasts.showInfoToast(context, message: 'In development');
            } else {
              context.goNamed(tab.path, extra: needExtra ? extra : null);
            }
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
    );
  }
}
