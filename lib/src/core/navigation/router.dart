import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/core/index.dart' show RouteNames;
import 'package:rawrecruit/src/features/application/presentation/application_detail_view.dart';
import 'package:rawrecruit/src/features/application/presentation/application_view.dart';
import 'package:rawrecruit/src/features/auth/index.dart'
    show LoginView, RegisterView;
import 'package:rawrecruit/src/features/dashboard/presentation/dashboard_view.dart';
import 'package:rawrecruit/src/features/home/presentation/home_view.dart';
import 'package:rawrecruit/src/features/home/presentation/index.dart';
import 'package:rawrecruit/src/features/shortlist/presentation/shortlist_view.dart';

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
        builder: (_, _) => LoginView(),
      ),
      GoRoute(
        name: RouteNames.register,
        path: '/register',
        builder: (_, _) => RegisterView(),
      ),

      ShellRoute(
        builder: (context, state, navigationShell) {
          return HomeView(navigationShell: navigationShell);
        },
        routes: [
          GoRoute(
            name: RouteNames.dashboard,
            path: '/dashboard',
            builder: (_, _) => DashboardView(),
          ),

          GoRoute(
            name: RouteNames.shortlist,
            path: '/shortlist',
            builder: (_, _) => ShortlistView(),
          ),

          GoRoute(
            name: RouteNames.application,
            path: '/application',
            builder: (_, _) => ApplicationsView(),
          ),

          GoRoute(
            name: RouteNames.applicationDetail,
            path: '/applicationDetail',
            builder: (_, _) => ApplicationDetailView(),
          ),
        ],
      ),
    ],
    errorBuilder: (_, _) => Scaffold(),
  );
}
