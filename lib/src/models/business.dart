// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'business.freezed.dart';
part 'business.g.dart';

@freezed

/// Business model
class BusinessModel with _$BusinessModel {
  /// Business model constructor
  const factory BusinessModel({
    @JsonKey(name: 'address') required String address,
    @JsonKey(name: 'country') required String country,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'logo') required String logo,
    @JsonKey(name: 'slug') required String slug,
    @JsonKey(name: 'type') required String type,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _BusinessModel;

  /// Deserialize json to BusinessModel
  factory BusinessModel.fromJson(Map<String, Object?> json) =>
      _$BusinessModelFromJson(json);
}
