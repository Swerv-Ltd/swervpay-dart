/// Extracts the error message from the response data
String extractErrorMessage(Map<String, dynamic> data) {
  final apiError = data['apierror'] as Map<String, dynamic>?;
  if (apiError != null && apiError['message'] != null) {
    return apiError['message'] as String;
  }

  return 'Something went wrong, try again';
}
