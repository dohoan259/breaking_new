import 'package:dio/dio.dart';
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
        connectTimeout: 30000,
        receiveTimeout: 30000,
      ),
    );

    return dio;
  }

  @singleton
  ApiService getService(Dio dio) => ApiService(dio);
}
