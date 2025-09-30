import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_msa_sdk_plus_method_channel.dart';

abstract class FlutterMsaSdkPlusPlatform extends PlatformInterface {
  /// Constructs a FlutterMsaSdkPlusPlatform.
  FlutterMsaSdkPlusPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterMsaSdkPlusPlatform _instance = MethodChannelFlutterMsaSdkPlus();

  /// The default instance of [FlutterMsaSdkPlusPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterMsaSdkPlus].
  static FlutterMsaSdkPlusPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterMsaSdkPlusPlatform] when
  /// they register themselves.
  static set instance(FlutterMsaSdkPlusPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  /// Determines whether the device supports getting OAID
  Future<bool> isSupport() {
    throw UnimplementedError('isSupport() has not been implemented.');
  }

  /// Get OAID from device
  Future<String> getOAID() {
    throw UnimplementedError('getOAID() has not been implemented.');
  }
}
