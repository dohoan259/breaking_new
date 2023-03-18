import 'package:breaking_new/domain/entities/article_entity.dart';
import 'package:breaking_new/domain/entities/error_entity.dart';
import 'package:breaking_new/presentation/base/base_controller.dart';
import 'package:breaking_new/presentation/base/base_state.dart';
import 'package:breaking_new/utils/constants/num.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/use_cases/get_article_list_use_case.dart';
import 'breaking_news_state.dart';

@injectable
class BreakingNewsController extends BaseController<BreakingNewsState> {
  BreakingNewsController(this._getArticleListUseCase)
      : super(BreakingNewsState());

  final GetArticleListUseCase _getArticleListUseCase;

  @override
  Future<ErrorEntity?> loadData() async {
    try {
      final params = Params(page: state.page);
      final articles = await _getArticleListUseCase.call(params: params);
      final BreakingNewsState clone = state.copyWith(
        screenStatus: ScreenStatus.loaded,
        articles: articles,
        page: state.page + 1,
      );
      state = clone;
    } on ErrorEntity catch (e) {
      final BreakingNewsState clone =
          state.copyWith(screenStatus: ScreenStatus.loaded, noMoreData: true);
      state = clone;
      return e;
    }
    return null;
  }

  Future<ErrorEntity?> loadMore() async {
    final BreakingNewsState clone = state.copyWith(
      errorEntity: BusinessException('business', 'msg', tag: '12', params: 15),
    );
    state = clone;
    return null;
    try {
      if (state.noMoreData) {
        return null;
      }
      final params = Params(page: state.page);
      final newArticles = await _getArticleListUseCase.call(params: params);
      final noMoreData = newArticles.length < defaultPageSize;
      final articles = <ArticleEntity>[];
      articles.addAll(state.articles);
      articles.addAll(newArticles);
      final BreakingNewsState clone = state.copyWith(
        articles: articles,
        page: state.page + 1,
        noMoreData: noMoreData,
      );
      state = clone;
    } on ErrorEntity catch (e) {
      final BreakingNewsState clone =
          state.copyWith(screenStatus: ScreenStatus.failed);
      state = clone;
      return e;
    }
    return null;
  }
}
