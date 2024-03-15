import 'dart:convert';

import 'package:swervpay_dart/swervpay_dart.dart';

/// Collection resources
class CollectionResources {
  /// {@macro collection_resources}
  CollectionResources({
    required SwervpayClient client,
  }) : _client = client;

  /// Swervpay client
  final SwervpayClient _client;

  /// Retrieve a collection
  Future<WalletModel> get({
    required String id,
  }) async {
    final response = await _client.get('/collections/$id');
    return WalletModel.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }

  /// Get all collections
  Future<List<WalletModel>> gets({
    required int limit,
    required int page,
  }) async {
    final response = await _client.get(
      '/collections',
      queryParameters: {
        'limit': limit.toString(),
        'page': page.toString(),
      },
    );

    final rawCustomers =
        jsonDecode(response.body) as List<Map<String, dynamic>>;

    return rawCustomers.map(WalletModel.fromJson).toList();
  }

  /// Retrieve a collection transaction
  Future<CollectionHistoryModel> transaction({
    required String id,
    required String transactionId,
  }) async {
    final response =
        await _client.get('/collections/$id/transactions/$transactionId');
    return CollectionHistoryModel.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }

  /// Get all collection transactions
  Future<List<CollectionHistoryModel>> transactions({
    required String id,
    required int limit,
    required int page,
  }) async {
    final response = await _client.get(
      '/collections/$id/transactions',
      queryParameters: {
        'limit': limit.toString(),
        'page': page.toString(),
      },
    );

    final rawCustomers =
        jsonDecode(response.body) as List<Map<String, dynamic>>;

    return rawCustomers.map(CollectionHistoryModel.fromJson).toList();
  }

  /// Create collection
  Future<WalletModel> create({
    required String? customerId,
    required Currency currency,
    required CollectionType type,
    required CardIssuer issuer,
    required String? merchantName,
    required double amount,
  }) async {
    final response = await _client.post(
      '/collections',
      body: jsonEncode({
        'customer_id': customerId,
        'currency': currency.name.toUpperCase(),
        'type': type == CollectionType.defaultType
            ? 'DEFAULT'
            : type.name.toUpperCase(),
        'merchant_name': merchantName,
        'amount': amount,
      }),
    );
    return WalletModel.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }
}
