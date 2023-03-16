import '../entities/article_entity.dart';

abstract class BreakingNewsRepository {
  Future<List<ArticleEntity>> getBreakingNewsArticles({
    required String apiKey,
    required String sources,
    required int page,
    required int pageSize,
  });
}
