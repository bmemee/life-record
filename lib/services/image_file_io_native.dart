import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

/// Native 平台的图片文件操作
class ImageFileIO {
  /// 保存图片到应用目录，返回保存后的路径
  static Future<String> saveImageToAppDir(String sourcePath) async {
    final appDir = await getApplicationDocumentsDirectory();
    final imagesDir = Directory(p.join(appDir.path, 'images'));

    if (!await imagesDir.exists()) {
      await imagesDir.create(recursive: true);
    }

    final extension = p.extension(sourcePath);
    final fileName = '${DateTime.now().millisecondsSinceEpoch}$extension';
    final targetPath = p.join(imagesDir.path, fileName);

    await File(sourcePath).copy(targetPath);
    return targetPath;
  }

  /// 删除图片文件
  static Future<void> deleteImage(String path) async {
    final file = File(path);
    if (await file.exists()) {
      await file.delete();
    }
  }
}
