import 'package:drift/drift.dart';

import 'connection.dart';

part 'app_database.g.dart';

@DataClassName('AssetRow')
class Assets extends Table {
  TextColumn get id => text().withLength(min: 36, max: 36)();
  TextColumn get name => text().withLength(max: 200)();
  TextColumn get type => text().withLength(max: 50)();
  TextColumn get subCategory => text().withLength(max: 100).nullable()();
  TextColumn get icon => text().nullable()();
  TextColumn get images => text().nullable()();
  
  RealColumn get purchasePrice => real()();
  RealColumn get currentValue => real().nullable()();
  TextColumn get currency => text().withLength(max: 10).withDefault(const Constant('CNY'))();
  
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime().nullable()();
  
  TextColumn get billingCycle => text().withLength(max: 20).withDefault(const Constant('oneTime'))();
  RealColumn get billingAmount => real().nullable()();
  DateTimeColumn get nextRenewalDate => dateTime().nullable()();
  BoolColumn get autoRenew => boolean().withDefault(const Constant(false))();
  DateTimeColumn get trialEndDate => dateTime().nullable()();
  
  IntColumn get totalUses => integer().nullable()();
  IntColumn get usedCount => integer().nullable()();
  
  TextColumn get status => text().withLength(max: 20).withDefault(const Constant('active'))();
  
  RealColumn get sellPrice => real().nullable()();
  DateTimeColumn get sellDate => dateTime().nullable()();
  
  TextColumn get customFields => text().nullable()();
  TextColumn get tags => text().nullable()();
  TextColumn get note => text().nullable()();
  IntColumn get reminderDays => integer().withDefault(const Constant(3))();
  
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('MediaItemRow')
class MediaItems extends Table {
  TextColumn get id => text().withLength(min: 36, max: 36)();
  TextColumn get name => text().withLength(max: 200)();
  TextColumn get type => text().withLength(max: 20)();
  TextColumn get status => text().withLength(max: 20).withDefault(const Constant('wantToRead'))();
  
  IntColumn get rating => integer().nullable()();
  
  TextColumn get source => text().withLength(max: 30).withDefault(const Constant('manual'))();
  TextColumn get sourceId => text().nullable()();
  TextColumn get sourceUrl => text().nullable()();
  
  TextColumn get coverUrl => text().nullable()();
  TextColumn get localCoverPath => text().nullable()();
  
  TextColumn get author => text().withLength(max: 200).nullable()();
  TextColumn get publisher => text().withLength(max: 200).nullable()();
  DateTimeColumn get releaseDate => dateTime().nullable()();
  IntColumn get duration => integer().nullable()();
  
  TextColumn get platforms => text().nullable()();
  TextColumn get primaryPlatform => text().nullable()();
  
  IntColumn get season => integer().nullable()();
  IntColumn get episode => integer().nullable()();
  IntColumn get totalEpisodes => integer().nullable()();
  
  TextColumn get customFields => text().nullable()();
  TextColumn get tags => text().nullable()();
  TextColumn get category => text().nullable()();
  TextColumn get note => text().nullable()();
  
  DateTimeColumn get startDate => dateTime().nullable()();
  DateTimeColumn get finishDate => dateTime().nullable()();
  
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('CustomField')
class CustomFields extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get entityType => text().withLength(max: 20)();
  TextColumn get entityId => text().withLength(min: 36, max: 36)();
  TextColumn get fieldKey => text().withLength(max: 100)();
  TextColumn get fieldName => text().withLength(max: 100)();
  TextColumn get fieldType => text().withLength(max: 20)();
  TextColumn get fieldValue => text().nullable()();
  
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('Tag')
class Tags extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: 100)();
  TextColumn get color => text().withLength(max: 20).withDefault(const Constant('#6200EE'))();
  
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('EntityTag')
class EntityTags extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get entityType => text().withLength(max: 20)();
  TextColumn get entityId => text().withLength(min: 36, max: 36)();
  IntColumn get tagId => integer()();
  
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('CustomStatus')
class CustomStatuses extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get entityType => text().withLength(max: 20)();
  TextColumn get statusKey => text().withLength(max: 50)();
  TextColumn get statusLabel => text().withLength(max: 50)();
  TextColumn get color => text().withLength(max: 20).withDefault(const Constant('#6200EE'))();
  
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('CustomCategory')
class CustomCategories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get entityType => text().withLength(max: 20)();
  TextColumn get categoryKey => text().withLength(max: 50)();
  TextColumn get categoryLabel => text().withLength(max: 50)();
  TextColumn get icon => text().nullable()();
  
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('DisplayConfig')
class DisplayConfigs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get entityType => text().withLength(max: 20)();
  TextColumn get viewType => text().withLength(max: 20)();
  TextColumn get fields => text()();
  
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('AppSetting')
class AppSettings extends Table {
  TextColumn get key => text().withLength(max: 100)();
  TextColumn get value => text().nullable()();
  
  @override
  Set<Column> get primaryKey => {key};
}

@DriftDatabase(
  tables: [
    Assets,
    MediaItems,
    CustomFields,
    Tags,
    EntityTags,
    CustomStatuses,
    CustomCategories,
    DisplayConfigs,
    AppSettings,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openDatabaseConnection());
  
  @override
  int get schemaVersion => 1;
  
  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
          await _insertDefaultSettings();
        },
      );
  
  Future<void> _insertDefaultSettings() async {
    await into(appSettings).insert(AppSettingsCompanion(
      key: const Value('themeMode'),
      value: const Value('system'),
    ));
    await into(appSettings).insert(AppSettingsCompanion(
      key: const Value('primaryColor'),
      value: const Value('#2196F3'),
    ));
    await into(appSettings).insert(AppSettingsCompanion(
      key: const Value('currency'),
      value: const Value('CNY'),
    ));
  }
}