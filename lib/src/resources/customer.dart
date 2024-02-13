import 'dart:convert';

import 'package:swervpay_dart/swervpay_dart.dart';

/// Customer resources
class CustomerResources {
  /// {@macro customer_resources}
  CustomerResources({
    required SwervpayClient client,
  }) : _client = client;

  /// Swervpay client
  final SwervpayClient _client;

  /// Create a customer
  Future<CustomerModel> create({
    required String firstname,
    required String lastname,
    required double middename,
    required String country,
    required String email,
  }) async {
    final response = await _client.post(
      '/customers',
      body: jsonEncode({
        'firstname': firstname,
        'lastname': lastname,
        'middlename': middename,
        'country': country,
        'email': email,
      }),
    );
    return CustomerModel.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }

  /// Update a customer

  Future<SuccessModel> update({
    required String id,
    required String email,
    required double phoneNumber,
  }) async {
    final response = await _client.post(
      '/customers/$id/update',
      body: jsonEncode({
        'email': email,
        'phone_number': phoneNumber,
      }),
    );
    return SuccessModel.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }

  /// Complete customer KYC
  Future<SuccessModel> kyc({
    required String id,
    required String bankCode,
    required String accountNumber,
    required double amount,
    required String currency,
    required String reference,
    required String narration,
  }) async {
    final response = await _client.post(
      '/customers/$id/kyc',
      body: jsonEncode({
        'bank_code': bankCode,
        'account_number': accountNumber,
        'amount': amount,
        'currency': currency,
        'reference': reference,
        'narration': narration,
      }),
    );
    return SuccessModel.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }

  /// Blacklist a customer
  Future<SuccessModel> blacklist({required String id}) async {
    final response = await _client.post(
      '/customers/$id/blacklist',
      body: jsonEncode({}),
    );
    return SuccessModel.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }

  /// Get a customer
  Future<CustomerModel> get({required String id}) async {
    final response = await _client.get(
      '/customers/$id',
    );
    return CustomerModel.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }

  /// Get all customers
  Future<List<CustomerModel>> gets({
    required int limit,
    required int page,
  }) async {
    final response = await _client.get(
      '/customers',
      queryParameters: {
        'limit': limit.toString(),
        'page': page.toString(),
      },
    );

    final rawCustomers =
        jsonDecode(response.body) as List<Map<String, dynamic>>;

    return rawCustomers.map(CustomerModel.fromJson).toList();
  }
}
