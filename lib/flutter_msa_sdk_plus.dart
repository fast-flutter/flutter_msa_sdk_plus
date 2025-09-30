import 'flutter_msa_sdk_plus_platform_interface.dart';

class FlutterMsaSdkPlus {
  /// Determines whether the device supports getting OAID
  Future<bool> isSupport() {
    return FlutterMsaSdkPlusPlatform.instance.isSupport();
  }

  /// Get OAID from device
  Future<String> getOAID() {
    return FlutterMsaSdkPlusPlatform.instance.getOAID();
  }
}
