import 'dart:io';

import 'package:path_provider/path_provider.dart';

/// Native 平台的文件操作工具
class FileIO {
  /// 将 JSON 字符串写入临时文件，返回文件路径
  static Future<String> writeTempJson(String content, String fileName) async {
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/$fileName');
    await file.writeAsString(content);
    return file.path;
  }

  /// 从文件路径读取文本
  static Future<String> readTextFromPath(String path) {
    final file = File(path);
    return file.readAsString();
  }
}
