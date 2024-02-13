// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet.freezed.dart';
part 'wallet.g.dart';

@freezed

/// Wallet model
class WalletModel with _$WalletModel {
  /// Wallet model constructor
  const factory WalletModel({
    @JsonKey(name: 'account_name') required String accountName,
    @JsonKey(name: 'account_number') required String accountNumber,
    @JsonKey(name: 'account_type') required String accountType,
    @JsonKey(name: 'address') required String address,
    @JsonKey(name: 'asset_id') required String assetId,
    @JsonKey(name: 'balance') required String balance,
    @JsonKey(name: 'bank_address') required String bankAddress,
    @JsonKey(name: 'bank_code') required String bankCode,
    @JsonKey(name: 'bank_name') required String bankName,
    @JsonKey(name: 'business_id') required String businessId,
    @JsonKey(name: 'can_received') required String canReceived,
    @JsonKey(name: 'can_send') required String canSend,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'customer_id') required String customerId,
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'is_blocked') required String isBlocked,
    @JsonKey(name: 'label') required String label,
    @JsonKey(name: 'parent_wallet_id') required String parentWalletId,
    @JsonKey(name: 'pending_balance') required String pendingBalance,
    @JsonKey(name: 'reference') required String reference,
    @JsonKey(name: 'routing_number') required String routingNumber,
    @JsonKey(name: 'total_received') required String totalReceived,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _WalletModel;

  /// Deserialize json to WalletModel
  factory WalletModel.fromJson(Map<String, Object?> json) =>
      _$WalletModelFromJson(json);
}
