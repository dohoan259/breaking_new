import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/error_entity.dart';
import 'base_controller.dart';
import 'base_state.dart';

@singleton
class ErrorListener {
  Widget handleError<C extends BaseController, T extends BaseState>(
      BuildContext context, ErrorEntity? error) {
    // return UnknownErrorPage<C>(
    //   message: error?.message,
    // );
    return const SizedBox();
  }
}
