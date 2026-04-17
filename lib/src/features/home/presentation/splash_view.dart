import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/core/index.dart'
    show RouteNames, getIt, AppStateProvider, SecretRepo;

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  String next = RouteNames.login;
  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  final appStateProvider = getIt<AppStateProvider>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _decideNext();
    });
  }

  Future<void> _decideNext() async {
    String token = await SecretRepo.getString('auth_token') ?? '';

    log(token, name: 'AuthToken');

    if (token.isNotEmpty) {
      try {
        await appStateProvider.getAuthDetails();
        await appStateProvider.getUserDetails();
        if (appStateProvider.isAuthComplete) {
          if (appStateProvider.isProfileRemaining) {
            next = RouteNames.onboarding;
          } else {
            next = RouteNames.dashboard;
          }
        } else {
          await SecretRepo.remove('auth_token');
          next = RouteNames.login;
        }
      } catch (e) {
        await SecretRepo.remove('auth_token');
        next = RouteNames.login;
      }
    }

    if (!mounted) return;

    context.pushReplacementNamed(
      next,
      extra: {'userType': appStateProvider.userType},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Image.network(
            'https://rawrecruit.in/assets/RR-Tagline-CmOUAebu.png',
          ),
        ),
      ),
    );
  }
}
