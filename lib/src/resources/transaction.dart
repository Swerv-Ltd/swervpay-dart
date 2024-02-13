import 'dart:convert';

import 'package:swervpay_dart/swervpay_dart.dart';

/// Transaction resources
class TransactionResources {
  /// {@macro transaction_resources}
  TransactionResources({
    required SwervpayClient client,
  }) : _client = client;

  /// Swervpay client
  final SwervpayClient _client;

  /// Get transactions
  Future<List<TransactionModel>> gets({
    required int limit,
    required int page,
  }) async {
    final response = await _client.get(
      '/transactions',
      queryParameters: {
        'limit': limit.toString(),
        'page': page.toString(),
      },
    );

    final rawCards = jsonDecode(response.body) as List<Map<String, dynamic>>;

    return rawCards.map(TransactionModel.fromJson).toList();
  }

  /// Get transaction
  Future<TransactionModel> get({
    required String id,
  }) async {
    final response = await _client.get('/transactions/$id');
    return TransactionModel.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }
}
