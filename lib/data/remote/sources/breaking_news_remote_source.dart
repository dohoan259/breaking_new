import '../models/requests/breaking_news_request.dart';
import '../models/responses/breaking_news_response.dart';

abstract class BreakingNewsRemoteSource {
  Future<List<Article>> getBreakingNewsArticles(BreakingNewsRequest request);
}
