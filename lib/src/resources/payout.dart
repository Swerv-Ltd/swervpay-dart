import 'dart:convert';

import 'package:swervpay_dart/swervpay_dart.dart';

/// Payout resources
class PayoutResources {
  /// {@macro payout_resources}
  PayoutResources({
    required SwervpayClient client,
  }) : _client = client;

  /// Swervpay client
  final SwervpayClient _client;

  /// Get payout
  Future<TransactionModel> get({
    required String id,
  }) async {
    final response = await _client.get('/payouts/$id');
    return TransactionModel.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }

  /// Create a payout
  Future<CreatePayoutResponse> create({
    required String bankCode,
    required String accountNumber,
    required double amount,
    required Currency currency,
    required String reference,
    required String narration,
  }) async {
    final response = await _client.post(
      '/payouts',
      body: jsonEncode({
        'bank_code': bankCode,
        'account_number': accountNumber,
        'amount': amount,
        'currency': currency.name.toUpperCase(),
        'reference': reference,
        'narration': narration,
      }),
    );
    return CreatePayoutResponse.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }
}
