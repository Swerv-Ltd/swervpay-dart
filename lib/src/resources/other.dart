import 'dart:convert';

import 'package:swervpay_dart/swervpay_dart.dart';

/// Other resources
class OtherResources {
  /// {@macro other_resources}
  OtherResources({
    required SwervpayClient client,
  }) : _client = client;

  /// Swervpay client
  final SwervpayClient _client;

  /// Get banks
  Future<List<BankModel>> banks() async {
    final response = await _client.get('/banks');

    final rawBanks = jsonDecode(response.body) as List<Map<String, dynamic>>;

    return rawBanks.map(BankModel.fromJson).toList();
  }

  /// Resolve account number

  Future<ResolveAccountNumberModel> resolveAccountNumber({
    required String bankCode,
    required String accountNumber,
  }) async {
    final response = await _client.post(
      '/resolve-account-number',
      body: jsonEncode({
        'bank_code': bankCode,
        'account_number': accountNumber,
      }),
    );
    return ResolveAccountNumberModel.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }
}
