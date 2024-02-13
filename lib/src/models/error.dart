// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'error.freezed.dart';
part 'error.g.dart';

@freezed

/// Error model
class ErrorModel with _$ErrorModel {
  /// Error model constructor
  const factory ErrorModel({
    @JsonKey(name: 'message') required String message,
    @JsonKey(name: 'values') required String values,
  }) = _ErrorModel;

  /// Deserialize json to ErrorModel
  factory ErrorModel.fromJson(Map<String, Object?> json) =>
      _$ErrorModelFromJson(json);
}
