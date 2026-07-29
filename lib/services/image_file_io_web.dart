/// Web 平台的图片文件操作（空实现）
class ImageFileIO {
  /// Web 端不支持本地文件保存
  static Future<String> saveImageToAppDir(String sourcePath) async {
    throw UnsupportedError('Web 平台不支持本地文件保存');
  }

  /// Web 端不支持本地文件删除
  static Future<void> deleteImage(String path) async {
    // no-op
  }
}
