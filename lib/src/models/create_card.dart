// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_card.freezed.dart';
part 'create_card.g.dart';

@freezed

/// CreateCardResponse
class CreateCardResponse with _$CreateCardResponse {
  /// CreateCardResponse constructor
  const factory CreateCardResponse({
    @JsonKey(name: 'message') required String message,
    @JsonKey(name: 'card_id') required String cardId,
  }) = _CreateCardResponse;

  /// Deserialize json to CreateCardResponse
  factory CreateCardResponse.fromJson(Map<String, Object?> json) =>
      _$CreateCardResponseFromJson(json);
}
