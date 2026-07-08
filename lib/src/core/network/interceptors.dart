import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/config/index.dart' show FlavorConfig;
import 'package:rawrecruit/src/core/index.dart'
    show
        SecretRepo,
        Endpoints,
        StorageKeys,
        getIt,
        AppStateProvider,
        NavigationRepository,
        RouteNames,
        Toasts;
import 'package:rawrecruit/src/features/onboarding/index.dart'
    show OnboardingLocalService;
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({required Dio dio}) : _dio = dio;

  final Dio _dio;

  bool _isRefreshing = false;
  bool _sessionExpired = false;

  Completer<void>? _refreshCompleter;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (_sessionExpired && options.extra['requiresAuth'] == true) {
      return handler.reject(
        DioException(requestOptions: options, error: 'Session expired'),
      );
    }

    if (options.extra['requiresAuth'] == true) {
      final accessToken = await SecretRepo.getString(StorageKeys.authToken);

      if (accessToken != null) {
        options.headers['Authorization'] = 'Bearer $accessToken';
      }
    }

    if (options.path.contains('api/auth/login')) {
      resetSession();
    }

    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (_sessionExpired) {
      return handler.next(err);
    }

    // Only attempt a refresh+retry once per request. Without this guard, a
    // refreshed token that the server still rejects (clock skew, server-side
    // revocation, etc.) would send this into an infinite refresh/retry loop.
    final alreadyRetried = err.requestOptions.extra['retried'] == true;

    if (err.response?.statusCode != 401 ||
        err.requestOptions.extra['requiresAuth'] != true ||
        alreadyRetried) {
      return handler.next(err);
    }

    try {
      await _refreshToken();

      if (_sessionExpired) {
        return handler.next(err);
      }

      final accessToken = await SecretRepo.getString(StorageKeys.authToken);

      final request = err.requestOptions
        ..headers['Authorization'] = 'Bearer $accessToken'
        ..extra['retried'] = true;

      final response = await _dio.fetch(request);

      return handler.resolve(response);
    } on DioException catch (e) {
      // Surface the retry's actual failure rather than masking it with the
      // original 401.
      return handler.next(e);
    } catch (_) {
      return handler.next(err);
    }
  }

  Future<void> _refreshToken() async {
    if (_sessionExpired) {
      throw DioException(
        requestOptions: RequestOptions(path: ''),
        error: 'Session expired',
      );
    }

    if (_isRefreshing) {
      return _refreshCompleter!.future;
    }

    _isRefreshing = true;
    _refreshCompleter = Completer();

    try {
      final refreshToken = await SecretRepo.getString(StorageKeys.refreshToken);

      if (kDebugMode) {
        log(refreshToken ?? 'Not found', name: 'RefreshToken');
      }

      final response = await _dio.post(
        '${FlavorConfig.instance.baseMobileUrl}${Endpoints.apiAuthRefresh}',
        data: {'isApp': true, 'refreshToken': refreshToken},
        options: Options(extra: {'requiresAuth': false}),
      );

      final newAccess = response.data["accessToken"];
      final newRefresh = response.data["refreshToken"];

      await SecretRepo.setString(StorageKeys.authToken, newAccess);
      await SecretRepo.setString(StorageKeys.refreshToken, newRefresh);

      _refreshCompleter!.complete();
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        await _logout();
      }

      _refreshCompleter!.completeError(e);
      rethrow;
    } finally {
      _isRefreshing = false;
    }
  }

  Future<void> _logout() async {
    if (_sessionExpired) return;

    _sessionExpired = true;

    final appStateProvider = getIt<AppStateProvider>();

    await SecretRepo.clearAll();
    await getIt<OnboardingLocalService>().clear();
    appStateProvider.selectedUserType = null;

    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(StorageKeys.referralPostDraft);
    await prefs.remove(StorageKeys.experience);

    appStateProvider.user = null;
    appStateProvider.auth = null;

    final context = getIt<NavigationRepository>().context;

    // Guard against a null or already-unmounted context: by the time all the
    // awaits above finish, the widget tree may have moved on.
    if (context != null && context.mounted) {
      Toasts.showErrorToast(context, message: 'Session Expired');
      context.goNamed(RouteNames.login);
    }
  }

  void resetSession() {
    _sessionExpired = false;
  }
}
