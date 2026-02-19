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
    });
    super.initState();
  }

  int _calculateIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    if (location.startsWith('/shortlist')) return 1;
    if (location.startsWith('/application')) return 2;
    if (location.startsWith('/applicationDetail')) return 3;
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
          context.goNamed(RouteNames.dashboard);
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('RawRecruit'),
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0.25),
            child: Container(
              color: AppColors.border,
              width: double.maxFinite,
              height: 0.25,
            ),
          ),
        ),
        // drawer: const SDrawer(),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     context.pushNamed(RouteNames.chatbot);
        //   },
        //   backgroundColor: colors.amberLightColor,
        //   child: const Icon(Icons.chat, color: Colors.black),
        // ),
        body: widget.navigationShell,
        bottomNavigationBar: AppBottomNav(
          currentIndex: currentIndex,
          onTap: (index) {
            switch (index) {
              case 0:
                context.goNamed(RouteNames.dashboard);
                break;
              case 1:
                context.goNamed(RouteNames.shortlist);
                break;
              case 2:
                context.goNamed(RouteNames.application);
                break;
              case 3:
                context.goNamed(RouteNames.applicationDetail);
                break;
            }
          },
        ),
      ),
    );
  }
}
