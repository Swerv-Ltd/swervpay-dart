// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'exchange_rate.freezed.dart';
part 'exchange_rate.g.dart';

@freezed

/// ExchangeRateResponse
class ExchangeRateResponse with _$ExchangeRateResponse {
  /// ExchangeRateResponse constructor
  const factory ExchangeRateResponse({
    @JsonKey(name: 'from') required FromOrToResponse from,
    @JsonKey(name: 'rate') required double rate,
    @JsonKey(name: 'to') required FromOrToResponse to,
  }) = _ExchangeRateResponse;

  /// Deserialize json to CreatePayoutResponse
  factory ExchangeRateResponse.fromJson(Map<String, Object?> json) =>
      _$ExchangeRateResponseFromJson(json);
}

@freezed

/// FromOrToResponse
class FromOrToResponse with _$FromOrToResponse {
  /// FromOrToResponse constructor
  const factory FromOrToResponse({
    @JsonKey(name: 'amount') required double amount,
    @JsonKey(name: 'currency') required String currency,
  }) = _FromOrToResponse;

  /// Deserialize json to CreatePayoutResponse
  factory FromOrToResponse.fromJson(Map<String, Object?> json) =>
      _$FromOrToResponseFromJson(json);
}
