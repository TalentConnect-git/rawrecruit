import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:rawrecruit/src/config/index.dart';
import 'package:rawrecruit/src/core/index.dart' show Request, AuthInterceptor;

class NetworkService {
  /// [dio] is optional so tests (or a future second backend) can inject
  /// their own instance instead of NetworkService always constructing one
  /// internally.
  NetworkService({Dio? dio}) : _dio = dio ?? Dio() {
    _dio.options
      ..baseUrl = FlavorConfig.instance.baseMobileUrl
      ..connectTimeout = const Duration(seconds: 15)
      ..receiveTimeout = const Duration(seconds: 15)
      ..sendTimeout = const Duration(seconds: 15);

    _dio.interceptors.add(AuthInterceptor(dio: _dio));

    if (kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(responseBody: true, requestBody: true),
      );
    }
  }

  final Dio _dio;

  Future<Response<dynamic>> request(Request request) async {
    final method = request.method.name;

    return _dio.request(
      request.endpoint,
      data: request.formData ?? request.body,
      queryParameters: request.queryParams,
      options: Options(
        method: method,
        headers: request.headers,
        extra: {'requiresAuth': request.isSafeRoute},
      ),
    );
  }
}
