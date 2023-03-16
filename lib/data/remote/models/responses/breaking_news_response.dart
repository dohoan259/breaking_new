import 'package:freezed_annotation/freezed_annotation.dart';

part 'breaking_news_response.g.dart';

@JsonSerializable()
class BreakingNewsResponse {
  final String status;
  final int totalResults;
  final List<Article> articles;

  BreakingNewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory BreakingNewsResponse.fromJson(Map<String, dynamic> json) =>
      _$BreakingNewsResponseFromJson(json);
}

@JsonSerializable()
class Article {
  final int? id;
  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const Article({
    this.id,
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}

@JsonSerializable()
class Source {
  final String? id;
  final String? name;

  Source({required this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}
