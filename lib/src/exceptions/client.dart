import 'dart:convert';

import 'package:swervpay_dart/swervpay_dart.dart';

/// Swervpay client error.
class SwervpayClientError implements Exception {
  /// Swervpay client error.
  SwervpayClientError(this.cause, this.stackTrace);

  /// Error cause.
  final String cause;

  /// The stack trace of the error.
  final StackTrace stackTrace;

  @override
  String toString() {
    return cause;
  }

  /// Error message.
  String get message {
    return extractErrorMessage(jsonDecode(cause) as Map<String, dynamic>);
  }
}
