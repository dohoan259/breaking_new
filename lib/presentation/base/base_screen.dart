import 'package:breaking_new/presentation/base/base_state.dart';
import 'package:breaking_new/presentation/ui/dialog/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ui/widgets/uninitialized_widget.dart';
import 'base_controller.dart';

abstract class BaseScreen<C extends BaseController, T extends BaseState>
    extends StatefulWidget {
  const BaseScreen({
    Key? key,
    this.errorView,
  }) : super(key: key);

  Widget contentBuilder(BuildContext context);

  final Widget? errorView;

  @override
  State<BaseScreen> createState() => _BaseScreenState<C, T>();
}

class _BaseScreenState<C extends BaseController, T extends BaseState>
    extends State<BaseScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<C>(context, listen: false).loadData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Selector<T, ScreenStatus>(
        selector: (context, state) => state.screenStatus,
        builder: (_, viewState, __) {
          if (viewState == ScreenStatus.uninitialized) {
            return const UninitializedWidget();
          } else {
            // todo: error: mapping error with error code
            return Stack(
              children: [
                Scaffold(
                  backgroundColor: Colors.black38,
                  body: widget.contentBuilder(context),
                ),
                Selector<T, bool>(
                    builder: (_, processing, __) {
                      if (processing) {
                        LoadingDialog().show(context);
                      } else {
                        LoadingDialog().hide();
                      }
                      return const SizedBox();
                    },
                    selector: (_, state) => state.processing)
              ],
            );
          }
        },
      ),
    );
  }
}
