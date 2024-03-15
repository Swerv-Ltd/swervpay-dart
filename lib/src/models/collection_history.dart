// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'collection_history.freezed.dart';
part 'collection_history.g.dart';

@freezed

/// CollectionHistoryModel
class CollectionHistoryModel with _$CollectionHistoryModel {
  ///
  const factory CollectionHistoryModel({
    @JsonKey(name: 'amount') required String amount,
    @JsonKey(name: 'charges') required String charges,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'currency') required String currency,
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'payment_method') required String paymentMethod,
    @JsonKey(name: 'reference') required String reference,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _CollectionHistoryModel;

  /// Deserialize json to CreatePayoutResponse
  factory CollectionHistoryModel.fromJson(Map<String, Object?> json) =>
      _$CollectionHistoryModelFromJson(json);
}
