import 'package:auto_route/annotations.dart';

import '../ui/screens/article_detail/article_detail_screen.dart';
import '../ui/screens/breaking_news/breaking_news_screen.dart';

/// The route configuration.
@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route,Screen',
  routes: <AutoRoute>[
    AutoRoute(page: BreakingNewsScreen, initial: true),
    AutoRoute(page: ArticleDetailScreen),
  ],
)
class $AppRouter {}
