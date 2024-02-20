// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed

/// Transaction model
class TransactionModel with _$TransactionModel {
  /// Transaction model constructor
  const factory TransactionModel({
    @JsonKey(name: 'account_name') required String accountName,
    @JsonKey(name: 'account_number') required String accountNumber,
    @JsonKey(name: 'amount') required String amount,
    @JsonKey(name: 'bank_code') required String bankCode,
    @JsonKey(name: 'bank_name') required String bankName,
    @JsonKey(name: 'category') required String category,
    @JsonKey(name: 'charges') required String charges,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'detail') required String detail,
    @JsonKey(name: 'fiat_rate') required String fiatRate,
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'reference') required String reference,
    @JsonKey(name: 'report') required String report,
    @JsonKey(name: 'report_message') required String reportMessage,
    @JsonKey(name: 'session_id') required String sessionId,
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'type') required String type,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _TransactionModel;

  /// Deserialize json to TransactionModel
  factory TransactionModel.fromJson(Map<String, Object?> json) =>
      _$TransactionModelFromJson(json);
}
