import 'dart:convert';

import 'package:swervpay_dart/swervpay_dart.dart';

/// Card resources
class CardResources {
  /// {@macro card_resources}
  CardResources({
    required SwervpayClient client,
  }) : _client = client;

  /// Swervpay client
  final SwervpayClient _client;

  /// Create a card

  /// Retrieve a card
  Future<CardModel> get({
    required String id,
  }) async {
    final response = await _client.get('/cards/$id');
    return CardModel.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }

  /// Get all cards
  Future<List<CardModel>> gets({
    required int limit,
    required int page,
  }) async {
    final response = await _client.get(
      '/cards',
      queryParameters: {
        'limit': limit.toString(),
        'page': page.toString(),
      },
    );

    final rawCustomers =
        jsonDecode(response.body) as List<Map<String, dynamic>>;

    return rawCustomers.map(CardModel.fromJson).toList();
  }

  /// Fund card
  Future<SuccessModel> fund({
    required String id,
    required double amount,
  }) async {
    final response = await _client.post(
      '/cards/$id/fund',
      body: jsonEncode({
        'amount': amount,
      }),
    );
    return SuccessModel.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }

  /// Withdraw card
  Future<SuccessModel> withdraw({
    required String id,
    required double amount,
  }) async {
    final response = await _client.post(
      '/cards/$id/withdraw',
      body: jsonEncode({
        'amount': amount,
      }),
    );
    return SuccessModel.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }

  /// Freeze card
  Future<SuccessModel> freeze({
    required String id,
  }) async {
    final response = await _client.post(
      '/cards/$id/freeze',
      body: jsonEncode({}),
    );
    return SuccessModel.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }

  /// Terminate card
  Future<SuccessModel> terminate({
    required String id,
  }) async {
    final response = await _client.post(
      '/cards/$id/terminate',
      body: jsonEncode({}),
    );
    return SuccessModel.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }

  /// Create card
  Future<SuccessModel> create({
    required String? customerId,
    required Currency currency,
    required CardType type,
    required CardIssuer issuer,
    required String? nameOnCard,
    required double amount,
  }) async {
    final response = await _client.post(
      '/cards',
      body: jsonEncode({
        'customer_id': customerId,
        'currency': currency.name.toUpperCase(),
        'type':
            type == CardType.defaultCard ? 'DEFAULT' : type.name.toUpperCase(),
        'issuer': issuer.name.toUpperCase(),
        'name_on_card': nameOnCard,
        'amount': amount,
      }),
    );
    return SuccessModel.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }
}
