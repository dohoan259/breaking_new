import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../data/remote/services/api_service.dart';

@module
abstract class NetworkModule {
  @singleton
  Dio getDio() {
    final dio = Dio(
      BaseOptions(
        contentType: 'application/json',
        baseUrl: "https://newsapi.org/v2",
        connectTimeout: 10000,
        receiveTimeout: 10000,
      ),
    )..interceptors.add(
        AwesomeDioInterceptor(
          // Disabling headers and timeout would minimize the logging output.
          // Optional, defaults to true
          logRequestTimeout: false,
          logRequestHeaders: false,
          logResponseHeaders: false,

          // Optional, defaults to the 'log' function in the 'dart:developer' package.
          logger: debugPrint,
        ),
      );

    return dio;
  }

  @singleton
  ApiService getService(Dio dio) => ApiService(dio);
}
