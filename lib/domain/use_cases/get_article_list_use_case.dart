import 'package:breaking_new/domain/repositories/breaking_news_repository.dart';
import 'package:breaking_new/domain/use_cases/use_case.dart';
import 'package:injectable/injectable.dart';

import '../../utils/constants/num.dart';
import '../../utils/constants/string.dart';
import '../entities/article_entity.dart';

@injectable
class GetArticleListUseCase implements UseCase<List<ArticleEntity>, Params> {
  final BreakingNewsRepository _breakingNewsRepository;

  GetArticleListUseCase(this._breakingNewsRepository);

  @override
  Future<List<ArticleEntity>> call({required Params params}) async {
    return _breakingNewsRepository.getBreakingNewsArticles(
      apiKey: params.apiKey,
      sources: params.sources,
      page: params.page,
      pageSize: params.pageSize,
    );
  }
}

class Params {
  final String apiKey;
  final String sources;
  final int page;
  final int pageSize;

  Params({
    this.apiKey = defaultApiKey,
    this.sources = 'bbc-news, abc-news',
    this.page = 1,
    this.pageSize = defaultPageSize,
  });
}
