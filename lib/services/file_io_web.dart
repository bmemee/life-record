import 'dart:html' as html;

/// Web 平台的文件操作工具（空实现，Web 上不需要文件系统操作）
class FileIO {
  /// Web 端不支持写入临时文件，直接返回空字符串
  static Future<String> writeTempJson(String content, String fileName) async {
    // Web 端不需要写入文件，调用方应通过 kIsWeb 判断后走 Web 逻辑
    return '';
  }

  /// Web 端从 bytes 读取
  static Future<String> readTextFromPath(String path) async {
    // Web 端不应调用此方法
    throw UnsupportedError('Web 平台不支持文件路径读取');
  }
}
