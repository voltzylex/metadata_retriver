
import 'dart:io';

import 'metadata_retriver_platform_interface.dart';

class MetadataRetriver {

  Future<String?> getPlatformVersion() {
    return MetadataRetriverPlatform.instance.getPlatformVersion();
  }
  Future<Map?> getDetails( File file)async{
    return MetadataRetriverPlatform.instance.getDetails(file);
  }

}
