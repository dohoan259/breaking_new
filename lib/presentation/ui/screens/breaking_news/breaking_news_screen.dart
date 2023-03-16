import 'package:auto_route/auto_route.dart';
import 'package:breaking_new/presentation/base/base_screen.dart';
import 'package:breaking_new/presentation/routers/routers.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

import '../../widgets/article_item_widget.dart';
import 'breaking_news_controller.dart';
import 'breaking_news_state.dart';

class BreakingNewsScreen
    extends BaseScreen<BreakingNewsController, BreakingNewsState> {
  BreakingNewsScreen({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();

  @override
  void onInitState(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        context.read<BreakingNewsController>().loadMore();
      }
    });
    super.onInitState(context);
  }

  @override
  Widget contentBuilder(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daily News',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Icon(Ionicons.bookmark, color: Colors.black),
            ),
          ),
        ],
      ),
      body: Consumer<BreakingNewsState>(builder: (_, state, __) {
        return CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ArticleItemWidget(
                  article: state.articles[index],
                  onArticlePressed: (e) {
                    context
                        .pushRoute(ArticleDetailScreenRoute(articleEntity: e));
                  },
                ),
                childCount: state.articles.length,
              ),
            ),
            if (!state.noMoreData)
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 14, bottom: 32),
                  child: CupertinoActivityIndicator(),
                ),
              )
          ],
        );
      }),
    );
  }
}
