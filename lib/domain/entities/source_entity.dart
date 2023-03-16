import 'package:freezed_annotation/freezed_annotation.dart';

part 'source_entity.freezed.dart';

@freezed
class SourceEntity with _$SourceEntity {
  const factory SourceEntity({
    @Default(null) String? id,
    @Default(null) String? name,
  }) = _SourceEntity;
}
