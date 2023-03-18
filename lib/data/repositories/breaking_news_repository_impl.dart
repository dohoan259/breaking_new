import 'package:breaking_new/data/error_handler.dart';
import 'package:breaking_new/data/mappers/breaking_news.dart';
import 'package:breaking_new/data/remote/models/requests/breaking_news_request.dart';
import 'package:breaking_new/data/remote/sources/breaking_news_remote_source.dart';
import 'package:breaking_new/di/di.dart';
import 'package:breaking_new/domain/repositories/breaking_news_repository.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/article_entity.dart';

@Injectable(as: BreakingNewsRepository)
class BreakingNewsRepositoryImpl implements BreakingNewsRepository {
  final BreakingNewsRemoteSource breakingNewsRemoteSource;

  BreakingNewsRepositoryImpl(this.breakingNewsRemoteSource);

  @override
  Future<List<ArticleEntity>> getBreakingNewsArticles({
    required String apiKey,
    required String sources,
    required int page,
    required int pageSize,
  }) async {
    try {
      final request = BreakingNewsRequest(
          apiKey: apiKey, sources: sources, page: page, pageSize: pageSize);
      final articleList =
          await breakingNewsRemoteSource.getBreakingNewsArticles(request);
      return articleList.map((a) => a.toEntity()).toList();
    } catch (e) {
      throw getIt<ErrorHandler>().handleError(e);
    }
  }
}
