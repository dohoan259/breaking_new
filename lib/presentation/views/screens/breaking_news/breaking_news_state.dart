import 'package:breaking_new/domain/entities/error_entity.dart';
import 'package:breaking_new/presentation/base/base_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/article_entity.dart';

part 'breaking_news_state.freezed.dart';

@freezed
class BreakingNewsState extends BaseState with _$BreakingNewsState {
  factory BreakingNewsState({
    @Default(ScreenStatus.uninitialized) ScreenStatus screenStatus,
    @Default(false) bool processing,
    @Default(null) ErrorEntity? errorEntity,
    @Default([]) List<ArticleEntity> articles,
    @Default(1) int page,
    @Default(false) bool noMoreData,
  }) = _BreakingNewsState;
}
