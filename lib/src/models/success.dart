// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'success.freezed.dart';
part 'success.g.dart';

@freezed

/// Success model
class SuccessModel with _$SuccessModel {
  /// Success model constructor
  const factory SuccessModel({
    @JsonKey(name: 'message') required String message,
  }) = _SuccessModel;

  /// Deserialize json to SuccessModel
  factory SuccessModel.fromJson(Map<String, Object?> json) =>
      _$SuccessModelFromJson(json);
}
