import 'package:state_notifier/state_notifier.dart';

import '../../domain/entities/error_entity.dart';
import 'base_state.dart';

abstract class BaseController<S extends BaseState> extends StateNotifier<S>
    with LocatorMixin {
  BaseController(S state) : super(state);

  Future<ErrorEntity?> loadData();

  Future<void> reload() async {}
}
