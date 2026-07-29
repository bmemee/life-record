/// 图片上传服务
library;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'image_file_io.dart';

class ImageService {
  final ImagePicker _picker = ImagePicker();

  /// 选择并保存图片，返回图片路径
  Future<String?> pickAndSaveImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 800,
      maxHeight: 1200,
      imageQuality: 85,
    );

    if (image == null) return null;

    // Web 平台直接返回路径（实际上是临时路径）
    if (kIsWeb) {
      return image.path;
    }

    // Native 平台保存到应用目录
    try {
      return await ImageFileIO.saveImageToAppDir(image.path);
    } catch (e) {
      return null;
    }
  }

  /// 拍照并保存图片
  Future<String?> takePhotoAndSave() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 800,
      maxHeight: 1200,
      imageQuality: 85,
    );

    if (image == null) return null;

    if (kIsWeb) {
      return image.path;
    }

    try {
      return await ImageFileIO.saveImageToAppDir(image.path);
    } catch (e) {
      return null;
    }
  }

  /// 删除图片
  Future<void> deleteImage(String path) async {
    if (kIsWeb) return;
    await ImageFileIO.deleteImage(path);
  }
}

final imageServiceProvider = Provider<ImageService>((ref) {
  return ImageService();
});