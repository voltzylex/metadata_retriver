import 'dart:convert';
import 'dart:io';

import 'package:metadata_retriver/model/meta_data_model.dart';

import 'metadata_retriver_platform_interface.dart';

class MetadataRetriver {
  Future<String?> getPlatformVersion() {
    return MetadataRetriverPlatform.instance.getPlatformVersion();
  }

  Future<MetaDataModel?> getDetails(File file) async {
    final data =await MetadataRetriverPlatform.instance.getDetails(file);
    return MetaDataModel.fromJson(jsonEncode(data));
  }
}
