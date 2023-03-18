import 'package:auto_route/annotations.dart';

import '../views/screens/article_detail/article_detail_screen.dart';
import '../views/screens/breaking_news/breaking_news_screen.dart';

/// The route configuration.
@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route,Screen',
  routes: <AutoRoute>[
    AutoRoute(page: BreakingNewsScreen, initial: true),
    AutoRoute(page: ArticleDetailScreen),
  ],
)
class $AppRouter {}
