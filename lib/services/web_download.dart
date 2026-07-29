/// Web 端下载工具
library;

import 'dart:html' as html;
import 'dart:js_util' as js_util;

void downloadTextFile(String content, String fileName) {
  final blob = js_util.callConstructor(
    js_util.getProperty(js_util.globalThis, 'Blob'),
    [[js_util.jsify([content])], js_util.jsify({'type': 'application/json'})],
  );
  final url = js_util.callMethod(
    js_util.getProperty(js_util.globalThis, 'URL'),
    'createObjectURL',
    [blob],
  );
  final anchor = html.AnchorElement(href: url)
    ..setAttribute('download', fileName)
    ..click();
  js_util.callMethod(
    js_util.getProperty(js_util.globalThis, 'URL'),
    'revokeObjectURL',
    [url],
  );
}