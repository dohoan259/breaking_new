import '../../domain/entities/error_entity.dart';

abstract class BaseState {
  final ScreenStatus screenStatus;
  final bool processing;
  final ErrorEntity? errorEntity;

  BaseState(
      {required this.screenStatus, required this.processing, this.errorEntity});
}

enum ScreenStatus { uninitialized, loaded, failed }
