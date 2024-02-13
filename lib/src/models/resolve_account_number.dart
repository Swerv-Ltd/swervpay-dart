// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'resolve_account_number.freezed.dart';
part 'resolve_account_number.g.dart';

@freezed

/// Resolve Account Number Model
class ResolveAccountNumberModel with _$ResolveAccountNumberModel {
  /// Resolve Account Number Model constructor
  const factory ResolveAccountNumberModel({
    @JsonKey(name: 'account_name') required String accountName,
    @JsonKey(name: 'account_number') required String accountNumber,
    @JsonKey(name: 'bank_code') required String bankCode,
    @JsonKey(name: 'bank_name') required String bankName,
  }) = _ResolveAccountNumberModel;

  /// Deserialize json to ResolveAccountNumberModel
  factory ResolveAccountNumberModel.fromJson(Map<String, Object?> json) =>
      _$ResolveAccountNumberModelFromJson(json);
}
