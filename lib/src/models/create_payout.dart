// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_payout.freezed.dart';
part 'create_payout.g.dart';

@freezed

/// CreatePayoutResponse
class CreatePayoutResponse with _$CreatePayoutResponse {
  /// CreatePayoutResponse constructor
  const factory CreatePayoutResponse({
    @JsonKey(name: 'message') required String message,
    @JsonKey(name: 'reference') required String reference,
  }) = _CreatePayoutResponse;

  /// Deserialize json to CreatePayoutResponse
  factory CreatePayoutResponse.fromJson(Map<String, Object?> json) =>
      _$CreatePayoutResponseFromJson(json);
}
