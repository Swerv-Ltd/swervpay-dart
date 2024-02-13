// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'card.freezed.dart';
part 'card.g.dart';

@freezed

/// Card model
class CardModel with _$CardModel {
  /// Card model constructor
  const factory CardModel({
    @JsonKey(name: 'address_city') required String addressCity,
    @JsonKey(name: 'address_country') required String addressCountry,
    @JsonKey(name: 'address_postal_code') required String addressPostalCode,
    @JsonKey(name: 'address_state') required String addressState,
    @JsonKey(name: 'address_street') required String addressStreet,
    @JsonKey(name: 'balance') required String balance,
    @JsonKey(name: 'business_id') required String businessId,
    @JsonKey(name: 'card_number') required String cardNumber,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'currency') required String currency,
    @JsonKey(name: 'customer_id') required String customerId,
    @JsonKey(name: 'cvv') required String cvv,
    @JsonKey(name: 'expiry') required String expiry,
    @JsonKey(name: 'freeze') required String freeze,
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'issuer') required String issuer,
    @JsonKey(name: 'masked_pan') required String maskedPan,
    @JsonKey(name: 'name_on_card') required String nameOnCard,
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'total_funded') required String totalFunded,
    @JsonKey(name: 'type') required String type,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _CardModel;

  /// Deserialize json to CardModel
  factory CardModel.fromJson(Map<String, Object?> json) =>
      _$CardModelFromJson(json);
}
