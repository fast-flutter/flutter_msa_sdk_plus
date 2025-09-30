import 'package:flutter_msa_sdk_plus/flutter_msa_sdk_plus.dart';
import 'package:flutter_msa_sdk_plus/flutter_msa_sdk_plus_platform_interface.dart';
import 'package:flutter_msa_sdk_plus/flutter_msa_sdk_plus_method_channel.dart';
import 'package:flutter_test/flutter_test.dart';

class MockFlutterMsaSdkPlusPlatform implements FlutterMsaSdkPlusPlatform {
  bool _isSupport = true;
  String _oaid = 'test-oaid';

  @override
  Future<bool> isSupport() async {
    return _isSupport;
  }

  @override
  Future<String> getOAID() async {
    return _oaid;
  }

  @override
  Future<String?> getPlatformVersion() async {
    return 'test-platform';
  }

  void setSupport(bool support) {
    _isSupport = support;
  }

  void setOAID(String oaid) {
    _oaid = oaid;
  }
}

void main() {
  final FlutterMsaSdkPlusPlatform initialPlatform =
      FlutterMsaSdkPlusPlatform.instance;

  group('FlutterMsaSdkPlus', () {
    test('$MethodChannelFlutterMsaSdkPlus is the default instance', () {
      expect(initialPlatform, isInstanceOf<MethodChannelFlutterMsaSdkPlus>());
    });

    test('getOAID test', () async {
      FlutterMsaSdkPlus flutterMsaSdkPlus = FlutterMsaSdkPlus();
      expect(await flutterMsaSdkPlus.getOAID(), '');
    });

    group('isSupport', () {
      test('returns true when platform supports OAID', () async {
        final mockPlatform = MockFlutterMsaSdkPlusPlatform();
        mockPlatform.setSupport(true);
        FlutterMsaSdkPlusPlatform.instance = mockPlatform;
        expect(await FlutterMsaSdkPlus().isSupport(), true);
      });

      test('returns false when platform does not support OAID', () async {
        final mockPlatform = MockFlutterMsaSdkPlusPlatform();
        mockPlatform.setSupport(false);
        FlutterMsaSdkPlusPlatform.instance = mockPlatform;
        expect(await FlutterMsaSdkPlus().isSupport(), false);
      });
    });

    group('getOAID', () {
      test('returns OAID when available', () async {
        final mockPlatform = MockFlutterMsaSdkPlusPlatform();
        mockPlatform.setOAID('test-oaid');
        FlutterMsaSdkPlusPlatform.instance = mockPlatform;
        expect(await FlutterMsaSdkPlus().getOAID(), 'test-oaid');
      });

      test('returns empty string when OAID not available', () async {
        final mockPlatform = MockFlutterMsaSdkPlusPlatform();
        mockPlatform.setOAID('');
        FlutterMsaSdkPlusPlatform.instance = mockPlatform;
        expect(await FlutterMsaSdkPlus().getOAID(), '');
      });
    });
  });
}
