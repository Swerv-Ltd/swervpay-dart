// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer.freezed.dart';
part 'customer.g.dart';

@freezed

/// Customer model
class CustomerModel with _$CustomerModel {
  /// Customer model constructor
  const factory CustomerModel({
    @JsonKey(name: 'business_id') required String businessId,
    @JsonKey(name: 'country') required String country,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'is_blacklisted') required String isBlacklisted,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'middle_name') required String middleName,
    @JsonKey(name: 'phone_number') required String phoneNumber,
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _CustomerModel;

  /// Deserialize json to CustomerModel
  factory CustomerModel.fromJson(Map<String, Object?> json) =>
      _$CustomerModelFromJson(json);
}
