import Flutter
import UIKit

public class MetadataRetriverPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "metadata_retriver", binaryMessenger: registrar.messenger())
    let instance = MetadataRetriverPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "getDetails":
        if let args = call.arguments as? [String: Any],
                        let videoURL = args["videoURL"] as? String {
                       let videoMetadata = VideoMetadata()
                         if let metadata = videoMetadata.getMetadata(videoURL: URL(fileURLWithPath: videoURL)) {
                         result(metadata)
                       } else {
                         result(nil)
                       }
                     }
        
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
