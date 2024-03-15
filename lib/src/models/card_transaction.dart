// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_transaction.freezed.dart';
part 'card_transaction.g.dart';

@freezed

///
class CardTransactionModel with _$CardTransactionModel {
  ///
  const factory CardTransactionModel({
    @JsonKey(name: 'amount') required String amount,
    @JsonKey(name: 'category') required String category,
    @JsonKey(name: 'charges') required String charges,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'currency') required String currency,
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'merchant_city') required String merchantCity,
    @JsonKey(name: 'merchant_country') required String merchantCountry,
    @JsonKey(name: 'merchant_mcc') required String merchantMcc,
    @JsonKey(name: 'merchant_mid') required String merchantMid,
    @JsonKey(name: 'merchant_name') required String merchantName,
    @JsonKey(name: 'merchant_postal_code') required String merchantPostalCode,
    @JsonKey(name: 'merchant_state') required String merchantState,
    @JsonKey(name: 'metadata') required String metadata,
    @JsonKey(name: 'reference') required String reference,
    @JsonKey(name: 'report') required String report,
    @JsonKey(name: 'report_message') required String reportMessage,
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'type') required String type,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _CardTransactionModel;

  ///
  factory CardTransactionModel.fromJson(Map<String, Object?> json) =>
      _$CardTransactionModelFromJson(json);
}
