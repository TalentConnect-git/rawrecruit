import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/home/presentation/widgets/app_bottom_nav.dart';

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
          context.goNamed(RouteNames.addEditProfileView);
        }
      }
    });
    super.initState();
  }

  int _calculateIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    if (location.startsWith('/shortlist')) return 1;
    if (location.startsWith('/jobPosted')) return 1;
    if (location.startsWith('/application')) return 2;
    if (location.startsWith('/my-profile')) {
      return appStateProvider.isProfessional ? 2 : 3;
    }
    return 0;
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
      child: Scaffold(
        key: _scaffoldKey,
        appBar: RAppBar(
          title: Text('RawRecruit'),
          actions: [
            IconButton(
              onPressed: () async {
                final failure = await getIt<AppStateProvider>().logout();
                Toasts.showSuccessOrFailureToast(
                  context,
                  failure: failure,
                  popOnSuccess: false,
                  successMsg: 'Logout Successful!',
                  successCallback: () {
                    context.goNamed(RouteNames.login);
                  },
                );
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),

        body: widget.navigationShell,
        bottomNavigationBar: AppBottomNav(
          currentIndex: currentIndex,
          onTap: (index) {
            switch (index) {
              case 0:
                context.goNamed(
                  RouteNames.dashboard,
                  extra: appStateProvider.userType,
                );
                break;
              case 1:
                if (appStateProvider.isProfessional) {
                  context.goNamed(RouteNames.jobPosted);
                } else {
                  context.goNamed(RouteNames.shortlist);
                }
                break;
              case 2:
                if (appStateProvider.isProfessional) {
                  context.goNamed(RouteNames.myProfile);
                } else {
                  context.goNamed(RouteNames.application);
                }
                break;
              case 3:
                context.goNamed(RouteNames.myProfile);
                break;
            }
          },
        ),
      ),
    );
  }
}
