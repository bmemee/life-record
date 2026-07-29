import 'package:drift/drift.dart';
import 'package:drift/web.dart';

/// Web 平台的数据库连接（使用 sql.js WASM + IndexedDB 持久化）
QueryExecutor openDatabaseConnection() {
  return WebDatabase.withStorage(
    DriftWebStorage.indexedDb('life_record'),
  );
}
