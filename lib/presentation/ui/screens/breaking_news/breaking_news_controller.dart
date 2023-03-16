import 'package:breaking_new/domain/entities/error_entity.dart';
import 'package:breaking_new/presentation/base/base_controller.dart';
import 'package:breaking_new/presentation/base/base_state.dart';
import 'package:breaking_new/utils/constants/num.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/usecases/get_article_list_use_case.dart';
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
      final noMoreData = articles.length < defaultPageSize;
      final BreakingNewsState clone = state.copyWith(
          screenStatus: ScreenStatus.loaded,
          articles: articles,
          page: state.page + 1,
          noMoreData: noMoreData);
      state = clone;
    } catch (e) {
      final BreakingNewsState clone =
          state.copyWith(screenStatus: ScreenStatus.failed);
      state = clone;
    }
    return null;
  }
}
