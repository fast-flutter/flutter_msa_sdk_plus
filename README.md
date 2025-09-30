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
  flutter_msa_sdk_plus: ^1.0.0
```

## Usage

Import the package in your Dart code:

```dart
import 'package:flutter_msa_sdk_plus/flutter_msa_sdk_plus.dart';
```

### API

```dart
// Determine whether the device supports getting OAID
bool isSupport = await FlutterMsaSdkPlus().isSupport();
// Get OAID from device
String oaid = await FlutterMsaSdkPlus().getOAID();
```

### Complete Example

```dart
import 'package:flutter/material.dart';
import 'package:flutter_msa_sdk_plus/flutter_msa_sdk_plus.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _oaid = '';
  bool _isSupport = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _checkOAIDSupport();
  }

  Future<void> _checkOAIDSupport() async {
    setState(() {
      _isLoading = true;
    });
    
    try {
      final isSupport = await FlutterMsaSdkPlus().isSupport();
      setState(() {
        _isSupport = isSupport;
      });
    } catch (e) {
      print('Error checking OAID support: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _getOAID() async {
    if (!_isSupport) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Device does not support OAID')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final oaid = await FlutterMsaSdkPlus().getOAID();
      setState(() {
        _oaid = oaid;
      });
    } catch (e) {
      print('Error getting OAID: $e');
      setState(() {
        _oaid = 'Error: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('flutter_msa_sdk_plus example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('OAID Support: $_isSupport'),
              SizedBox(height: 20),
              Text('OAID: $_oaid'),
              SizedBox(height: 20),
              _isLoading
                  ? CircularProgressIndicator()
                  : Column(
                      children: [
                        ElevatedButton(
                          onPressed: _checkOAIDSupport,
                          child: Text('Check Support'),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: _getOAID,
                          child: Text('Get OAID'),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
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
