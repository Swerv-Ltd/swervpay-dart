import 'package:swervpay_dart/swervpay_dart.dart';

Future<void> main() async {
  // Create a SwervpayClient instance
  final swervpayClient = SwervpayClient(
    config: SwervpayClientConfig(
      businessId: '<BUSINESS_ID>',
      secretKey: '<SECRET_KEY>',
    ),
  );

  // Fetch all banks
  final banks = await swervpayClient.other.banks();

  // Print the banks
  for (final bank in banks) {
    print(bank.bankName);
  }
}
