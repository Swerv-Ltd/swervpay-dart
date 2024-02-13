import 'dart:convert';

import 'package:swervpay_dart/swervpay_dart.dart';

/// Fx resources
class FxResources {
  /// {@macro fx_resources}
  FxResources({
    required SwervpayClient client,
  }) : _client = client;

  /// Swervpay client
  final SwervpayClient _client;

  /// Rate
  Future<SuccessModel> rate({
    required String from,
    required String to,
    required double amount,
  }) async {
    final response = await _client.post(
      '/fx/rate',
      body: jsonEncode({
        'from': from,
        'to': to,
        'amount': amount,
      }),
    );
    return SuccessModel.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }

  /// Exchange
  Future<TransactionModel> exchange({
    required String from,
    required String to,
    required double amount,
  }) async {
    final response = await _client.post(
      '/fx/exchange',
      body: jsonEncode({
        'from': from,
        'to': to,
        'amount': amount,
      }),
    );
    return TransactionModel.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }
}
