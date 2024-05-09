import 'dart:io';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'metadata_retriver_method_channel.dart';

abstract class MetadataRetriverPlatform extends PlatformInterface {
  /// Constructs a MetadataRetriverPlatform.
  MetadataRetriverPlatform() : super(token: _token);

  static final Object _token = Object();

  static MetadataRetriverPlatform _instance = MethodChannelMetadataRetriver();

  /// The default instance of [MetadataRetriverPlatform] to use.
  ///
  /// Defaults to [MethodChannelMetadataRetriver].
  static MetadataRetriverPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MetadataRetriverPlatform] when
  /// they register themselves.
  static set instance(MetadataRetriverPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
    Future<Map?> getDetails( File file)async{
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
