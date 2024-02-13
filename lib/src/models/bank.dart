// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank.freezed.dart';
part 'bank.g.dart';

@freezed

/// Bank model
class BankModel with _$BankModel {
  /// Bank model constructor
  const factory BankModel({
    @JsonKey(name: 'bank_code') required String bankCode,
    @JsonKey(name: 'bank_name') required String bankName,
  }) = _BankModel;

  /// Deserialize json to BankModel
  factory BankModel.fromJson(Map<String, Object?> json) =>
      _$BankModelFromJson(json);
}
