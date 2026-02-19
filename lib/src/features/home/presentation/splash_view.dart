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

  // bool _minTimePassed = false;
  // bool _logicDone = false;

  final appStateProvider = getIt<AppStateProvider>();

  @override
  void initState() {
    super.initState();

    // Future.delayed(const Duration(seconds: 2), () {
    //   _minTimePassed = true;
    //   isLoading.value = true;
    //   _tryNavigate();
    // });

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
        if (appStateProvider.isAuthComplete) {
          next = RouteNames.home;
        } else {
          await SecretRepo.remove('auth_token');
          next = RouteNames.login;
        }
      } catch (e, s) {
        log('$e\n$s');
        await SecretRepo.remove('auth_token');
        next = RouteNames.login;
      }
    }

    if (!mounted) return;

    context.pushReplacementNamed(next);

    // _logicDone = true;
    // _tryNavigate();
  }

  // void _tryNavigate() {
  //   if (_minTimePassed && _logicDone && mounted) {
  //     context.pushReplacementNamed(next);
  //   }
  // }

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
