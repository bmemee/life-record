/// 图片管理服务
library;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_picker/image_picker.dart';

import 'image_file_io.dart';

class ImageService {
  final ImagePicker _picker = ImagePicker();
  
  /// 从相册选择图片
  Future<String?> pickImageFromGallery() async {
    if (kIsWeb) return null; // Web 端不支持本地文件保存

    try {
      final XFile? file = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      if (file == null) return null;
      return await ImageFileIO.saveImageToAppDir(file.path);
    } catch (e) {
      return null;
    }
  }
  
  /// 拍照
  Future<String?> takePhoto() async {
    if (kIsWeb) return null; // Web 端不支持拍照保存到本地

    try {
      final XFile? file = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      if (file == null) return null;
      return await ImageFileIO.saveImageToAppDir(file.path);
    } catch (e) {
      return null;
    }
  }
  
  /// 删除图片
  Future<void> deleteImage(String path) async {
    if (kIsWeb) return;

    try {
      await ImageFileIO.deleteImage(path);
    } catch (_) {}
  }
}
