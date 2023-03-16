import 'package:breaking_new/data/remote/models/responses/breaking_news_response.dart';
import 'package:breaking_new/data/remote/sources/breaking_news_remote_source.dart';
import 'package:injectable/injectable.dart';

import '../models/requests/breaking_news_request.dart';
import '../services/api_service.dart';

@Injectable(as: BreakingNewsRemoteSource)
class BreakingNewsRemoteSourceImpl implements BreakingNewsRemoteSource {
  final ApiService apiService;

  BreakingNewsRemoteSourceImpl(this.apiService);

  @override
  Future<List<Article>> getBreakingNewsArticles(
      BreakingNewsRequest request) async {
    final articlesResponse = await apiService.getBreakingNewsArticles(
      apiKey: request.apiKey,
      sources: request.sources,
      page: request.page,
      pageSize: request.pageSize,
    );
    return articlesResponse.articles;
  }
}
