import 'package:breaking_new/presentation/ui/screens/breaking_news/breaking_news_controller.dart';
import 'package:breaking_new/presentation/ui/screens/breaking_news/breaking_news_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bc = context.watch<BreakingNewsController>();
    return Scaffold(
      body: Center(
        child: Selector<BreakingNewsState, bool>(
          selector: (_, state) => state.processing,
          builder: (_, processing, __) {
            return Text('test $processing');
          },
        ),
      ),
    );
  }
}
