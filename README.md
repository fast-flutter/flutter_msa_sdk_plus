# flutter_msa_sdk_plus

OAID SDK for Flutter - MSA functionality for Chinese Android devices.

This is an enhanced version of the original flutter_msa_sdk with improved architecture using platform interface.

## Features

- Get OAID (Open Advertising ID) from Chinese Android devices
- Check if device supports OAID functionality
- Cross-platform support (Android only, iOS returns empty values)

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_msa_sdk_plus: ^4.1.0+2
```

## Usage

Import the package in your Dart code:

```dart
import 'package:flutter_msa_sdk_plus/flutter_msa_sdk_plus.dart';
```


```dart
// Determine whether the device supports getting OAID
bool isSupport = await FlutterMsaSdkPlus().isSupport();
// Get OAID from device
String oaid = await FlutterMsaSdkPlus().getOAID();
```

## Platform Support

### Android
- Full OAID functionality with support for major Chinese device manufacturers
- Includes dependencies for: ASUS, BUN, Heytap, Samsung, Huawei, ZUI, and generic implementation

### iOS
- Returns `false` for `isSupport()`
- Returns empty string for `getOAID()`
- iOS devices do not have OAID equivalent

## Dependencies

This plugin uses the following Android dependencies:
- `com.gitee.li_yu_jiang:Android_CN_OAID:4.1.0`

## License

The MIT License.
