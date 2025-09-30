import Flutter
import UIKit

public class FlutterMsaSdkPlusPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_msa_sdk_plus", binaryMessenger: registrar.messenger())
    let instance = FlutterMsaSdkPlusPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "isSupport":
      // iOS doesn't support OAID, always return false
      result(false)
    case "getOAID":
      // iOS doesn't support OAID, return empty string
      result("")
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
