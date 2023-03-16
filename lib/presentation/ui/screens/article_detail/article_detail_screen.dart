import 'package:auto_route/auto_route.dart';
import 'package:breaking_new/domain/entities/article_entity.dart';
import 'package:breaking_new/presentation/ui/screens/article_detail/components/content_description.dart';
import 'package:breaking_new/presentation/ui/screens/article_detail/components/header.dart';
import 'package:breaking_new/presentation/ui/screens/article_detail/components/media.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen({
    Key? key,
    required this.articleEntity,
  }) : super(key: key);

  final ArticleEntity articleEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => context.router.pop(),
          child: const Icon(Ionicons.chevron_back, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(
                title: articleEntity.title,
                publishedAt: articleEntity.publishedAt),
            Media(
              urlToImage: articleEntity.urlToImage,
            ),
            ContentDescription(
                description: articleEntity.description,
                content: articleEntity.content),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // todo: save the article
        },
        child: const Icon(Ionicons.bookmark, color: Colors.white),
      ),
    );
  }
}
