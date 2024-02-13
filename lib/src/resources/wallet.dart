import 'dart:convert';

import 'package:swervpay_dart/swervpay_dart.dart';

/// Wallet resources
class WalletResources {
  /// {@macro wallet_resources}
  WalletResources({
    required SwervpayClient client,
  }) : _client = client;

  /// Swervpay client
  final SwervpayClient _client;

  /// Get wallets
  Future<List<CardModel>> gets({
    required int limit,
    required int page,
  }) async {
    final response = await _client.get(
      '/wallets',
      queryParameters: {
        'limit': limit.toString(),
        'page': page.toString(),
      },
    );

    final rawCards = jsonDecode(response.body) as List<Map<String, dynamic>>;

    return rawCards.map(CardModel.fromJson).toList();
  }

  /// Get wallet
  Future<WalletModel> get({
    required String id,
  }) async {
    final response = await _client.get('/wallets/$id');
    return WalletModel.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }
}
