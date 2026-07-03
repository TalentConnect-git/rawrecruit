import 'dart:async';
import 'dart:developer';

import 'package:app_links/app_links.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/core/index.dart'
    show NavigationRepository, getIt, RouteNames, SecretRepo;

class DeepLinkService {
  final AppLinks _appLinks = AppLinks();
  StreamSubscription<Uri>? _linkSubscription;

  Future<void> init() async {
    // Cold start — app opened directly via a link
    try {
      final initialUri = await _appLinks.getInitialLink();
      if (initialUri != null) {
        _handleDeepLink(initialUri);
      }
    } catch (e) {
      debugPrint('Error getting initial app link: $e');
    }

    // Warm/running — link tapped while app is alive
    _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
      _handleDeepLink(uri);
    }, onError: (err) => debugPrint('Deep link stream error: $err'));
  }

  void dispose() {
    _linkSubscription?.cancel();
  }
}

void _handleDeepLink(Uri uri) async {
  log(uri.toString(), name: 'App link');

  String routeName = await _handleUri(uri);

  final context = getIt<NavigationRepository>().context;

  context?.goNamed(routeName);
}

Future<String> _handleUri(Uri uri) async {
  final path = uri.path.isNotEmpty ? uri.path : '/';
  final params = uri.queryParameters;

  if (path.contains('signup')) {
    final token = params['token'];

    if (token != null && token.isNotEmpty) {
      await SecretRepo.setString('auth_token', token);
    }
  }

  return RouteNames.splash;
}
