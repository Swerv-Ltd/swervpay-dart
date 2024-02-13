import 'dart:convert';

import 'package:swervpay_dart/swervpay_dart.dart';

/// Webhook resources
class WebhookResources {
  /// {@macro webhook_resources}
  WebhookResources({
    required SwervpayClient client,
  }) : _client = client;

  /// Swervpay client
  final SwervpayClient _client;

  /// Send a test webhook
  Future<SuccessModel> test({
    required String id,
  }) async {
    final response = await _client.get('/webhook/$id/test');
    return SuccessModel.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }

  /// Retry a webhook log
  Future<SuccessModel> retry({
    required String id,
  }) async {
    final response = await _client.get('/webhook/$id/retry');
    return SuccessModel.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }
}
