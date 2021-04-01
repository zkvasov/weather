import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';

class ImageFormatter {
  static Map getMapOfArgs(
    String assetName,
    int height,
    int width,
  ) {
    Map map = Map();
    map['assetName'] = assetName;
    map['height'] = height;
    map['width'] = width;

    return map;
  }

  static Future<ImageProvider> compressAsset(Map map) async {
    String assetName = map['assetName'];
    int height = map['height'];
    int width = map['width'];

    final list = await FlutterImageCompress.compressAssetImage(
      assetName,
      minHeight: height,
      minWidth: width,
    );

    return list == null ? null : MemoryImage(Uint8List.fromList(list));
  }

  Future<ImageProvider> compressImageAsset(
    String assetName,
    ImageProvider provider,
    int height,
    int width,
  ) async {
    return compute(
      compressAsset,
      getMapOfArgs(assetName, height, width),
    );
  }
}
