import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';

import '../models/responses/breaking_news_response.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('/top-headlines')
  Future<BreakingNewsResponse> getBreakingNewsArticles({
    @Query("apiKey") required String? apiKey,
    @Query("sources") required String? sources,
    @Query("page") required int? page,
    @Query("pageSize") required int? pageSize,
  });
}
