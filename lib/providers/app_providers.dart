import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../database/app_database.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

final hiveProvider = FutureProvider<void>((ref) async {
  await Hive.initFlutter();
});

final themeModeProvider = StateProvider<String>((ref) => 'system');
final primaryColorProvider = StateProvider<String>((ref) => '#2196F3');
final currencyProvider = StateProvider<String>((ref) => 'CNY');