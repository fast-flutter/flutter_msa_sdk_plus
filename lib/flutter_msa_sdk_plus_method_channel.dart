import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_msa_sdk_plus_platform_interface.dart';

/// An implementation of [FlutterMsaSdkPlusPlatform] that uses method channels.
class MethodChannelFlutterMsaSdkPlus extends FlutterMsaSdkPlusPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_msa_sdk_plus');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }

  @override
  Future<bool> isSupport() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      final support = await methodChannel.invokeMethod<bool>('isSupport');
      return support ?? false;
    } else {
      return false;
    }
  }

  @override
  Future<String> getOAID() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      final oaid = await methodChannel.invokeMethod<String>('getOAID');
      return oaid ?? "";
    } else {
      return "";
    }
  }
}
