import 'dart:convert';

import 'package:swervpay_dart/swervpay_dart.dart';

/// Business resources
class BusinessResources {
  /// {@macro business_resources}
  BusinessResources({
    required SwervpayClient client,
  }) : _client = client;

  /// Swervpay client
  final SwervpayClient _client;

  /// Get business
  Future<BusinessModel> get() async {
    final response = await _client.get('/business');
    return BusinessModel.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }
}
