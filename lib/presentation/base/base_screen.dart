import 'package:auto_route/auto_route.dart';
import 'package:breaking_new/domain/entities/error_entity.dart';
import 'package:breaking_new/presentation/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

import '../../di/di.dart';
import '../views/dialogs/error_dialog.dart';
import '../views/dialogs/error_dialog_with_retry.dart';
import '../views/dialogs/loading_dialog.dart';
import '../views/widgets/uninitialized_widget.dart';
import 'base_controller.dart';

abstract class BaseScreen<C extends BaseController<T>, T extends BaseState>
    extends StatefulWidget implements AutoRouteWrapper {
  BaseScreen({
    Key? key,
  }) : super(key: key);

  Widget builder(BuildContext context);

  void onInitState(BuildContext context) {}

  C buildController() {
    return getIt<C>();
  }

  final retryMap = <String, Function>{};

  void doOnRetryWithTag(String tag) {
    if (retryMap[tag] != null) {
      retryMap[tag]!();
    }
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return StateNotifierProvider<C, T>(
      create: (_) => buildController(),
      builder: (_, __) => this,
    );
  }

  @override
  State<BaseScreen> createState() => _BaseScreenState<C, T>();
}

class _BaseScreenState<C extends BaseController, T extends BaseState>
    extends State<BaseScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<C>().loadData().then((e) {
        if (e != null) {
          getIt<ErrorDialog>().show(context, e.title, e.message);
        }
      });
    });
    widget.onInitState(context);
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
            return Stack(
              children: [
                Scaffold(
                  backgroundColor: Colors.black38,
                  body: widget.builder(context),
                ),
                Selector<T, bool>(
                    builder: (_, processing, __) {
                      if (processing) {
                        getIt<LoadingDialog>().show(context);
                      } else {
                        getIt<LoadingDialog>().hide();
                      }
                      return const SizedBox();
                    },
                    selector: (_, state) => state.processing),
                Selector<T, ErrorEntity?>(
                  selector: (_, state) => state.errorEntity,
                  builder: (_, errorEntity, __) {
                    if (errorEntity != null && errorEntity.tag != null) {
                      Future.microtask(() {
                        getIt<ErrorDialogWithRetry>().show(
                            context,
                            errorEntity.title,
                            errorEntity.message,
                            errorEntity.tag!,
                            errorEntity.params!, () {
                          context.read<C>().handleRetry(
                              widget.retryMap[errorEntity.tag!]!,
                              errorEntity.params!);
                        });
                      });
                      widget.retryMap['12']!(10);
                    }
                    return const SizedBox();
                  },
                )
              ],
            );
          }
        },
      ),
    );
  }
}
