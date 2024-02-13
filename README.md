<div align="center">
  <a href="https://swervpay.co" target="_blank">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://avatars.githubusercontent.com/u/108650375?s=200&v=4">
    <img src="https://avatars.githubusercontent.com/u/108650375?s=200&v=4" width="60" alt="Logo"/>
  </picture>
  </a>
</div>

<h1 align="center">Dart Client for Swervpay</h1>

[![pub package][pub_badge]][pub_badge_link]
[![License: MIT][license_badge]][license_badge_link]

<p align="center">
    <br />
    <a href="https://docs.swervpay.co" rel="dofollow"><strong>Explore the docs »</strong></a>
    <br />
 </p>
  
<p align="center">  
    <a href="https://twitter.com/swyftpay_io">X (Twitter)</a>
    ·
    <a href="https://www.linkedin.com/company/swervltd">Linkedin</a>
    ·
    <a href="https://docs.swervpay.co/changelog">Changelog</a>
</p>

# Installation

```bash
$ flutter pub add swervpay_dart

# OR

$ dart pub add swervpay_dart
```

# Configuration

Create a new instance of Swervpay with your secret_key and business_id:

```dart
import "package:swervpay_dart/swervpay_dart.dart";

final SwervpayClient swerpvay = SwervpayClient(config: SwervpayClientConfig(businessId: '<BUSINESS_ID>', secretKey: '<SECRET_KEY>'))
```

Replace <SECRET_KEY> and <BUSINESS_ID> with your actual secret key and business ID.

## Documentation

See [docs for Dart here][doc_link]

[pub_badge]: https://img.shields.io/pub/v/swervpay_dart.svg
[pub_badge_link]: https://pub.dartlang.org/packages/swervpay_dart
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_badge_link]: https://opensource.org/licenses/MIT
[doc_link]: https://docs.swervpay.co/sdks/dart
