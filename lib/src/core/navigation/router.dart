import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/core/index.dart' show RouteNames;
import 'package:rawrecruit/src/features/auth/index.dart'
    show LoginView, RegisterView;
import 'package:rawrecruit/src/features/home/presentation/index.dart';

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
    ],
    errorBuilder: (_, _) => Scaffold(),
  );
}
