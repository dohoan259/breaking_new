import 'package:auto_route/auto_route.dart';
import 'package:breaking_new/presentation/base/base_screen.dart';
import 'package:breaking_new/presentation/routers/routers.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

import '../../widgets/article_item_widget.dart';
import 'breaking_news_controller.dart';
import 'breaking_news_state.dart';

class BreakingNewsScreen
    extends BaseScreen<BreakingNewsController, BreakingNewsState> {
  const BreakingNewsScreen({Key? key}) : super(key: key);

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
      body: StateNotifierBuilder(
        stateNotifier: context.read<BreakingNewsController>(),
        builder: (_, state, __) {
          //   ScrollController scrollController,
          //   List<Article> articles,
          //   bool noMoreData,
          // ) {
          return CustomScrollView(
            controller: ScrollController(),
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => ArticleItemWidget(
                    article: state.articles[index],
                    onArticlePressed: (e) {
                      context.pushRoute(
                          ArticleDetailScreenRoute(articleEntity: e));
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
        },
      ),
    );
  }

// @override
// Widget build(BuildContext context) {
//   final remoteArticlesCubit = context.watch<BreakingNewsController>();
//   // final scrollController = useScrollController();
//
//   // useEffect(() {
//   //   scrollController.onScrollEndsListener(() {
//   //     remoteArticlesCubit.getBreakingNewsArticles();
//   //   });
//   //
//   //   return scrollController.dispose;
//   // }, const []);
//
//   return Scaffold(
//     appBar: AppBar(
//       title: const Text(
//         'Daily News',
//         style: TextStyle(color: Colors.black),
//       ),
//       actions: [
//         GestureDetector(
//           onTap: () => context.go('/details'),
//           child: const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 14),
//             child: Icon(Ionicons.bookmark, color: Colors.black),
//           ),
//         ),
//       ],
//     ),
//     body: StateNotifierBuilder<BreakingNewsState>(
//       stateNotifier: context.read<BreakingNewsController>(),
//       builder: (_, state, __) {
//         switch (state.runtimeType) {
//           case RemoteArticlesLoading:
//             return const Center(child: CupertinoActivityIndicator());
//           case RemoteArticlesFailed:
//             return const Center(child: Icon(Ionicons.refresh));
//           case RemoteArticlesSuccess:
//             return _buildArticles(
//               scrollController,
//               state.articles,
//               state.noMoreData,
//             );
//           default:
//             return const SizedBox();
//         }
//       },
//     ),
//   );
// }
//
// Widget _buildArticles(
//   ScrollController scrollController,
//   List<Article> articles,
//   bool noMoreData,
// ) {
//   return CustomScrollView(
//     controller: scrollController,
//     slivers: [
//       SliverList(
//         delegate: SliverChildBuilderDelegate(
//           (context, index) => ArticleWidget(
//             article: articles[index],
//             onArticlePressed: (e) => appRouter.push(
//               ArticleDetailsViewRoute(article: e),
//             ),
//           ),
//           childCount: articles.length,
//         ),
//       ),
//       if (!noMoreData)
//         const SliverToBoxAdapter(
//           child: Padding(
//             padding: EdgeInsets.only(top: 14, bottom: 32),
//             child: CupertinoActivityIndicator(),
//           ),
//         )
//     ],
//   );
// }
}
