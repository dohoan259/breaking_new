import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../utils/constants/num.dart';

part 'breaking_news_request.g.dart';

@JsonSerializable()
class BreakingNewsRequest {
  final String apiKey;
  final String sources;
  final int page;
  final int pageSize;

  BreakingNewsRequest({
    required this.apiKey,
    this.sources = 'bbc-news, abc-news',
    this.page = 1,
    this.pageSize = defaultPageSize,
  });

  Map<String, dynamic> toJson() => _$BreakingNewsRequestToJson(this);
}
