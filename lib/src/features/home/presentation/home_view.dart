import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
  // final appStateProvider = getIt<AppStateProvider>();
  // Future<void> _syncUserDetails() async {
  //   if (!appStateProvider.isGuest && mounted) {
  //     final failure = await appStateProvider.getUserDetails();
  //     if (mounted) failure?.showError(context);
  //   }
  // }
  //
  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((_) async {
  //     if (!appStateProvider.isGuest) {
  //       final failure = await appStateProvider.getUserDetails();
  //       failure?.showError(context);
  //     }
  //   });
  //   super.initState();
  //   _syncUserDetails();
  // }

  int _calculateIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    if (location.startsWith('/blogs')) return 1;
    if (location.startsWith('/preferences')) return 2;
    if (location.startsWith('/shortlist')) return 3;
    if (location.startsWith('/my-forms')) return 4;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _calculateIndex(context);

    // ✅ Wrap the Scaffold with PopScope
    return PopScope(
      // canPop determines if the system back gesture should do anything initially.
      // We set it to false if we're *not* on the home tab, because we'll handle it manually.
      canPop: currentIndex == 0,

      // onPopInvoked is called *after* the system tries to pop (if canPop was true)
      // or when the user attempts a pop gesture (if canPop was false).
      onPopInvoked: (bool didPop) async {
        // If the pop was already handled (e.g., canPop was true and system popped), do nothing.
        if (didPop) {
          return;
        }

        // If we are *not* on the home tab, navigate to the home tab.
        if (currentIndex != 0) {
          context.goNamed(RouteNames.home);
        }
        // If we *are* on the home tab, the default behavior (likely exiting the app)
        // was already allowed by `canPop: true`, so no extra action is needed here.
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(title: Text('RawRecruit')),
        // drawer: const SDrawer(),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     context.pushNamed(RouteNames.chatbot);
        //   },
        //   backgroundColor: colors.amberLightColor,
        //   child: const Icon(Icons.chat, color: Colors.black),
        // ),
        body: Padding(
          padding: const EdgeInsets.only(
            right: 16,
            left: 16,
            top: 8,
            bottom: 0,
          ),
          child: widget.navigationShell,
        ),
        bottomNavigationBar: AppBottomNav(
          currentIndex: currentIndex,
          onTap: (index) {
            switch (index) {
              case 0:
                context.goNamed(RouteNames.home);
                break;
              case 1:
              // context.goNamed(RouteNames.blogs);
              // break;
              case 2:
              // context.goNamed(
              //   RouteNames.preferences,
              //   extra: appStateProvider.userPref != null,
              // );
              // break;
              case 3:
              // if (appStateProvider.isGuest) {
              //   Toasts.showLoginToast(context);
              // } else {
              //   context.goNamed(RouteNames.shortlist);
              // }
              // break;
              // case 4:
              // if (appStateProvider.isGuest) {
              //   Toasts.showLoginToast(context);
              // } else {
              //   context.goNamed(RouteNames.myForms);
              // }
              // break;
            }
          },
        ),
      ),
    );
  }
}
