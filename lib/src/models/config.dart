/// Swervpay client configuration
class SwervpayClientConfig {
  /// {@macro swervpay_client_config}
  SwervpayClientConfig({
    required this.secretKey,
    required this.businessId,
    this.baseUrl = 'https://api.swervpay.co/api/v1',
    this.sandboxBaseUrl = 'https://sandbox.swervpay.co/api/v1',
    this.isSandbox = false,
  });

  /// Secret key for the Swervpay client
  final String secretKey;

  /// Business ID for the Swervpay client
  final String businessId;

  /// Base URL for the Swervpay client
  final String baseUrl;

  /// Sandbox Base URL for the Swervpay client
  final String sandboxBaseUrl;

  /// Is sandbox
  final bool isSandbox;
}
