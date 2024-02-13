import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:swervpay_dart/src/version.dart';
import 'package:swervpay_dart/swervpay_dart.dart';

/// List of accpetable HTTP status codes.
const acceptHttpStatus = [
  HttpStatus.ok,
  HttpStatus.accepted,
  HttpStatus.created,
];

/// Definition of a post call used by this client.
typedef PostCall = Future<http.Response> Function(
  Uri, {
  Object? body,
  Map<String, String>? headers,
});

/// Definition of a patch call used by this client.
typedef PatchCall = Future<http.Response> Function(
  Uri, {
  Object? body,
  Map<String, String>? headers,
});

/// Definition of a put call used by this client.
typedef PutCall = Future<http.Response> Function(
  Uri, {
  Object? body,
  Map<String, String>? headers,
});

/// Definition of a get call used by this client.
typedef GetCall = Future<http.Response> Function(
  Uri, {
  Map<String, String>? headers,
});

/// A factory to create and connect to a [WebSocket] instance.
typedef WebSocketFactory = WebSocket Function(
  Uri uri, {
  Duration? timeout,
  String? binaryType,
});

/// Dart Client for Swervpay
///
/// [SwervpayClient] is dart API wrapper for interacting
/// with various resources in the Swervpay API.
///
class SwervpayClient {
  /// {@macro swervpay_client}
  SwervpayClient({
    required SwervpayClientConfig config,
    PostCall postCall = http.post,
    PutCall putCall = http.put,
    PatchCall patchCall = http.patch,
    GetCall getCall = http.get,
  })  : _base = Uri.parse(config.baseUrl),
        _config = config,
        _post = postCall,
        _put = putCall,
        _patch = patchCall,
        _get = getCall;

  final Uri _base;
  final PostCall _post;
  final PostCall _put;
  final PatchCall _patch;
  final GetCall _get;
  final SwervpayClientConfig _config;

  late final StreamSubscription<String?>? _accessTokenSubscription;
  String? _accessToken;

  Map<String, String> get _headers => {
        if (_accessToken != null) 'Authorization': 'Bearer $_accessToken',
        'User-Agent': 'Swervpay/Dart-Sdk $packageVersion',
      };

  /// The business resources.
  late final BusinessResources business = BusinessResources(client: this);

  /// The card resources.
  late final CardResources card = CardResources(client: this);

  /// The customer resources.
  late final CustomerResources customer = CustomerResources(client: this);

  /// The foreign exchange resources.
  late final FxResources fx = FxResources(client: this);

  /// The other resources.
  late final OtherResources other = OtherResources(client: this);

  /// The payout resources.
  late final PayoutResources payout = PayoutResources(client: this);

  /// The transaction resources.
  late final TransactionResources transaction =
      TransactionResources(client: this);

  /// The wallet resources.
  late final WalletResources wallet = WalletResources(client: this);

  /// The webhook resources.
  late final WebhookResources webhook = WebhookResources(client: this);

  Future<http.Response> _handleUnauthorized(
    Future<http.Response> Function() sendRequest,
  ) async {
    final response = await sendRequest();

    if (response.statusCode == HttpStatus.unauthorized) {
      _accessToken = await _refreshAccessToken();

      return sendRequest();
    }
    return response;
  }

  Future<String> _refreshAccessToken() async {
    final response = await _post(
      _base.replace(
        path: '/auth',
      ),
      body: jsonEncode({}),
      headers: _headers
        ..addContentTypeJson()
        ..addAll({
          'Authorization': 'Basic ${base64Encode(
            utf8.encode(
              '${_config.businessId}:${_config.secretKey}',
            ),
          )}',
        }),
    );

    if (response.statusCode != HttpStatus.ok) {
      throw SwervpayClientError(
        'Failed to refresh access token',
        StackTrace.current,
      );
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;

    return data['access_token'] as String;
  }

  /// Dispose of resources used by this client.
  Future<void> dispose() async {
    await _accessTokenSubscription?.cancel();
  }

  /// Sends a POST request to the specified [path] with the given [body].
  Future<http.Response> post(
    String path, {
    Object? body,
    Map<String, String>? queryParameters,
    Map<String, String>? customHeader,
  }) async {
    return _handleUnauthorized(() async {
      final response = await _post(
        _base.replace(
          path: path,
          queryParameters: queryParameters,
        ),
        body: body,
        headers: _headers
          ..addContentTypeJson()
          ..addAll(customHeader ?? {}),
      );

      return response;
    });
  }

  /// Sends a PATCH request to the specified [path] with the given [body].
  Future<http.Response> patch(
    String path, {
    Object? body,
    Map<String, String>? queryParameters,
  }) async {
    return _handleUnauthorized(() async {
      final response = await _patch(
        _base.replace(
          path: path,
          queryParameters: queryParameters,
        ),
        body: body,
        headers: _headers..addContentTypeJson(),
      );

      return response;
    });
  }

  /// Sends a PUT request to the specified [path] with the given [body].
  Future<http.Response> put(
    String path, {
    Object? body,
  }) async {
    return _handleUnauthorized(() async {
      final response = await _put(
        _base.replace(
          path: path,
        ),
        body: body,
        headers: _headers..addContentTypeJson(),
      );

      return response;
    });
  }

  /// Sends a GET request to the specified [path].
  Future<http.Response> get(
    String path, {
    Map<String, String>? queryParameters,
  }) async {
    return _handleUnauthorized(() async {
      final response = await _get(
        _base.replace(
          path: path,
          queryParameters: queryParameters,
        ),
        headers: _headers,
      );

      return response;
    });
  }

  /// Sends a GET request to the specified public [path].
  Future<http.Response> getPublic(
    String path, {
    Map<String, String>? queryParameters,
  }) async {
    return _handleUnauthorized(() async {
      final response = await _get(
        _base.replace(
          path: path,
          queryParameters: queryParameters,
        ),
        headers: _headers,
      );

      return response;
    });
  }
}

extension on Map<String, String> {
  void addContentTypeJson() {
    addAll({HttpHeaders.contentTypeHeader: ContentType.json.value});
  }
}
