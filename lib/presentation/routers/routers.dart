import 'package:breaking_new/presentation/ui/screens/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:go_router/go_router.dart';

import '../../di/di.dart';
import '../ui/screens/article_detail/article_detail_screen.dart';
import '../ui/screens/breaking_news/breaking_news_controller.dart';
import '../ui/screens/breaking_news/breaking_news_state.dart';

/// The route configuration.
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        // return const BreakingNewsScreen();
        return StateNotifierProvider<BreakingNewsController, BreakingNewsState>(
          create: (_) => getIt<BreakingNewsController>(),
          builder: (_, __) {
            return const TestScreen();
            // return const BreakingNewsScreen();
          },
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const ArticleDetailScreen();
          },
        ),
      ],
    ),
  ],
);
