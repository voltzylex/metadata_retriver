import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'metadata_retriver_platform_interface.dart';

/// An implementation of [MetadataRetriverPlatform] that uses method channels.
class MethodChannelMetadataRetriver extends MetadataRetriverPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('metadata_retriver');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<Map?> getDetails(File file) async {
  
    final Map? details = await methodChannel
        .invokeMethod<Map>('getDetails', {'videoURL': file.path});
    return details;
  }
}
