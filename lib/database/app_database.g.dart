// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $AssetsTable extends Assets with TableInfo<$AssetsTable, AssetRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AssetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _subCategoryMeta =
      const VerificationMeta('subCategory');
  @override
  late final GeneratedColumn<String> subCategory = GeneratedColumn<String>(
      'sub_category', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
      'icon', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imagesMeta = const VerificationMeta('images');
  @override
  late final GeneratedColumn<String> images = GeneratedColumn<String>(
      'images', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _purchasePriceMeta =
      const VerificationMeta('purchasePrice');
  @override
  late final GeneratedColumn<double> purchasePrice = GeneratedColumn<double>(
      'purchase_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _currentValueMeta =
      const VerificationMeta('currentValue');
  @override
  late final GeneratedColumn<double> currentValue = GeneratedColumn<double>(
      'current_value', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _currencyMeta =
      const VerificationMeta('currency');
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
      'currency', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('CNY'));
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _billingCycleMeta =
      const VerificationMeta('billingCycle');
  @override
  late final GeneratedColumn<String> billingCycle = GeneratedColumn<String>(
      'billing_cycle', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('oneTime'));
  static const VerificationMeta _billingAmountMeta =
      const VerificationMeta('billingAmount');
  @override
  late final GeneratedColumn<double> billingAmount = GeneratedColumn<double>(
      'billing_amount', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _nextRenewalDateMeta =
      const VerificationMeta('nextRenewalDate');
  @override
  late final GeneratedColumn<DateTime> nextRenewalDate =
      GeneratedColumn<DateTime>('next_renewal_date', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _autoRenewMeta =
      const VerificationMeta('autoRenew');
  @override
  late final GeneratedColumn<bool> autoRenew = GeneratedColumn<bool>(
      'auto_renew', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("auto_renew" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _trialEndDateMeta =
      const VerificationMeta('trialEndDate');
  @override
  late final GeneratedColumn<DateTime> trialEndDate = GeneratedColumn<DateTime>(
      'trial_end_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _totalUsesMeta =
      const VerificationMeta('totalUses');
  @override
  late final GeneratedColumn<int> totalUses = GeneratedColumn<int>(
      'total_uses', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _usedCountMeta =
      const VerificationMeta('usedCount');
  @override
  late final GeneratedColumn<int> usedCount = GeneratedColumn<int>(
      'used_count', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('active'));
  static const VerificationMeta _sellPriceMeta =
      const VerificationMeta('sellPrice');
  @override
  late final GeneratedColumn<double> sellPrice = GeneratedColumn<double>(
      'sell_price', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _sellDateMeta =
      const VerificationMeta('sellDate');
  @override
  late final GeneratedColumn<DateTime> sellDate = GeneratedColumn<DateTime>(
      'sell_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _customFieldsMeta =
      const VerificationMeta('customFields');
  @override
  late final GeneratedColumn<String> customFields = GeneratedColumn<String>(
      'custom_fields', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
      'tags', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _reminderDaysMeta =
      const VerificationMeta('reminderDays');
  @override
  late final GeneratedColumn<int> reminderDays = GeneratedColumn<int>(
      'reminder_days', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(3));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        type,
        subCategory,
        icon,
        images,
        purchasePrice,
        currentValue,
        currency,
        startDate,
        endDate,
        billingCycle,
        billingAmount,
        nextRenewalDate,
        autoRenew,
        trialEndDate,
        totalUses,
        usedCount,
        status,
        sellPrice,
        sellDate,
        customFields,
        tags,
        note,
        reminderDays,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'assets';
  @override
  VerificationContext validateIntegrity(Insertable<AssetRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('sub_category')) {
      context.handle(
          _subCategoryMeta,
          subCategory.isAcceptableOrUnknown(
              data['sub_category']!, _subCategoryMeta));
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon']!, _iconMeta));
    }
    if (data.containsKey('images')) {
      context.handle(_imagesMeta,
          images.isAcceptableOrUnknown(data['images']!, _imagesMeta));
    }
    if (data.containsKey('purchase_price')) {
      context.handle(
          _purchasePriceMeta,
          purchasePrice.isAcceptableOrUnknown(
              data['purchase_price']!, _purchasePriceMeta));
    } else if (isInserting) {
      context.missing(_purchasePriceMeta);
    }
    if (data.containsKey('current_value')) {
      context.handle(
          _currentValueMeta,
          currentValue.isAcceptableOrUnknown(
              data['current_value']!, _currentValueMeta));
    }
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta));
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    }
    if (data.containsKey('billing_cycle')) {
      context.handle(
          _billingCycleMeta,
          billingCycle.isAcceptableOrUnknown(
              data['billing_cycle']!, _billingCycleMeta));
    }
    if (data.containsKey('billing_amount')) {
      context.handle(
          _billingAmountMeta,
          billingAmount.isAcceptableOrUnknown(
              data['billing_amount']!, _billingAmountMeta));
    }
    if (data.containsKey('next_renewal_date')) {
      context.handle(
          _nextRenewalDateMeta,
          nextRenewalDate.isAcceptableOrUnknown(
              data['next_renewal_date']!, _nextRenewalDateMeta));
    }
    if (data.containsKey('auto_renew')) {
      context.handle(_autoRenewMeta,
          autoRenew.isAcceptableOrUnknown(data['auto_renew']!, _autoRenewMeta));
    }
    if (data.containsKey('trial_end_date')) {
      context.handle(
          _trialEndDateMeta,
          trialEndDate.isAcceptableOrUnknown(
              data['trial_end_date']!, _trialEndDateMeta));
    }
    if (data.containsKey('total_uses')) {
      context.handle(_totalUsesMeta,
          totalUses.isAcceptableOrUnknown(data['total_uses']!, _totalUsesMeta));
    }
    if (data.containsKey('used_count')) {
      context.handle(_usedCountMeta,
          usedCount.isAcceptableOrUnknown(data['used_count']!, _usedCountMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('sell_price')) {
      context.handle(_sellPriceMeta,
          sellPrice.isAcceptableOrUnknown(data['sell_price']!, _sellPriceMeta));
    }
    if (data.containsKey('sell_date')) {
      context.handle(_sellDateMeta,
          sellDate.isAcceptableOrUnknown(data['sell_date']!, _sellDateMeta));
    }
    if (data.containsKey('custom_fields')) {
      context.handle(
          _customFieldsMeta,
          customFields.isAcceptableOrUnknown(
              data['custom_fields']!, _customFieldsMeta));
    }
    if (data.containsKey('tags')) {
      context.handle(
          _tagsMeta, tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta));
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('reminder_days')) {
      context.handle(
          _reminderDaysMeta,
          reminderDays.isAcceptableOrUnknown(
              data['reminder_days']!, _reminderDaysMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AssetRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AssetRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      subCategory: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sub_category']),
      icon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon']),
      images: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}images']),
      purchasePrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}purchase_price'])!,
      currentValue: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}current_value']),
      currency: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency'])!,
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date'])!,
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date']),
      billingCycle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}billing_cycle'])!,
      billingAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}billing_amount']),
      nextRenewalDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}next_renewal_date']),
      autoRenew: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}auto_renew'])!,
      trialEndDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}trial_end_date']),
      totalUses: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_uses']),
      usedCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}used_count']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      sellPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}sell_price']),
      sellDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}sell_date']),
      customFields: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}custom_fields']),
      tags: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags']),
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      reminderDays: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}reminder_days'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $AssetsTable createAlias(String alias) {
    return $AssetsTable(attachedDatabase, alias);
  }
}

class AssetRow extends DataClass implements Insertable<AssetRow> {
  final String id;
  final String name;
  final String type;
  final String? subCategory;
  final String? icon;
  final String? images;
  final double purchasePrice;
  final double? currentValue;
  final String currency;
  final DateTime startDate;
  final DateTime? endDate;
  final String billingCycle;
  final double? billingAmount;
  final DateTime? nextRenewalDate;
  final bool autoRenew;
  final DateTime? trialEndDate;
  final int? totalUses;
  final int? usedCount;
  final String status;
  final double? sellPrice;
  final DateTime? sellDate;
  final String? customFields;
  final String? tags;
  final String? note;
  final int reminderDays;
  final DateTime createdAt;
  final DateTime updatedAt;
  const AssetRow(
      {required this.id,
      required this.name,
      required this.type,
      this.subCategory,
      this.icon,
      this.images,
      required this.purchasePrice,
      this.currentValue,
      required this.currency,
      required this.startDate,
      this.endDate,
      required this.billingCycle,
      this.billingAmount,
      this.nextRenewalDate,
      required this.autoRenew,
      this.trialEndDate,
      this.totalUses,
      this.usedCount,
      required this.status,
      this.sellPrice,
      this.sellDate,
      this.customFields,
      this.tags,
      this.note,
      required this.reminderDays,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || subCategory != null) {
      map['sub_category'] = Variable<String>(subCategory);
    }
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<String>(icon);
    }
    if (!nullToAbsent || images != null) {
      map['images'] = Variable<String>(images);
    }
    map['purchase_price'] = Variable<double>(purchasePrice);
    if (!nullToAbsent || currentValue != null) {
      map['current_value'] = Variable<double>(currentValue);
    }
    map['currency'] = Variable<String>(currency);
    map['start_date'] = Variable<DateTime>(startDate);
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    map['billing_cycle'] = Variable<String>(billingCycle);
    if (!nullToAbsent || billingAmount != null) {
      map['billing_amount'] = Variable<double>(billingAmount);
    }
    if (!nullToAbsent || nextRenewalDate != null) {
      map['next_renewal_date'] = Variable<DateTime>(nextRenewalDate);
    }
    map['auto_renew'] = Variable<bool>(autoRenew);
    if (!nullToAbsent || trialEndDate != null) {
      map['trial_end_date'] = Variable<DateTime>(trialEndDate);
    }
    if (!nullToAbsent || totalUses != null) {
      map['total_uses'] = Variable<int>(totalUses);
    }
    if (!nullToAbsent || usedCount != null) {
      map['used_count'] = Variable<int>(usedCount);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || sellPrice != null) {
      map['sell_price'] = Variable<double>(sellPrice);
    }
    if (!nullToAbsent || sellDate != null) {
      map['sell_date'] = Variable<DateTime>(sellDate);
    }
    if (!nullToAbsent || customFields != null) {
      map['custom_fields'] = Variable<String>(customFields);
    }
    if (!nullToAbsent || tags != null) {
      map['tags'] = Variable<String>(tags);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['reminder_days'] = Variable<int>(reminderDays);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AssetsCompanion toCompanion(bool nullToAbsent) {
    return AssetsCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      subCategory: subCategory == null && nullToAbsent
          ? const Value.absent()
          : Value(subCategory),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
      images:
          images == null && nullToAbsent ? const Value.absent() : Value(images),
      purchasePrice: Value(purchasePrice),
      currentValue: currentValue == null && nullToAbsent
          ? const Value.absent()
          : Value(currentValue),
      currency: Value(currency),
      startDate: Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      billingCycle: Value(billingCycle),
      billingAmount: billingAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(billingAmount),
      nextRenewalDate: nextRenewalDate == null && nullToAbsent
          ? const Value.absent()
          : Value(nextRenewalDate),
      autoRenew: Value(autoRenew),
      trialEndDate: trialEndDate == null && nullToAbsent
          ? const Value.absent()
          : Value(trialEndDate),
      totalUses: totalUses == null && nullToAbsent
          ? const Value.absent()
          : Value(totalUses),
      usedCount: usedCount == null && nullToAbsent
          ? const Value.absent()
          : Value(usedCount),
      status: Value(status),
      sellPrice: sellPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(sellPrice),
      sellDate: sellDate == null && nullToAbsent
          ? const Value.absent()
          : Value(sellDate),
      customFields: customFields == null && nullToAbsent
          ? const Value.absent()
          : Value(customFields),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      reminderDays: Value(reminderDays),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory AssetRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AssetRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      subCategory: serializer.fromJson<String?>(json['subCategory']),
      icon: serializer.fromJson<String?>(json['icon']),
      images: serializer.fromJson<String?>(json['images']),
      purchasePrice: serializer.fromJson<double>(json['purchasePrice']),
      currentValue: serializer.fromJson<double?>(json['currentValue']),
      currency: serializer.fromJson<String>(json['currency']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      billingCycle: serializer.fromJson<String>(json['billingCycle']),
      billingAmount: serializer.fromJson<double?>(json['billingAmount']),
      nextRenewalDate: serializer.fromJson<DateTime?>(json['nextRenewalDate']),
      autoRenew: serializer.fromJson<bool>(json['autoRenew']),
      trialEndDate: serializer.fromJson<DateTime?>(json['trialEndDate']),
      totalUses: serializer.fromJson<int?>(json['totalUses']),
      usedCount: serializer.fromJson<int?>(json['usedCount']),
      status: serializer.fromJson<String>(json['status']),
      sellPrice: serializer.fromJson<double?>(json['sellPrice']),
      sellDate: serializer.fromJson<DateTime?>(json['sellDate']),
      customFields: serializer.fromJson<String?>(json['customFields']),
      tags: serializer.fromJson<String?>(json['tags']),
      note: serializer.fromJson<String?>(json['note']),
      reminderDays: serializer.fromJson<int>(json['reminderDays']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'subCategory': serializer.toJson<String?>(subCategory),
      'icon': serializer.toJson<String?>(icon),
      'images': serializer.toJson<String?>(images),
      'purchasePrice': serializer.toJson<double>(purchasePrice),
      'currentValue': serializer.toJson<double?>(currentValue),
      'currency': serializer.toJson<String>(currency),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'billingCycle': serializer.toJson<String>(billingCycle),
      'billingAmount': serializer.toJson<double?>(billingAmount),
      'nextRenewalDate': serializer.toJson<DateTime?>(nextRenewalDate),
      'autoRenew': serializer.toJson<bool>(autoRenew),
      'trialEndDate': serializer.toJson<DateTime?>(trialEndDate),
      'totalUses': serializer.toJson<int?>(totalUses),
      'usedCount': serializer.toJson<int?>(usedCount),
      'status': serializer.toJson<String>(status),
      'sellPrice': serializer.toJson<double?>(sellPrice),
      'sellDate': serializer.toJson<DateTime?>(sellDate),
      'customFields': serializer.toJson<String?>(customFields),
      'tags': serializer.toJson<String?>(tags),
      'note': serializer.toJson<String?>(note),
      'reminderDays': serializer.toJson<int>(reminderDays),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  AssetRow copyWith(
          {String? id,
          String? name,
          String? type,
          Value<String?> subCategory = const Value.absent(),
          Value<String?> icon = const Value.absent(),
          Value<String?> images = const Value.absent(),
          double? purchasePrice,
          Value<double?> currentValue = const Value.absent(),
          String? currency,
          DateTime? startDate,
          Value<DateTime?> endDate = const Value.absent(),
          String? billingCycle,
          Value<double?> billingAmount = const Value.absent(),
          Value<DateTime?> nextRenewalDate = const Value.absent(),
          bool? autoRenew,
          Value<DateTime?> trialEndDate = const Value.absent(),
          Value<int?> totalUses = const Value.absent(),
          Value<int?> usedCount = const Value.absent(),
          String? status,
          Value<double?> sellPrice = const Value.absent(),
          Value<DateTime?> sellDate = const Value.absent(),
          Value<String?> customFields = const Value.absent(),
          Value<String?> tags = const Value.absent(),
          Value<String?> note = const Value.absent(),
          int? reminderDays,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      AssetRow(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        subCategory: subCategory.present ? subCategory.value : this.subCategory,
        icon: icon.present ? icon.value : this.icon,
        images: images.present ? images.value : this.images,
        purchasePrice: purchasePrice ?? this.purchasePrice,
        currentValue:
            currentValue.present ? currentValue.value : this.currentValue,
        currency: currency ?? this.currency,
        startDate: startDate ?? this.startDate,
        endDate: endDate.present ? endDate.value : this.endDate,
        billingCycle: billingCycle ?? this.billingCycle,
        billingAmount:
            billingAmount.present ? billingAmount.value : this.billingAmount,
        nextRenewalDate: nextRenewalDate.present
            ? nextRenewalDate.value
            : this.nextRenewalDate,
        autoRenew: autoRenew ?? this.autoRenew,
        trialEndDate:
            trialEndDate.present ? trialEndDate.value : this.trialEndDate,
        totalUses: totalUses.present ? totalUses.value : this.totalUses,
        usedCount: usedCount.present ? usedCount.value : this.usedCount,
        status: status ?? this.status,
        sellPrice: sellPrice.present ? sellPrice.value : this.sellPrice,
        sellDate: sellDate.present ? sellDate.value : this.sellDate,
        customFields:
            customFields.present ? customFields.value : this.customFields,
        tags: tags.present ? tags.value : this.tags,
        note: note.present ? note.value : this.note,
        reminderDays: reminderDays ?? this.reminderDays,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  AssetRow copyWithCompanion(AssetsCompanion data) {
    return AssetRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      subCategory:
          data.subCategory.present ? data.subCategory.value : this.subCategory,
      icon: data.icon.present ? data.icon.value : this.icon,
      images: data.images.present ? data.images.value : this.images,
      purchasePrice: data.purchasePrice.present
          ? data.purchasePrice.value
          : this.purchasePrice,
      currentValue: data.currentValue.present
          ? data.currentValue.value
          : this.currentValue,
      currency: data.currency.present ? data.currency.value : this.currency,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      billingCycle: data.billingCycle.present
          ? data.billingCycle.value
          : this.billingCycle,
      billingAmount: data.billingAmount.present
          ? data.billingAmount.value
          : this.billingAmount,
      nextRenewalDate: data.nextRenewalDate.present
          ? data.nextRenewalDate.value
          : this.nextRenewalDate,
      autoRenew: data.autoRenew.present ? data.autoRenew.value : this.autoRenew,
      trialEndDate: data.trialEndDate.present
          ? data.trialEndDate.value
          : this.trialEndDate,
      totalUses: data.totalUses.present ? data.totalUses.value : this.totalUses,
      usedCount: data.usedCount.present ? data.usedCount.value : this.usedCount,
      status: data.status.present ? data.status.value : this.status,
      sellPrice: data.sellPrice.present ? data.sellPrice.value : this.sellPrice,
      sellDate: data.sellDate.present ? data.sellDate.value : this.sellDate,
      customFields: data.customFields.present
          ? data.customFields.value
          : this.customFields,
      tags: data.tags.present ? data.tags.value : this.tags,
      note: data.note.present ? data.note.value : this.note,
      reminderDays: data.reminderDays.present
          ? data.reminderDays.value
          : this.reminderDays,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AssetRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('subCategory: $subCategory, ')
          ..write('icon: $icon, ')
          ..write('images: $images, ')
          ..write('purchasePrice: $purchasePrice, ')
          ..write('currentValue: $currentValue, ')
          ..write('currency: $currency, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('billingCycle: $billingCycle, ')
          ..write('billingAmount: $billingAmount, ')
          ..write('nextRenewalDate: $nextRenewalDate, ')
          ..write('autoRenew: $autoRenew, ')
          ..write('trialEndDate: $trialEndDate, ')
          ..write('totalUses: $totalUses, ')
          ..write('usedCount: $usedCount, ')
          ..write('status: $status, ')
          ..write('sellPrice: $sellPrice, ')
          ..write('sellDate: $sellDate, ')
          ..write('customFields: $customFields, ')
          ..write('tags: $tags, ')
          ..write('note: $note, ')
          ..write('reminderDays: $reminderDays, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        name,
        type,
        subCategory,
        icon,
        images,
        purchasePrice,
        currentValue,
        currency,
        startDate,
        endDate,
        billingCycle,
        billingAmount,
        nextRenewalDate,
        autoRenew,
        trialEndDate,
        totalUses,
        usedCount,
        status,
        sellPrice,
        sellDate,
        customFields,
        tags,
        note,
        reminderDays,
        createdAt,
        updatedAt
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AssetRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.subCategory == this.subCategory &&
          other.icon == this.icon &&
          other.images == this.images &&
          other.purchasePrice == this.purchasePrice &&
          other.currentValue == this.currentValue &&
          other.currency == this.currency &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.billingCycle == this.billingCycle &&
          other.billingAmount == this.billingAmount &&
          other.nextRenewalDate == this.nextRenewalDate &&
          other.autoRenew == this.autoRenew &&
          other.trialEndDate == this.trialEndDate &&
          other.totalUses == this.totalUses &&
          other.usedCount == this.usedCount &&
          other.status == this.status &&
          other.sellPrice == this.sellPrice &&
          other.sellDate == this.sellDate &&
          other.customFields == this.customFields &&
          other.tags == this.tags &&
          other.note == this.note &&
          other.reminderDays == this.reminderDays &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class AssetsCompanion extends UpdateCompanion<AssetRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> type;
  final Value<String?> subCategory;
  final Value<String?> icon;
  final Value<String?> images;
  final Value<double> purchasePrice;
  final Value<double?> currentValue;
  final Value<String> currency;
  final Value<DateTime> startDate;
  final Value<DateTime?> endDate;
  final Value<String> billingCycle;
  final Value<double?> billingAmount;
  final Value<DateTime?> nextRenewalDate;
  final Value<bool> autoRenew;
  final Value<DateTime?> trialEndDate;
  final Value<int?> totalUses;
  final Value<int?> usedCount;
  final Value<String> status;
  final Value<double?> sellPrice;
  final Value<DateTime?> sellDate;
  final Value<String?> customFields;
  final Value<String?> tags;
  final Value<String?> note;
  final Value<int> reminderDays;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const AssetsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.subCategory = const Value.absent(),
    this.icon = const Value.absent(),
    this.images = const Value.absent(),
    this.purchasePrice = const Value.absent(),
    this.currentValue = const Value.absent(),
    this.currency = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.billingCycle = const Value.absent(),
    this.billingAmount = const Value.absent(),
    this.nextRenewalDate = const Value.absent(),
    this.autoRenew = const Value.absent(),
    this.trialEndDate = const Value.absent(),
    this.totalUses = const Value.absent(),
    this.usedCount = const Value.absent(),
    this.status = const Value.absent(),
    this.sellPrice = const Value.absent(),
    this.sellDate = const Value.absent(),
    this.customFields = const Value.absent(),
    this.tags = const Value.absent(),
    this.note = const Value.absent(),
    this.reminderDays = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AssetsCompanion.insert({
    required String id,
    required String name,
    required String type,
    this.subCategory = const Value.absent(),
    this.icon = const Value.absent(),
    this.images = const Value.absent(),
    required double purchasePrice,
    this.currentValue = const Value.absent(),
    this.currency = const Value.absent(),
    required DateTime startDate,
    this.endDate = const Value.absent(),
    this.billingCycle = const Value.absent(),
    this.billingAmount = const Value.absent(),
    this.nextRenewalDate = const Value.absent(),
    this.autoRenew = const Value.absent(),
    this.trialEndDate = const Value.absent(),
    this.totalUses = const Value.absent(),
    this.usedCount = const Value.absent(),
    this.status = const Value.absent(),
    this.sellPrice = const Value.absent(),
    this.sellDate = const Value.absent(),
    this.customFields = const Value.absent(),
    this.tags = const Value.absent(),
    this.note = const Value.absent(),
    this.reminderDays = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        type = Value(type),
        purchasePrice = Value(purchasePrice),
        startDate = Value(startDate);
  static Insertable<AssetRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<String>? subCategory,
    Expression<String>? icon,
    Expression<String>? images,
    Expression<double>? purchasePrice,
    Expression<double>? currentValue,
    Expression<String>? currency,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<String>? billingCycle,
    Expression<double>? billingAmount,
    Expression<DateTime>? nextRenewalDate,
    Expression<bool>? autoRenew,
    Expression<DateTime>? trialEndDate,
    Expression<int>? totalUses,
    Expression<int>? usedCount,
    Expression<String>? status,
    Expression<double>? sellPrice,
    Expression<DateTime>? sellDate,
    Expression<String>? customFields,
    Expression<String>? tags,
    Expression<String>? note,
    Expression<int>? reminderDays,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (subCategory != null) 'sub_category': subCategory,
      if (icon != null) 'icon': icon,
      if (images != null) 'images': images,
      if (purchasePrice != null) 'purchase_price': purchasePrice,
      if (currentValue != null) 'current_value': currentValue,
      if (currency != null) 'currency': currency,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (billingCycle != null) 'billing_cycle': billingCycle,
      if (billingAmount != null) 'billing_amount': billingAmount,
      if (nextRenewalDate != null) 'next_renewal_date': nextRenewalDate,
      if (autoRenew != null) 'auto_renew': autoRenew,
      if (trialEndDate != null) 'trial_end_date': trialEndDate,
      if (totalUses != null) 'total_uses': totalUses,
      if (usedCount != null) 'used_count': usedCount,
      if (status != null) 'status': status,
      if (sellPrice != null) 'sell_price': sellPrice,
      if (sellDate != null) 'sell_date': sellDate,
      if (customFields != null) 'custom_fields': customFields,
      if (tags != null) 'tags': tags,
      if (note != null) 'note': note,
      if (reminderDays != null) 'reminder_days': reminderDays,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AssetsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? type,
      Value<String?>? subCategory,
      Value<String?>? icon,
      Value<String?>? images,
      Value<double>? purchasePrice,
      Value<double?>? currentValue,
      Value<String>? currency,
      Value<DateTime>? startDate,
      Value<DateTime?>? endDate,
      Value<String>? billingCycle,
      Value<double?>? billingAmount,
      Value<DateTime?>? nextRenewalDate,
      Value<bool>? autoRenew,
      Value<DateTime?>? trialEndDate,
      Value<int?>? totalUses,
      Value<int?>? usedCount,
      Value<String>? status,
      Value<double?>? sellPrice,
      Value<DateTime?>? sellDate,
      Value<String?>? customFields,
      Value<String?>? tags,
      Value<String?>? note,
      Value<int>? reminderDays,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return AssetsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      subCategory: subCategory ?? this.subCategory,
      icon: icon ?? this.icon,
      images: images ?? this.images,
      purchasePrice: purchasePrice ?? this.purchasePrice,
      currentValue: currentValue ?? this.currentValue,
      currency: currency ?? this.currency,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      billingCycle: billingCycle ?? this.billingCycle,
      billingAmount: billingAmount ?? this.billingAmount,
      nextRenewalDate: nextRenewalDate ?? this.nextRenewalDate,
      autoRenew: autoRenew ?? this.autoRenew,
      trialEndDate: trialEndDate ?? this.trialEndDate,
      totalUses: totalUses ?? this.totalUses,
      usedCount: usedCount ?? this.usedCount,
      status: status ?? this.status,
      sellPrice: sellPrice ?? this.sellPrice,
      sellDate: sellDate ?? this.sellDate,
      customFields: customFields ?? this.customFields,
      tags: tags ?? this.tags,
      note: note ?? this.note,
      reminderDays: reminderDays ?? this.reminderDays,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (subCategory.present) {
      map['sub_category'] = Variable<String>(subCategory.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (images.present) {
      map['images'] = Variable<String>(images.value);
    }
    if (purchasePrice.present) {
      map['purchase_price'] = Variable<double>(purchasePrice.value);
    }
    if (currentValue.present) {
      map['current_value'] = Variable<double>(currentValue.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (billingCycle.present) {
      map['billing_cycle'] = Variable<String>(billingCycle.value);
    }
    if (billingAmount.present) {
      map['billing_amount'] = Variable<double>(billingAmount.value);
    }
    if (nextRenewalDate.present) {
      map['next_renewal_date'] = Variable<DateTime>(nextRenewalDate.value);
    }
    if (autoRenew.present) {
      map['auto_renew'] = Variable<bool>(autoRenew.value);
    }
    if (trialEndDate.present) {
      map['trial_end_date'] = Variable<DateTime>(trialEndDate.value);
    }
    if (totalUses.present) {
      map['total_uses'] = Variable<int>(totalUses.value);
    }
    if (usedCount.present) {
      map['used_count'] = Variable<int>(usedCount.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (sellPrice.present) {
      map['sell_price'] = Variable<double>(sellPrice.value);
    }
    if (sellDate.present) {
      map['sell_date'] = Variable<DateTime>(sellDate.value);
    }
    if (customFields.present) {
      map['custom_fields'] = Variable<String>(customFields.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (reminderDays.present) {
      map['reminder_days'] = Variable<int>(reminderDays.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AssetsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('subCategory: $subCategory, ')
          ..write('icon: $icon, ')
          ..write('images: $images, ')
          ..write('purchasePrice: $purchasePrice, ')
          ..write('currentValue: $currentValue, ')
          ..write('currency: $currency, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('billingCycle: $billingCycle, ')
          ..write('billingAmount: $billingAmount, ')
          ..write('nextRenewalDate: $nextRenewalDate, ')
          ..write('autoRenew: $autoRenew, ')
          ..write('trialEndDate: $trialEndDate, ')
          ..write('totalUses: $totalUses, ')
          ..write('usedCount: $usedCount, ')
          ..write('status: $status, ')
          ..write('sellPrice: $sellPrice, ')
          ..write('sellDate: $sellDate, ')
          ..write('customFields: $customFields, ')
          ..write('tags: $tags, ')
          ..write('note: $note, ')
          ..write('reminderDays: $reminderDays, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MediaItemsTable extends MediaItems
    with TableInfo<$MediaItemsTable, MediaItemRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MediaItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('wantToRead'));
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<int> rating = GeneratedColumn<int>(
      'rating', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
      'source', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 30),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('manual'));
  static const VerificationMeta _sourceIdMeta =
      const VerificationMeta('sourceId');
  @override
  late final GeneratedColumn<String> sourceId = GeneratedColumn<String>(
      'source_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sourceUrlMeta =
      const VerificationMeta('sourceUrl');
  @override
  late final GeneratedColumn<String> sourceUrl = GeneratedColumn<String>(
      'source_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _coverUrlMeta =
      const VerificationMeta('coverUrl');
  @override
  late final GeneratedColumn<String> coverUrl = GeneratedColumn<String>(
      'cover_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _localCoverPathMeta =
      const VerificationMeta('localCoverPath');
  @override
  late final GeneratedColumn<String> localCoverPath = GeneratedColumn<String>(
      'local_cover_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
      'author', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _publisherMeta =
      const VerificationMeta('publisher');
  @override
  late final GeneratedColumn<String> publisher = GeneratedColumn<String>(
      'publisher', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  @override
  late final GeneratedColumn<DateTime> releaseDate = GeneratedColumn<DateTime>(
      'release_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _durationMeta =
      const VerificationMeta('duration');
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
      'duration', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _platformsMeta =
      const VerificationMeta('platforms');
  @override
  late final GeneratedColumn<String> platforms = GeneratedColumn<String>(
      'platforms', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _primaryPlatformMeta =
      const VerificationMeta('primaryPlatform');
  @override
  late final GeneratedColumn<String> primaryPlatform = GeneratedColumn<String>(
      'primary_platform', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _seasonMeta = const VerificationMeta('season');
  @override
  late final GeneratedColumn<int> season = GeneratedColumn<int>(
      'season', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _episodeMeta =
      const VerificationMeta('episode');
  @override
  late final GeneratedColumn<int> episode = GeneratedColumn<int>(
      'episode', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _totalEpisodesMeta =
      const VerificationMeta('totalEpisodes');
  @override
  late final GeneratedColumn<int> totalEpisodes = GeneratedColumn<int>(
      'total_episodes', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _customFieldsMeta =
      const VerificationMeta('customFields');
  @override
  late final GeneratedColumn<String> customFields = GeneratedColumn<String>(
      'custom_fields', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
      'tags', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _finishDateMeta =
      const VerificationMeta('finishDate');
  @override
  late final GeneratedColumn<DateTime> finishDate = GeneratedColumn<DateTime>(
      'finish_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        type,
        status,
        rating,
        source,
        sourceId,
        sourceUrl,
        coverUrl,
        localCoverPath,
        author,
        publisher,
        releaseDate,
        duration,
        platforms,
        primaryPlatform,
        season,
        episode,
        totalEpisodes,
        customFields,
        tags,
        category,
        note,
        startDate,
        finishDate,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'media_items';
  @override
  VerificationContext validateIntegrity(Insertable<MediaItemRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    }
    if (data.containsKey('source')) {
      context.handle(_sourceMeta,
          source.isAcceptableOrUnknown(data['source']!, _sourceMeta));
    }
    if (data.containsKey('source_id')) {
      context.handle(_sourceIdMeta,
          sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta));
    }
    if (data.containsKey('source_url')) {
      context.handle(_sourceUrlMeta,
          sourceUrl.isAcceptableOrUnknown(data['source_url']!, _sourceUrlMeta));
    }
    if (data.containsKey('cover_url')) {
      context.handle(_coverUrlMeta,
          coverUrl.isAcceptableOrUnknown(data['cover_url']!, _coverUrlMeta));
    }
    if (data.containsKey('local_cover_path')) {
      context.handle(
          _localCoverPathMeta,
          localCoverPath.isAcceptableOrUnknown(
              data['local_cover_path']!, _localCoverPathMeta));
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    }
    if (data.containsKey('publisher')) {
      context.handle(_publisherMeta,
          publisher.isAcceptableOrUnknown(data['publisher']!, _publisherMeta));
    }
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date']!, _releaseDateMeta));
    }
    if (data.containsKey('duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['duration']!, _durationMeta));
    }
    if (data.containsKey('platforms')) {
      context.handle(_platformsMeta,
          platforms.isAcceptableOrUnknown(data['platforms']!, _platformsMeta));
    }
    if (data.containsKey('primary_platform')) {
      context.handle(
          _primaryPlatformMeta,
          primaryPlatform.isAcceptableOrUnknown(
              data['primary_platform']!, _primaryPlatformMeta));
    }
    if (data.containsKey('season')) {
      context.handle(_seasonMeta,
          season.isAcceptableOrUnknown(data['season']!, _seasonMeta));
    }
    if (data.containsKey('episode')) {
      context.handle(_episodeMeta,
          episode.isAcceptableOrUnknown(data['episode']!, _episodeMeta));
    }
    if (data.containsKey('total_episodes')) {
      context.handle(
          _totalEpisodesMeta,
          totalEpisodes.isAcceptableOrUnknown(
              data['total_episodes']!, _totalEpisodesMeta));
    }
    if (data.containsKey('custom_fields')) {
      context.handle(
          _customFieldsMeta,
          customFields.isAcceptableOrUnknown(
              data['custom_fields']!, _customFieldsMeta));
    }
    if (data.containsKey('tags')) {
      context.handle(
          _tagsMeta, tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    }
    if (data.containsKey('finish_date')) {
      context.handle(
          _finishDateMeta,
          finishDate.isAcceptableOrUnknown(
              data['finish_date']!, _finishDateMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MediaItemRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MediaItemRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      rating: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rating']),
      source: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source'])!,
      sourceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_id']),
      sourceUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_url']),
      coverUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cover_url']),
      localCoverPath: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}local_cover_path']),
      author: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author']),
      publisher: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}publisher']),
      releaseDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}release_date']),
      duration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration']),
      platforms: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}platforms']),
      primaryPlatform: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}primary_platform']),
      season: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}season']),
      episode: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}episode']),
      totalEpisodes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_episodes']),
      customFields: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}custom_fields']),
      tags: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags']),
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category']),
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date']),
      finishDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}finish_date']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $MediaItemsTable createAlias(String alias) {
    return $MediaItemsTable(attachedDatabase, alias);
  }
}

class MediaItemRow extends DataClass implements Insertable<MediaItemRow> {
  final String id;
  final String name;
  final String type;
  final String status;
  final int? rating;
  final String source;
  final String? sourceId;
  final String? sourceUrl;
  final String? coverUrl;
  final String? localCoverPath;
  final String? author;
  final String? publisher;
  final DateTime? releaseDate;
  final int? duration;
  final String? platforms;
  final String? primaryPlatform;
  final int? season;
  final int? episode;
  final int? totalEpisodes;
  final String? customFields;
  final String? tags;
  final String? category;
  final String? note;
  final DateTime? startDate;
  final DateTime? finishDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  const MediaItemRow(
      {required this.id,
      required this.name,
      required this.type,
      required this.status,
      this.rating,
      required this.source,
      this.sourceId,
      this.sourceUrl,
      this.coverUrl,
      this.localCoverPath,
      this.author,
      this.publisher,
      this.releaseDate,
      this.duration,
      this.platforms,
      this.primaryPlatform,
      this.season,
      this.episode,
      this.totalEpisodes,
      this.customFields,
      this.tags,
      this.category,
      this.note,
      this.startDate,
      this.finishDate,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || rating != null) {
      map['rating'] = Variable<int>(rating);
    }
    map['source'] = Variable<String>(source);
    if (!nullToAbsent || sourceId != null) {
      map['source_id'] = Variable<String>(sourceId);
    }
    if (!nullToAbsent || sourceUrl != null) {
      map['source_url'] = Variable<String>(sourceUrl);
    }
    if (!nullToAbsent || coverUrl != null) {
      map['cover_url'] = Variable<String>(coverUrl);
    }
    if (!nullToAbsent || localCoverPath != null) {
      map['local_cover_path'] = Variable<String>(localCoverPath);
    }
    if (!nullToAbsent || author != null) {
      map['author'] = Variable<String>(author);
    }
    if (!nullToAbsent || publisher != null) {
      map['publisher'] = Variable<String>(publisher);
    }
    if (!nullToAbsent || releaseDate != null) {
      map['release_date'] = Variable<DateTime>(releaseDate);
    }
    if (!nullToAbsent || duration != null) {
      map['duration'] = Variable<int>(duration);
    }
    if (!nullToAbsent || platforms != null) {
      map['platforms'] = Variable<String>(platforms);
    }
    if (!nullToAbsent || primaryPlatform != null) {
      map['primary_platform'] = Variable<String>(primaryPlatform);
    }
    if (!nullToAbsent || season != null) {
      map['season'] = Variable<int>(season);
    }
    if (!nullToAbsent || episode != null) {
      map['episode'] = Variable<int>(episode);
    }
    if (!nullToAbsent || totalEpisodes != null) {
      map['total_episodes'] = Variable<int>(totalEpisodes);
    }
    if (!nullToAbsent || customFields != null) {
      map['custom_fields'] = Variable<String>(customFields);
    }
    if (!nullToAbsent || tags != null) {
      map['tags'] = Variable<String>(tags);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    if (!nullToAbsent || finishDate != null) {
      map['finish_date'] = Variable<DateTime>(finishDate);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  MediaItemsCompanion toCompanion(bool nullToAbsent) {
    return MediaItemsCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      status: Value(status),
      rating:
          rating == null && nullToAbsent ? const Value.absent() : Value(rating),
      source: Value(source),
      sourceId: sourceId == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceId),
      sourceUrl: sourceUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceUrl),
      coverUrl: coverUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(coverUrl),
      localCoverPath: localCoverPath == null && nullToAbsent
          ? const Value.absent()
          : Value(localCoverPath),
      author:
          author == null && nullToAbsent ? const Value.absent() : Value(author),
      publisher: publisher == null && nullToAbsent
          ? const Value.absent()
          : Value(publisher),
      releaseDate: releaseDate == null && nullToAbsent
          ? const Value.absent()
          : Value(releaseDate),
      duration: duration == null && nullToAbsent
          ? const Value.absent()
          : Value(duration),
      platforms: platforms == null && nullToAbsent
          ? const Value.absent()
          : Value(platforms),
      primaryPlatform: primaryPlatform == null && nullToAbsent
          ? const Value.absent()
          : Value(primaryPlatform),
      season:
          season == null && nullToAbsent ? const Value.absent() : Value(season),
      episode: episode == null && nullToAbsent
          ? const Value.absent()
          : Value(episode),
      totalEpisodes: totalEpisodes == null && nullToAbsent
          ? const Value.absent()
          : Value(totalEpisodes),
      customFields: customFields == null && nullToAbsent
          ? const Value.absent()
          : Value(customFields),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      finishDate: finishDate == null && nullToAbsent
          ? const Value.absent()
          : Value(finishDate),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory MediaItemRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MediaItemRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      status: serializer.fromJson<String>(json['status']),
      rating: serializer.fromJson<int?>(json['rating']),
      source: serializer.fromJson<String>(json['source']),
      sourceId: serializer.fromJson<String?>(json['sourceId']),
      sourceUrl: serializer.fromJson<String?>(json['sourceUrl']),
      coverUrl: serializer.fromJson<String?>(json['coverUrl']),
      localCoverPath: serializer.fromJson<String?>(json['localCoverPath']),
      author: serializer.fromJson<String?>(json['author']),
      publisher: serializer.fromJson<String?>(json['publisher']),
      releaseDate: serializer.fromJson<DateTime?>(json['releaseDate']),
      duration: serializer.fromJson<int?>(json['duration']),
      platforms: serializer.fromJson<String?>(json['platforms']),
      primaryPlatform: serializer.fromJson<String?>(json['primaryPlatform']),
      season: serializer.fromJson<int?>(json['season']),
      episode: serializer.fromJson<int?>(json['episode']),
      totalEpisodes: serializer.fromJson<int?>(json['totalEpisodes']),
      customFields: serializer.fromJson<String?>(json['customFields']),
      tags: serializer.fromJson<String?>(json['tags']),
      category: serializer.fromJson<String?>(json['category']),
      note: serializer.fromJson<String?>(json['note']),
      startDate: serializer.fromJson<DateTime?>(json['startDate']),
      finishDate: serializer.fromJson<DateTime?>(json['finishDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'status': serializer.toJson<String>(status),
      'rating': serializer.toJson<int?>(rating),
      'source': serializer.toJson<String>(source),
      'sourceId': serializer.toJson<String?>(sourceId),
      'sourceUrl': serializer.toJson<String?>(sourceUrl),
      'coverUrl': serializer.toJson<String?>(coverUrl),
      'localCoverPath': serializer.toJson<String?>(localCoverPath),
      'author': serializer.toJson<String?>(author),
      'publisher': serializer.toJson<String?>(publisher),
      'releaseDate': serializer.toJson<DateTime?>(releaseDate),
      'duration': serializer.toJson<int?>(duration),
      'platforms': serializer.toJson<String?>(platforms),
      'primaryPlatform': serializer.toJson<String?>(primaryPlatform),
      'season': serializer.toJson<int?>(season),
      'episode': serializer.toJson<int?>(episode),
      'totalEpisodes': serializer.toJson<int?>(totalEpisodes),
      'customFields': serializer.toJson<String?>(customFields),
      'tags': serializer.toJson<String?>(tags),
      'category': serializer.toJson<String?>(category),
      'note': serializer.toJson<String?>(note),
      'startDate': serializer.toJson<DateTime?>(startDate),
      'finishDate': serializer.toJson<DateTime?>(finishDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  MediaItemRow copyWith(
          {String? id,
          String? name,
          String? type,
          String? status,
          Value<int?> rating = const Value.absent(),
          String? source,
          Value<String?> sourceId = const Value.absent(),
          Value<String?> sourceUrl = const Value.absent(),
          Value<String?> coverUrl = const Value.absent(),
          Value<String?> localCoverPath = const Value.absent(),
          Value<String?> author = const Value.absent(),
          Value<String?> publisher = const Value.absent(),
          Value<DateTime?> releaseDate = const Value.absent(),
          Value<int?> duration = const Value.absent(),
          Value<String?> platforms = const Value.absent(),
          Value<String?> primaryPlatform = const Value.absent(),
          Value<int?> season = const Value.absent(),
          Value<int?> episode = const Value.absent(),
          Value<int?> totalEpisodes = const Value.absent(),
          Value<String?> customFields = const Value.absent(),
          Value<String?> tags = const Value.absent(),
          Value<String?> category = const Value.absent(),
          Value<String?> note = const Value.absent(),
          Value<DateTime?> startDate = const Value.absent(),
          Value<DateTime?> finishDate = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      MediaItemRow(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        status: status ?? this.status,
        rating: rating.present ? rating.value : this.rating,
        source: source ?? this.source,
        sourceId: sourceId.present ? sourceId.value : this.sourceId,
        sourceUrl: sourceUrl.present ? sourceUrl.value : this.sourceUrl,
        coverUrl: coverUrl.present ? coverUrl.value : this.coverUrl,
        localCoverPath:
            localCoverPath.present ? localCoverPath.value : this.localCoverPath,
        author: author.present ? author.value : this.author,
        publisher: publisher.present ? publisher.value : this.publisher,
        releaseDate: releaseDate.present ? releaseDate.value : this.releaseDate,
        duration: duration.present ? duration.value : this.duration,
        platforms: platforms.present ? platforms.value : this.platforms,
        primaryPlatform: primaryPlatform.present
            ? primaryPlatform.value
            : this.primaryPlatform,
        season: season.present ? season.value : this.season,
        episode: episode.present ? episode.value : this.episode,
        totalEpisodes:
            totalEpisodes.present ? totalEpisodes.value : this.totalEpisodes,
        customFields:
            customFields.present ? customFields.value : this.customFields,
        tags: tags.present ? tags.value : this.tags,
        category: category.present ? category.value : this.category,
        note: note.present ? note.value : this.note,
        startDate: startDate.present ? startDate.value : this.startDate,
        finishDate: finishDate.present ? finishDate.value : this.finishDate,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  MediaItemRow copyWithCompanion(MediaItemsCompanion data) {
    return MediaItemRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      status: data.status.present ? data.status.value : this.status,
      rating: data.rating.present ? data.rating.value : this.rating,
      source: data.source.present ? data.source.value : this.source,
      sourceId: data.sourceId.present ? data.sourceId.value : this.sourceId,
      sourceUrl: data.sourceUrl.present ? data.sourceUrl.value : this.sourceUrl,
      coverUrl: data.coverUrl.present ? data.coverUrl.value : this.coverUrl,
      localCoverPath: data.localCoverPath.present
          ? data.localCoverPath.value
          : this.localCoverPath,
      author: data.author.present ? data.author.value : this.author,
      publisher: data.publisher.present ? data.publisher.value : this.publisher,
      releaseDate:
          data.releaseDate.present ? data.releaseDate.value : this.releaseDate,
      duration: data.duration.present ? data.duration.value : this.duration,
      platforms: data.platforms.present ? data.platforms.value : this.platforms,
      primaryPlatform: data.primaryPlatform.present
          ? data.primaryPlatform.value
          : this.primaryPlatform,
      season: data.season.present ? data.season.value : this.season,
      episode: data.episode.present ? data.episode.value : this.episode,
      totalEpisodes: data.totalEpisodes.present
          ? data.totalEpisodes.value
          : this.totalEpisodes,
      customFields: data.customFields.present
          ? data.customFields.value
          : this.customFields,
      tags: data.tags.present ? data.tags.value : this.tags,
      category: data.category.present ? data.category.value : this.category,
      note: data.note.present ? data.note.value : this.note,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      finishDate:
          data.finishDate.present ? data.finishDate.value : this.finishDate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MediaItemRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('status: $status, ')
          ..write('rating: $rating, ')
          ..write('source: $source, ')
          ..write('sourceId: $sourceId, ')
          ..write('sourceUrl: $sourceUrl, ')
          ..write('coverUrl: $coverUrl, ')
          ..write('localCoverPath: $localCoverPath, ')
          ..write('author: $author, ')
          ..write('publisher: $publisher, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('duration: $duration, ')
          ..write('platforms: $platforms, ')
          ..write('primaryPlatform: $primaryPlatform, ')
          ..write('season: $season, ')
          ..write('episode: $episode, ')
          ..write('totalEpisodes: $totalEpisodes, ')
          ..write('customFields: $customFields, ')
          ..write('tags: $tags, ')
          ..write('category: $category, ')
          ..write('note: $note, ')
          ..write('startDate: $startDate, ')
          ..write('finishDate: $finishDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        name,
        type,
        status,
        rating,
        source,
        sourceId,
        sourceUrl,
        coverUrl,
        localCoverPath,
        author,
        publisher,
        releaseDate,
        duration,
        platforms,
        primaryPlatform,
        season,
        episode,
        totalEpisodes,
        customFields,
        tags,
        category,
        note,
        startDate,
        finishDate,
        createdAt,
        updatedAt
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MediaItemRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.status == this.status &&
          other.rating == this.rating &&
          other.source == this.source &&
          other.sourceId == this.sourceId &&
          other.sourceUrl == this.sourceUrl &&
          other.coverUrl == this.coverUrl &&
          other.localCoverPath == this.localCoverPath &&
          other.author == this.author &&
          other.publisher == this.publisher &&
          other.releaseDate == this.releaseDate &&
          other.duration == this.duration &&
          other.platforms == this.platforms &&
          other.primaryPlatform == this.primaryPlatform &&
          other.season == this.season &&
          other.episode == this.episode &&
          other.totalEpisodes == this.totalEpisodes &&
          other.customFields == this.customFields &&
          other.tags == this.tags &&
          other.category == this.category &&
          other.note == this.note &&
          other.startDate == this.startDate &&
          other.finishDate == this.finishDate &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MediaItemsCompanion extends UpdateCompanion<MediaItemRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> type;
  final Value<String> status;
  final Value<int?> rating;
  final Value<String> source;
  final Value<String?> sourceId;
  final Value<String?> sourceUrl;
  final Value<String?> coverUrl;
  final Value<String?> localCoverPath;
  final Value<String?> author;
  final Value<String?> publisher;
  final Value<DateTime?> releaseDate;
  final Value<int?> duration;
  final Value<String?> platforms;
  final Value<String?> primaryPlatform;
  final Value<int?> season;
  final Value<int?> episode;
  final Value<int?> totalEpisodes;
  final Value<String?> customFields;
  final Value<String?> tags;
  final Value<String?> category;
  final Value<String?> note;
  final Value<DateTime?> startDate;
  final Value<DateTime?> finishDate;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const MediaItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.status = const Value.absent(),
    this.rating = const Value.absent(),
    this.source = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.sourceUrl = const Value.absent(),
    this.coverUrl = const Value.absent(),
    this.localCoverPath = const Value.absent(),
    this.author = const Value.absent(),
    this.publisher = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.duration = const Value.absent(),
    this.platforms = const Value.absent(),
    this.primaryPlatform = const Value.absent(),
    this.season = const Value.absent(),
    this.episode = const Value.absent(),
    this.totalEpisodes = const Value.absent(),
    this.customFields = const Value.absent(),
    this.tags = const Value.absent(),
    this.category = const Value.absent(),
    this.note = const Value.absent(),
    this.startDate = const Value.absent(),
    this.finishDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MediaItemsCompanion.insert({
    required String id,
    required String name,
    required String type,
    this.status = const Value.absent(),
    this.rating = const Value.absent(),
    this.source = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.sourceUrl = const Value.absent(),
    this.coverUrl = const Value.absent(),
    this.localCoverPath = const Value.absent(),
    this.author = const Value.absent(),
    this.publisher = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.duration = const Value.absent(),
    this.platforms = const Value.absent(),
    this.primaryPlatform = const Value.absent(),
    this.season = const Value.absent(),
    this.episode = const Value.absent(),
    this.totalEpisodes = const Value.absent(),
    this.customFields = const Value.absent(),
    this.tags = const Value.absent(),
    this.category = const Value.absent(),
    this.note = const Value.absent(),
    this.startDate = const Value.absent(),
    this.finishDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        type = Value(type);
  static Insertable<MediaItemRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<String>? status,
    Expression<int>? rating,
    Expression<String>? source,
    Expression<String>? sourceId,
    Expression<String>? sourceUrl,
    Expression<String>? coverUrl,
    Expression<String>? localCoverPath,
    Expression<String>? author,
    Expression<String>? publisher,
    Expression<DateTime>? releaseDate,
    Expression<int>? duration,
    Expression<String>? platforms,
    Expression<String>? primaryPlatform,
    Expression<int>? season,
    Expression<int>? episode,
    Expression<int>? totalEpisodes,
    Expression<String>? customFields,
    Expression<String>? tags,
    Expression<String>? category,
    Expression<String>? note,
    Expression<DateTime>? startDate,
    Expression<DateTime>? finishDate,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (status != null) 'status': status,
      if (rating != null) 'rating': rating,
      if (source != null) 'source': source,
      if (sourceId != null) 'source_id': sourceId,
      if (sourceUrl != null) 'source_url': sourceUrl,
      if (coverUrl != null) 'cover_url': coverUrl,
      if (localCoverPath != null) 'local_cover_path': localCoverPath,
      if (author != null) 'author': author,
      if (publisher != null) 'publisher': publisher,
      if (releaseDate != null) 'release_date': releaseDate,
      if (duration != null) 'duration': duration,
      if (platforms != null) 'platforms': platforms,
      if (primaryPlatform != null) 'primary_platform': primaryPlatform,
      if (season != null) 'season': season,
      if (episode != null) 'episode': episode,
      if (totalEpisodes != null) 'total_episodes': totalEpisodes,
      if (customFields != null) 'custom_fields': customFields,
      if (tags != null) 'tags': tags,
      if (category != null) 'category': category,
      if (note != null) 'note': note,
      if (startDate != null) 'start_date': startDate,
      if (finishDate != null) 'finish_date': finishDate,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MediaItemsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? type,
      Value<String>? status,
      Value<int?>? rating,
      Value<String>? source,
      Value<String?>? sourceId,
      Value<String?>? sourceUrl,
      Value<String?>? coverUrl,
      Value<String?>? localCoverPath,
      Value<String?>? author,
      Value<String?>? publisher,
      Value<DateTime?>? releaseDate,
      Value<int?>? duration,
      Value<String?>? platforms,
      Value<String?>? primaryPlatform,
      Value<int?>? season,
      Value<int?>? episode,
      Value<int?>? totalEpisodes,
      Value<String?>? customFields,
      Value<String?>? tags,
      Value<String?>? category,
      Value<String?>? note,
      Value<DateTime?>? startDate,
      Value<DateTime?>? finishDate,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return MediaItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      status: status ?? this.status,
      rating: rating ?? this.rating,
      source: source ?? this.source,
      sourceId: sourceId ?? this.sourceId,
      sourceUrl: sourceUrl ?? this.sourceUrl,
      coverUrl: coverUrl ?? this.coverUrl,
      localCoverPath: localCoverPath ?? this.localCoverPath,
      author: author ?? this.author,
      publisher: publisher ?? this.publisher,
      releaseDate: releaseDate ?? this.releaseDate,
      duration: duration ?? this.duration,
      platforms: platforms ?? this.platforms,
      primaryPlatform: primaryPlatform ?? this.primaryPlatform,
      season: season ?? this.season,
      episode: episode ?? this.episode,
      totalEpisodes: totalEpisodes ?? this.totalEpisodes,
      customFields: customFields ?? this.customFields,
      tags: tags ?? this.tags,
      category: category ?? this.category,
      note: note ?? this.note,
      startDate: startDate ?? this.startDate,
      finishDate: finishDate ?? this.finishDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rating.present) {
      map['rating'] = Variable<int>(rating.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (sourceId.present) {
      map['source_id'] = Variable<String>(sourceId.value);
    }
    if (sourceUrl.present) {
      map['source_url'] = Variable<String>(sourceUrl.value);
    }
    if (coverUrl.present) {
      map['cover_url'] = Variable<String>(coverUrl.value);
    }
    if (localCoverPath.present) {
      map['local_cover_path'] = Variable<String>(localCoverPath.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (publisher.present) {
      map['publisher'] = Variable<String>(publisher.value);
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<DateTime>(releaseDate.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (platforms.present) {
      map['platforms'] = Variable<String>(platforms.value);
    }
    if (primaryPlatform.present) {
      map['primary_platform'] = Variable<String>(primaryPlatform.value);
    }
    if (season.present) {
      map['season'] = Variable<int>(season.value);
    }
    if (episode.present) {
      map['episode'] = Variable<int>(episode.value);
    }
    if (totalEpisodes.present) {
      map['total_episodes'] = Variable<int>(totalEpisodes.value);
    }
    if (customFields.present) {
      map['custom_fields'] = Variable<String>(customFields.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (finishDate.present) {
      map['finish_date'] = Variable<DateTime>(finishDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MediaItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('status: $status, ')
          ..write('rating: $rating, ')
          ..write('source: $source, ')
          ..write('sourceId: $sourceId, ')
          ..write('sourceUrl: $sourceUrl, ')
          ..write('coverUrl: $coverUrl, ')
          ..write('localCoverPath: $localCoverPath, ')
          ..write('author: $author, ')
          ..write('publisher: $publisher, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('duration: $duration, ')
          ..write('platforms: $platforms, ')
          ..write('primaryPlatform: $primaryPlatform, ')
          ..write('season: $season, ')
          ..write('episode: $episode, ')
          ..write('totalEpisodes: $totalEpisodes, ')
          ..write('customFields: $customFields, ')
          ..write('tags: $tags, ')
          ..write('category: $category, ')
          ..write('note: $note, ')
          ..write('startDate: $startDate, ')
          ..write('finishDate: $finishDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CustomFieldsTable extends CustomFields
    with TableInfo<$CustomFieldsTable, CustomField> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomFieldsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _entityTypeMeta =
      const VerificationMeta('entityType');
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
      'entity_type', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _entityIdMeta =
      const VerificationMeta('entityId');
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
      'entity_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _fieldKeyMeta =
      const VerificationMeta('fieldKey');
  @override
  late final GeneratedColumn<String> fieldKey = GeneratedColumn<String>(
      'field_key', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _fieldNameMeta =
      const VerificationMeta('fieldName');
  @override
  late final GeneratedColumn<String> fieldName = GeneratedColumn<String>(
      'field_name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _fieldTypeMeta =
      const VerificationMeta('fieldType');
  @override
  late final GeneratedColumn<String> fieldType = GeneratedColumn<String>(
      'field_type', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _fieldValueMeta =
      const VerificationMeta('fieldValue');
  @override
  late final GeneratedColumn<String> fieldValue = GeneratedColumn<String>(
      'field_value', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, entityType, entityId, fieldKey, fieldName, fieldType, fieldValue];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'custom_fields';
  @override
  VerificationContext validateIntegrity(Insertable<CustomField> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('entity_type')) {
      context.handle(
          _entityTypeMeta,
          entityType.isAcceptableOrUnknown(
              data['entity_type']!, _entityTypeMeta));
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(_entityIdMeta,
          entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta));
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('field_key')) {
      context.handle(_fieldKeyMeta,
          fieldKey.isAcceptableOrUnknown(data['field_key']!, _fieldKeyMeta));
    } else if (isInserting) {
      context.missing(_fieldKeyMeta);
    }
    if (data.containsKey('field_name')) {
      context.handle(_fieldNameMeta,
          fieldName.isAcceptableOrUnknown(data['field_name']!, _fieldNameMeta));
    } else if (isInserting) {
      context.missing(_fieldNameMeta);
    }
    if (data.containsKey('field_type')) {
      context.handle(_fieldTypeMeta,
          fieldType.isAcceptableOrUnknown(data['field_type']!, _fieldTypeMeta));
    } else if (isInserting) {
      context.missing(_fieldTypeMeta);
    }
    if (data.containsKey('field_value')) {
      context.handle(
          _fieldValueMeta,
          fieldValue.isAcceptableOrUnknown(
              data['field_value']!, _fieldValueMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomField map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomField(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      entityType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity_type'])!,
      entityId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity_id'])!,
      fieldKey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}field_key'])!,
      fieldName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}field_name'])!,
      fieldType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}field_type'])!,
      fieldValue: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}field_value']),
    );
  }

  @override
  $CustomFieldsTable createAlias(String alias) {
    return $CustomFieldsTable(attachedDatabase, alias);
  }
}

class CustomField extends DataClass implements Insertable<CustomField> {
  final int id;
  final String entityType;
  final String entityId;
  final String fieldKey;
  final String fieldName;
  final String fieldType;
  final String? fieldValue;
  const CustomField(
      {required this.id,
      required this.entityType,
      required this.entityId,
      required this.fieldKey,
      required this.fieldName,
      required this.fieldType,
      this.fieldValue});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['entity_type'] = Variable<String>(entityType);
    map['entity_id'] = Variable<String>(entityId);
    map['field_key'] = Variable<String>(fieldKey);
    map['field_name'] = Variable<String>(fieldName);
    map['field_type'] = Variable<String>(fieldType);
    if (!nullToAbsent || fieldValue != null) {
      map['field_value'] = Variable<String>(fieldValue);
    }
    return map;
  }

  CustomFieldsCompanion toCompanion(bool nullToAbsent) {
    return CustomFieldsCompanion(
      id: Value(id),
      entityType: Value(entityType),
      entityId: Value(entityId),
      fieldKey: Value(fieldKey),
      fieldName: Value(fieldName),
      fieldType: Value(fieldType),
      fieldValue: fieldValue == null && nullToAbsent
          ? const Value.absent()
          : Value(fieldValue),
    );
  }

  factory CustomField.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomField(
      id: serializer.fromJson<int>(json['id']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<String>(json['entityId']),
      fieldKey: serializer.fromJson<String>(json['fieldKey']),
      fieldName: serializer.fromJson<String>(json['fieldName']),
      fieldType: serializer.fromJson<String>(json['fieldType']),
      fieldValue: serializer.fromJson<String?>(json['fieldValue']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<String>(entityId),
      'fieldKey': serializer.toJson<String>(fieldKey),
      'fieldName': serializer.toJson<String>(fieldName),
      'fieldType': serializer.toJson<String>(fieldType),
      'fieldValue': serializer.toJson<String?>(fieldValue),
    };
  }

  CustomField copyWith(
          {int? id,
          String? entityType,
          String? entityId,
          String? fieldKey,
          String? fieldName,
          String? fieldType,
          Value<String?> fieldValue = const Value.absent()}) =>
      CustomField(
        id: id ?? this.id,
        entityType: entityType ?? this.entityType,
        entityId: entityId ?? this.entityId,
        fieldKey: fieldKey ?? this.fieldKey,
        fieldName: fieldName ?? this.fieldName,
        fieldType: fieldType ?? this.fieldType,
        fieldValue: fieldValue.present ? fieldValue.value : this.fieldValue,
      );
  CustomField copyWithCompanion(CustomFieldsCompanion data) {
    return CustomField(
      id: data.id.present ? data.id.value : this.id,
      entityType:
          data.entityType.present ? data.entityType.value : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      fieldKey: data.fieldKey.present ? data.fieldKey.value : this.fieldKey,
      fieldName: data.fieldName.present ? data.fieldName.value : this.fieldName,
      fieldType: data.fieldType.present ? data.fieldType.value : this.fieldType,
      fieldValue:
          data.fieldValue.present ? data.fieldValue.value : this.fieldValue,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CustomField(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('fieldKey: $fieldKey, ')
          ..write('fieldName: $fieldName, ')
          ..write('fieldType: $fieldType, ')
          ..write('fieldValue: $fieldValue')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, entityType, entityId, fieldKey, fieldName, fieldType, fieldValue);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomField &&
          other.id == this.id &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.fieldKey == this.fieldKey &&
          other.fieldName == this.fieldName &&
          other.fieldType == this.fieldType &&
          other.fieldValue == this.fieldValue);
}

class CustomFieldsCompanion extends UpdateCompanion<CustomField> {
  final Value<int> id;
  final Value<String> entityType;
  final Value<String> entityId;
  final Value<String> fieldKey;
  final Value<String> fieldName;
  final Value<String> fieldType;
  final Value<String?> fieldValue;
  const CustomFieldsCompanion({
    this.id = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.fieldKey = const Value.absent(),
    this.fieldName = const Value.absent(),
    this.fieldType = const Value.absent(),
    this.fieldValue = const Value.absent(),
  });
  CustomFieldsCompanion.insert({
    this.id = const Value.absent(),
    required String entityType,
    required String entityId,
    required String fieldKey,
    required String fieldName,
    required String fieldType,
    this.fieldValue = const Value.absent(),
  })  : entityType = Value(entityType),
        entityId = Value(entityId),
        fieldKey = Value(fieldKey),
        fieldName = Value(fieldName),
        fieldType = Value(fieldType);
  static Insertable<CustomField> custom({
    Expression<int>? id,
    Expression<String>? entityType,
    Expression<String>? entityId,
    Expression<String>? fieldKey,
    Expression<String>? fieldName,
    Expression<String>? fieldType,
    Expression<String>? fieldValue,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (fieldKey != null) 'field_key': fieldKey,
      if (fieldName != null) 'field_name': fieldName,
      if (fieldType != null) 'field_type': fieldType,
      if (fieldValue != null) 'field_value': fieldValue,
    });
  }

  CustomFieldsCompanion copyWith(
      {Value<int>? id,
      Value<String>? entityType,
      Value<String>? entityId,
      Value<String>? fieldKey,
      Value<String>? fieldName,
      Value<String>? fieldType,
      Value<String?>? fieldValue}) {
    return CustomFieldsCompanion(
      id: id ?? this.id,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      fieldKey: fieldKey ?? this.fieldKey,
      fieldName: fieldName ?? this.fieldName,
      fieldType: fieldType ?? this.fieldType,
      fieldValue: fieldValue ?? this.fieldValue,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (fieldKey.present) {
      map['field_key'] = Variable<String>(fieldKey.value);
    }
    if (fieldName.present) {
      map['field_name'] = Variable<String>(fieldName.value);
    }
    if (fieldType.present) {
      map['field_type'] = Variable<String>(fieldType.value);
    }
    if (fieldValue.present) {
      map['field_value'] = Variable<String>(fieldValue.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomFieldsCompanion(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('fieldKey: $fieldKey, ')
          ..write('fieldName: $fieldName, ')
          ..write('fieldType: $fieldType, ')
          ..write('fieldValue: $fieldValue')
          ..write(')'))
        .toString();
  }
}

class $TagsTable extends Tags with TableInfo<$TagsTable, Tag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'color', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('#6200EE'));
  @override
  List<GeneratedColumn> get $columns => [id, name, color];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tags';
  @override
  VerificationContext validateIntegrity(Insertable<Tag> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tag(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color'])!,
    );
  }

  @override
  $TagsTable createAlias(String alias) {
    return $TagsTable(attachedDatabase, alias);
  }
}

class Tag extends DataClass implements Insertable<Tag> {
  final int id;
  final String name;
  final String color;
  const Tag({required this.id, required this.name, required this.color});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['color'] = Variable<String>(color);
    return map;
  }

  TagsCompanion toCompanion(bool nullToAbsent) {
    return TagsCompanion(
      id: Value(id),
      name: Value(name),
      color: Value(color),
    );
  }

  factory Tag.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tag(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<String>(json['color']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<String>(color),
    };
  }

  Tag copyWith({int? id, String? name, String? color}) => Tag(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color ?? this.color,
      );
  Tag copyWithCompanion(TagsCompanion data) {
    return Tag(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      color: data.color.present ? data.color.value : this.color,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Tag(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, color);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tag &&
          other.id == this.id &&
          other.name == this.name &&
          other.color == this.color);
}

class TagsCompanion extends UpdateCompanion<Tag> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> color;
  const TagsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
  });
  TagsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.color = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Tag> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? color,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
    });
  }

  TagsCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? color}) {
    return TagsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }
}

class $EntityTagsTable extends EntityTags
    with TableInfo<$EntityTagsTable, EntityTag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EntityTagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _entityTypeMeta =
      const VerificationMeta('entityType');
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
      'entity_type', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _entityIdMeta =
      const VerificationMeta('entityId');
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
      'entity_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<int> tagId = GeneratedColumn<int>(
      'tag_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, entityType, entityId, tagId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'entity_tags';
  @override
  VerificationContext validateIntegrity(Insertable<EntityTag> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('entity_type')) {
      context.handle(
          _entityTypeMeta,
          entityType.isAcceptableOrUnknown(
              data['entity_type']!, _entityTypeMeta));
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(_entityIdMeta,
          entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta));
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('tag_id')) {
      context.handle(
          _tagIdMeta, tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta));
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EntityTag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EntityTag(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      entityType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity_type'])!,
      entityId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity_id'])!,
      tagId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tag_id'])!,
    );
  }

  @override
  $EntityTagsTable createAlias(String alias) {
    return $EntityTagsTable(attachedDatabase, alias);
  }
}

class EntityTag extends DataClass implements Insertable<EntityTag> {
  final int id;
  final String entityType;
  final String entityId;
  final int tagId;
  const EntityTag(
      {required this.id,
      required this.entityType,
      required this.entityId,
      required this.tagId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['entity_type'] = Variable<String>(entityType);
    map['entity_id'] = Variable<String>(entityId);
    map['tag_id'] = Variable<int>(tagId);
    return map;
  }

  EntityTagsCompanion toCompanion(bool nullToAbsent) {
    return EntityTagsCompanion(
      id: Value(id),
      entityType: Value(entityType),
      entityId: Value(entityId),
      tagId: Value(tagId),
    );
  }

  factory EntityTag.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EntityTag(
      id: serializer.fromJson<int>(json['id']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<String>(json['entityId']),
      tagId: serializer.fromJson<int>(json['tagId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<String>(entityId),
      'tagId': serializer.toJson<int>(tagId),
    };
  }

  EntityTag copyWith(
          {int? id, String? entityType, String? entityId, int? tagId}) =>
      EntityTag(
        id: id ?? this.id,
        entityType: entityType ?? this.entityType,
        entityId: entityId ?? this.entityId,
        tagId: tagId ?? this.tagId,
      );
  EntityTag copyWithCompanion(EntityTagsCompanion data) {
    return EntityTag(
      id: data.id.present ? data.id.value : this.id,
      entityType:
          data.entityType.present ? data.entityType.value : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      tagId: data.tagId.present ? data.tagId.value : this.tagId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EntityTag(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, entityType, entityId, tagId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EntityTag &&
          other.id == this.id &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.tagId == this.tagId);
}

class EntityTagsCompanion extends UpdateCompanion<EntityTag> {
  final Value<int> id;
  final Value<String> entityType;
  final Value<String> entityId;
  final Value<int> tagId;
  const EntityTagsCompanion({
    this.id = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.tagId = const Value.absent(),
  });
  EntityTagsCompanion.insert({
    this.id = const Value.absent(),
    required String entityType,
    required String entityId,
    required int tagId,
  })  : entityType = Value(entityType),
        entityId = Value(entityId),
        tagId = Value(tagId);
  static Insertable<EntityTag> custom({
    Expression<int>? id,
    Expression<String>? entityType,
    Expression<String>? entityId,
    Expression<int>? tagId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (tagId != null) 'tag_id': tagId,
    });
  }

  EntityTagsCompanion copyWith(
      {Value<int>? id,
      Value<String>? entityType,
      Value<String>? entityId,
      Value<int>? tagId}) {
    return EntityTagsCompanion(
      id: id ?? this.id,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      tagId: tagId ?? this.tagId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (tagId.present) {
      map['tag_id'] = Variable<int>(tagId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EntityTagsCompanion(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }
}

class $CustomStatusesTable extends CustomStatuses
    with TableInfo<$CustomStatusesTable, CustomStatus> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomStatusesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _entityTypeMeta =
      const VerificationMeta('entityType');
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
      'entity_type', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _statusKeyMeta =
      const VerificationMeta('statusKey');
  @override
  late final GeneratedColumn<String> statusKey = GeneratedColumn<String>(
      'status_key', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _statusLabelMeta =
      const VerificationMeta('statusLabel');
  @override
  late final GeneratedColumn<String> statusLabel = GeneratedColumn<String>(
      'status_label', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'color', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('#6200EE'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, entityType, statusKey, statusLabel, color];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'custom_statuses';
  @override
  VerificationContext validateIntegrity(Insertable<CustomStatus> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('entity_type')) {
      context.handle(
          _entityTypeMeta,
          entityType.isAcceptableOrUnknown(
              data['entity_type']!, _entityTypeMeta));
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('status_key')) {
      context.handle(_statusKeyMeta,
          statusKey.isAcceptableOrUnknown(data['status_key']!, _statusKeyMeta));
    } else if (isInserting) {
      context.missing(_statusKeyMeta);
    }
    if (data.containsKey('status_label')) {
      context.handle(
          _statusLabelMeta,
          statusLabel.isAcceptableOrUnknown(
              data['status_label']!, _statusLabelMeta));
    } else if (isInserting) {
      context.missing(_statusLabelMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomStatus map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomStatus(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      entityType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity_type'])!,
      statusKey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status_key'])!,
      statusLabel: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status_label'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color'])!,
    );
  }

  @override
  $CustomStatusesTable createAlias(String alias) {
    return $CustomStatusesTable(attachedDatabase, alias);
  }
}

class CustomStatus extends DataClass implements Insertable<CustomStatus> {
  final int id;
  final String entityType;
  final String statusKey;
  final String statusLabel;
  final String color;
  const CustomStatus(
      {required this.id,
      required this.entityType,
      required this.statusKey,
      required this.statusLabel,
      required this.color});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['entity_type'] = Variable<String>(entityType);
    map['status_key'] = Variable<String>(statusKey);
    map['status_label'] = Variable<String>(statusLabel);
    map['color'] = Variable<String>(color);
    return map;
  }

  CustomStatusesCompanion toCompanion(bool nullToAbsent) {
    return CustomStatusesCompanion(
      id: Value(id),
      entityType: Value(entityType),
      statusKey: Value(statusKey),
      statusLabel: Value(statusLabel),
      color: Value(color),
    );
  }

  factory CustomStatus.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomStatus(
      id: serializer.fromJson<int>(json['id']),
      entityType: serializer.fromJson<String>(json['entityType']),
      statusKey: serializer.fromJson<String>(json['statusKey']),
      statusLabel: serializer.fromJson<String>(json['statusLabel']),
      color: serializer.fromJson<String>(json['color']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'entityType': serializer.toJson<String>(entityType),
      'statusKey': serializer.toJson<String>(statusKey),
      'statusLabel': serializer.toJson<String>(statusLabel),
      'color': serializer.toJson<String>(color),
    };
  }

  CustomStatus copyWith(
          {int? id,
          String? entityType,
          String? statusKey,
          String? statusLabel,
          String? color}) =>
      CustomStatus(
        id: id ?? this.id,
        entityType: entityType ?? this.entityType,
        statusKey: statusKey ?? this.statusKey,
        statusLabel: statusLabel ?? this.statusLabel,
        color: color ?? this.color,
      );
  CustomStatus copyWithCompanion(CustomStatusesCompanion data) {
    return CustomStatus(
      id: data.id.present ? data.id.value : this.id,
      entityType:
          data.entityType.present ? data.entityType.value : this.entityType,
      statusKey: data.statusKey.present ? data.statusKey.value : this.statusKey,
      statusLabel:
          data.statusLabel.present ? data.statusLabel.value : this.statusLabel,
      color: data.color.present ? data.color.value : this.color,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CustomStatus(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('statusKey: $statusKey, ')
          ..write('statusLabel: $statusLabel, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, entityType, statusKey, statusLabel, color);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomStatus &&
          other.id == this.id &&
          other.entityType == this.entityType &&
          other.statusKey == this.statusKey &&
          other.statusLabel == this.statusLabel &&
          other.color == this.color);
}

class CustomStatusesCompanion extends UpdateCompanion<CustomStatus> {
  final Value<int> id;
  final Value<String> entityType;
  final Value<String> statusKey;
  final Value<String> statusLabel;
  final Value<String> color;
  const CustomStatusesCompanion({
    this.id = const Value.absent(),
    this.entityType = const Value.absent(),
    this.statusKey = const Value.absent(),
    this.statusLabel = const Value.absent(),
    this.color = const Value.absent(),
  });
  CustomStatusesCompanion.insert({
    this.id = const Value.absent(),
    required String entityType,
    required String statusKey,
    required String statusLabel,
    this.color = const Value.absent(),
  })  : entityType = Value(entityType),
        statusKey = Value(statusKey),
        statusLabel = Value(statusLabel);
  static Insertable<CustomStatus> custom({
    Expression<int>? id,
    Expression<String>? entityType,
    Expression<String>? statusKey,
    Expression<String>? statusLabel,
    Expression<String>? color,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entityType != null) 'entity_type': entityType,
      if (statusKey != null) 'status_key': statusKey,
      if (statusLabel != null) 'status_label': statusLabel,
      if (color != null) 'color': color,
    });
  }

  CustomStatusesCompanion copyWith(
      {Value<int>? id,
      Value<String>? entityType,
      Value<String>? statusKey,
      Value<String>? statusLabel,
      Value<String>? color}) {
    return CustomStatusesCompanion(
      id: id ?? this.id,
      entityType: entityType ?? this.entityType,
      statusKey: statusKey ?? this.statusKey,
      statusLabel: statusLabel ?? this.statusLabel,
      color: color ?? this.color,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (statusKey.present) {
      map['status_key'] = Variable<String>(statusKey.value);
    }
    if (statusLabel.present) {
      map['status_label'] = Variable<String>(statusLabel.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomStatusesCompanion(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('statusKey: $statusKey, ')
          ..write('statusLabel: $statusLabel, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }
}

class $CustomCategoriesTable extends CustomCategories
    with TableInfo<$CustomCategoriesTable, CustomCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _entityTypeMeta =
      const VerificationMeta('entityType');
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
      'entity_type', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _categoryKeyMeta =
      const VerificationMeta('categoryKey');
  @override
  late final GeneratedColumn<String> categoryKey = GeneratedColumn<String>(
      'category_key', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _categoryLabelMeta =
      const VerificationMeta('categoryLabel');
  @override
  late final GeneratedColumn<String> categoryLabel = GeneratedColumn<String>(
      'category_label', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
      'icon', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, entityType, categoryKey, categoryLabel, icon];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'custom_categories';
  @override
  VerificationContext validateIntegrity(Insertable<CustomCategory> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('entity_type')) {
      context.handle(
          _entityTypeMeta,
          entityType.isAcceptableOrUnknown(
              data['entity_type']!, _entityTypeMeta));
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('category_key')) {
      context.handle(
          _categoryKeyMeta,
          categoryKey.isAcceptableOrUnknown(
              data['category_key']!, _categoryKeyMeta));
    } else if (isInserting) {
      context.missing(_categoryKeyMeta);
    }
    if (data.containsKey('category_label')) {
      context.handle(
          _categoryLabelMeta,
          categoryLabel.isAcceptableOrUnknown(
              data['category_label']!, _categoryLabelMeta));
    } else if (isInserting) {
      context.missing(_categoryLabelMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon']!, _iconMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomCategory(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      entityType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity_type'])!,
      categoryKey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_key'])!,
      categoryLabel: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_label'])!,
      icon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon']),
    );
  }

  @override
  $CustomCategoriesTable createAlias(String alias) {
    return $CustomCategoriesTable(attachedDatabase, alias);
  }
}

class CustomCategory extends DataClass implements Insertable<CustomCategory> {
  final int id;
  final String entityType;
  final String categoryKey;
  final String categoryLabel;
  final String? icon;
  const CustomCategory(
      {required this.id,
      required this.entityType,
      required this.categoryKey,
      required this.categoryLabel,
      this.icon});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['entity_type'] = Variable<String>(entityType);
    map['category_key'] = Variable<String>(categoryKey);
    map['category_label'] = Variable<String>(categoryLabel);
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<String>(icon);
    }
    return map;
  }

  CustomCategoriesCompanion toCompanion(bool nullToAbsent) {
    return CustomCategoriesCompanion(
      id: Value(id),
      entityType: Value(entityType),
      categoryKey: Value(categoryKey),
      categoryLabel: Value(categoryLabel),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
    );
  }

  factory CustomCategory.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomCategory(
      id: serializer.fromJson<int>(json['id']),
      entityType: serializer.fromJson<String>(json['entityType']),
      categoryKey: serializer.fromJson<String>(json['categoryKey']),
      categoryLabel: serializer.fromJson<String>(json['categoryLabel']),
      icon: serializer.fromJson<String?>(json['icon']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'entityType': serializer.toJson<String>(entityType),
      'categoryKey': serializer.toJson<String>(categoryKey),
      'categoryLabel': serializer.toJson<String>(categoryLabel),
      'icon': serializer.toJson<String?>(icon),
    };
  }

  CustomCategory copyWith(
          {int? id,
          String? entityType,
          String? categoryKey,
          String? categoryLabel,
          Value<String?> icon = const Value.absent()}) =>
      CustomCategory(
        id: id ?? this.id,
        entityType: entityType ?? this.entityType,
        categoryKey: categoryKey ?? this.categoryKey,
        categoryLabel: categoryLabel ?? this.categoryLabel,
        icon: icon.present ? icon.value : this.icon,
      );
  CustomCategory copyWithCompanion(CustomCategoriesCompanion data) {
    return CustomCategory(
      id: data.id.present ? data.id.value : this.id,
      entityType:
          data.entityType.present ? data.entityType.value : this.entityType,
      categoryKey:
          data.categoryKey.present ? data.categoryKey.value : this.categoryKey,
      categoryLabel: data.categoryLabel.present
          ? data.categoryLabel.value
          : this.categoryLabel,
      icon: data.icon.present ? data.icon.value : this.icon,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CustomCategory(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('categoryKey: $categoryKey, ')
          ..write('categoryLabel: $categoryLabel, ')
          ..write('icon: $icon')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, entityType, categoryKey, categoryLabel, icon);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomCategory &&
          other.id == this.id &&
          other.entityType == this.entityType &&
          other.categoryKey == this.categoryKey &&
          other.categoryLabel == this.categoryLabel &&
          other.icon == this.icon);
}

class CustomCategoriesCompanion extends UpdateCompanion<CustomCategory> {
  final Value<int> id;
  final Value<String> entityType;
  final Value<String> categoryKey;
  final Value<String> categoryLabel;
  final Value<String?> icon;
  const CustomCategoriesCompanion({
    this.id = const Value.absent(),
    this.entityType = const Value.absent(),
    this.categoryKey = const Value.absent(),
    this.categoryLabel = const Value.absent(),
    this.icon = const Value.absent(),
  });
  CustomCategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String entityType,
    required String categoryKey,
    required String categoryLabel,
    this.icon = const Value.absent(),
  })  : entityType = Value(entityType),
        categoryKey = Value(categoryKey),
        categoryLabel = Value(categoryLabel);
  static Insertable<CustomCategory> custom({
    Expression<int>? id,
    Expression<String>? entityType,
    Expression<String>? categoryKey,
    Expression<String>? categoryLabel,
    Expression<String>? icon,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entityType != null) 'entity_type': entityType,
      if (categoryKey != null) 'category_key': categoryKey,
      if (categoryLabel != null) 'category_label': categoryLabel,
      if (icon != null) 'icon': icon,
    });
  }

  CustomCategoriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? entityType,
      Value<String>? categoryKey,
      Value<String>? categoryLabel,
      Value<String?>? icon}) {
    return CustomCategoriesCompanion(
      id: id ?? this.id,
      entityType: entityType ?? this.entityType,
      categoryKey: categoryKey ?? this.categoryKey,
      categoryLabel: categoryLabel ?? this.categoryLabel,
      icon: icon ?? this.icon,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (categoryKey.present) {
      map['category_key'] = Variable<String>(categoryKey.value);
    }
    if (categoryLabel.present) {
      map['category_label'] = Variable<String>(categoryLabel.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomCategoriesCompanion(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('categoryKey: $categoryKey, ')
          ..write('categoryLabel: $categoryLabel, ')
          ..write('icon: $icon')
          ..write(')'))
        .toString();
  }
}

class $DisplayConfigsTable extends DisplayConfigs
    with TableInfo<$DisplayConfigsTable, DisplayConfig> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DisplayConfigsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _entityTypeMeta =
      const VerificationMeta('entityType');
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
      'entity_type', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _viewTypeMeta =
      const VerificationMeta('viewType');
  @override
  late final GeneratedColumn<String> viewType = GeneratedColumn<String>(
      'view_type', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _fieldsMeta = const VerificationMeta('fields');
  @override
  late final GeneratedColumn<String> fields = GeneratedColumn<String>(
      'fields', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, entityType, viewType, fields];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'display_configs';
  @override
  VerificationContext validateIntegrity(Insertable<DisplayConfig> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('entity_type')) {
      context.handle(
          _entityTypeMeta,
          entityType.isAcceptableOrUnknown(
              data['entity_type']!, _entityTypeMeta));
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('view_type')) {
      context.handle(_viewTypeMeta,
          viewType.isAcceptableOrUnknown(data['view_type']!, _viewTypeMeta));
    } else if (isInserting) {
      context.missing(_viewTypeMeta);
    }
    if (data.containsKey('fields')) {
      context.handle(_fieldsMeta,
          fields.isAcceptableOrUnknown(data['fields']!, _fieldsMeta));
    } else if (isInserting) {
      context.missing(_fieldsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DisplayConfig map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DisplayConfig(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      entityType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity_type'])!,
      viewType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}view_type'])!,
      fields: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}fields'])!,
    );
  }

  @override
  $DisplayConfigsTable createAlias(String alias) {
    return $DisplayConfigsTable(attachedDatabase, alias);
  }
}

class DisplayConfig extends DataClass implements Insertable<DisplayConfig> {
  final int id;
  final String entityType;
  final String viewType;
  final String fields;
  const DisplayConfig(
      {required this.id,
      required this.entityType,
      required this.viewType,
      required this.fields});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['entity_type'] = Variable<String>(entityType);
    map['view_type'] = Variable<String>(viewType);
    map['fields'] = Variable<String>(fields);
    return map;
  }

  DisplayConfigsCompanion toCompanion(bool nullToAbsent) {
    return DisplayConfigsCompanion(
      id: Value(id),
      entityType: Value(entityType),
      viewType: Value(viewType),
      fields: Value(fields),
    );
  }

  factory DisplayConfig.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DisplayConfig(
      id: serializer.fromJson<int>(json['id']),
      entityType: serializer.fromJson<String>(json['entityType']),
      viewType: serializer.fromJson<String>(json['viewType']),
      fields: serializer.fromJson<String>(json['fields']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'entityType': serializer.toJson<String>(entityType),
      'viewType': serializer.toJson<String>(viewType),
      'fields': serializer.toJson<String>(fields),
    };
  }

  DisplayConfig copyWith(
          {int? id, String? entityType, String? viewType, String? fields}) =>
      DisplayConfig(
        id: id ?? this.id,
        entityType: entityType ?? this.entityType,
        viewType: viewType ?? this.viewType,
        fields: fields ?? this.fields,
      );
  DisplayConfig copyWithCompanion(DisplayConfigsCompanion data) {
    return DisplayConfig(
      id: data.id.present ? data.id.value : this.id,
      entityType:
          data.entityType.present ? data.entityType.value : this.entityType,
      viewType: data.viewType.present ? data.viewType.value : this.viewType,
      fields: data.fields.present ? data.fields.value : this.fields,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DisplayConfig(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('viewType: $viewType, ')
          ..write('fields: $fields')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, entityType, viewType, fields);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DisplayConfig &&
          other.id == this.id &&
          other.entityType == this.entityType &&
          other.viewType == this.viewType &&
          other.fields == this.fields);
}

class DisplayConfigsCompanion extends UpdateCompanion<DisplayConfig> {
  final Value<int> id;
  final Value<String> entityType;
  final Value<String> viewType;
  final Value<String> fields;
  const DisplayConfigsCompanion({
    this.id = const Value.absent(),
    this.entityType = const Value.absent(),
    this.viewType = const Value.absent(),
    this.fields = const Value.absent(),
  });
  DisplayConfigsCompanion.insert({
    this.id = const Value.absent(),
    required String entityType,
    required String viewType,
    required String fields,
  })  : entityType = Value(entityType),
        viewType = Value(viewType),
        fields = Value(fields);
  static Insertable<DisplayConfig> custom({
    Expression<int>? id,
    Expression<String>? entityType,
    Expression<String>? viewType,
    Expression<String>? fields,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entityType != null) 'entity_type': entityType,
      if (viewType != null) 'view_type': viewType,
      if (fields != null) 'fields': fields,
    });
  }

  DisplayConfigsCompanion copyWith(
      {Value<int>? id,
      Value<String>? entityType,
      Value<String>? viewType,
      Value<String>? fields}) {
    return DisplayConfigsCompanion(
      id: id ?? this.id,
      entityType: entityType ?? this.entityType,
      viewType: viewType ?? this.viewType,
      fields: fields ?? this.fields,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (viewType.present) {
      map['view_type'] = Variable<String>(viewType.value);
    }
    if (fields.present) {
      map['fields'] = Variable<String>(fields.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DisplayConfigsCompanion(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('viewType: $viewType, ')
          ..write('fields: $fields')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(Insertable<AppSetting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  AppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetting(
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value']),
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final String key;
  final String? value;
  const AppSetting({required this.key, this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<String>(value);
    }
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      key: Value(key),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
    );
  }

  factory AppSetting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetting(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String?>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String?>(value),
    };
  }

  AppSetting copyWith(
          {String? key, Value<String?> value = const Value.absent()}) =>
      AppSetting(
        key: key ?? this.key,
        value: value.present ? value.value : this.value,
      );
  AppSetting copyWithCompanion(AppSettingsCompanion data) {
    return AppSetting(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.key == this.key &&
          other.value == this.value);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<String> key;
  final Value<String?> value;
  final Value<int> rowid;
  const AppSettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    required String key,
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : key = Value(key);
  static Insertable<AppSetting> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppSettingsCompanion copyWith(
      {Value<String>? key, Value<String?>? value, Value<int>? rowid}) {
    return AppSettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AssetsTable assets = $AssetsTable(this);
  late final $MediaItemsTable mediaItems = $MediaItemsTable(this);
  late final $CustomFieldsTable customFields = $CustomFieldsTable(this);
  late final $TagsTable tags = $TagsTable(this);
  late final $EntityTagsTable entityTags = $EntityTagsTable(this);
  late final $CustomStatusesTable customStatuses = $CustomStatusesTable(this);
  late final $CustomCategoriesTable customCategories =
      $CustomCategoriesTable(this);
  late final $DisplayConfigsTable displayConfigs = $DisplayConfigsTable(this);
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        assets,
        mediaItems,
        customFields,
        tags,
        entityTags,
        customStatuses,
        customCategories,
        displayConfigs,
        appSettings
      ];
}

typedef $$AssetsTableCreateCompanionBuilder = AssetsCompanion Function({
  required String id,
  required String name,
  required String type,
  Value<String?> subCategory,
  Value<String?> icon,
  Value<String?> images,
  required double purchasePrice,
  Value<double?> currentValue,
  Value<String> currency,
  required DateTime startDate,
  Value<DateTime?> endDate,
  Value<String> billingCycle,
  Value<double?> billingAmount,
  Value<DateTime?> nextRenewalDate,
  Value<bool> autoRenew,
  Value<DateTime?> trialEndDate,
  Value<int?> totalUses,
  Value<int?> usedCount,
  Value<String> status,
  Value<double?> sellPrice,
  Value<DateTime?> sellDate,
  Value<String?> customFields,
  Value<String?> tags,
  Value<String?> note,
  Value<int> reminderDays,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$AssetsTableUpdateCompanionBuilder = AssetsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> type,
  Value<String?> subCategory,
  Value<String?> icon,
  Value<String?> images,
  Value<double> purchasePrice,
  Value<double?> currentValue,
  Value<String> currency,
  Value<DateTime> startDate,
  Value<DateTime?> endDate,
  Value<String> billingCycle,
  Value<double?> billingAmount,
  Value<DateTime?> nextRenewalDate,
  Value<bool> autoRenew,
  Value<DateTime?> trialEndDate,
  Value<int?> totalUses,
  Value<int?> usedCount,
  Value<String> status,
  Value<double?> sellPrice,
  Value<DateTime?> sellDate,
  Value<String?> customFields,
  Value<String?> tags,
  Value<String?> note,
  Value<int> reminderDays,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$AssetsTableFilterComposer
    extends Composer<_$AppDatabase, $AssetsTable> {
  $$AssetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get subCategory => $composableBuilder(
      column: $table.subCategory, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get icon => $composableBuilder(
      column: $table.icon, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get images => $composableBuilder(
      column: $table.images, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get purchasePrice => $composableBuilder(
      column: $table.purchasePrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get currentValue => $composableBuilder(
      column: $table.currentValue, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get billingCycle => $composableBuilder(
      column: $table.billingCycle, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get billingAmount => $composableBuilder(
      column: $table.billingAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get nextRenewalDate => $composableBuilder(
      column: $table.nextRenewalDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get autoRenew => $composableBuilder(
      column: $table.autoRenew, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get trialEndDate => $composableBuilder(
      column: $table.trialEndDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalUses => $composableBuilder(
      column: $table.totalUses, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get usedCount => $composableBuilder(
      column: $table.usedCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get sellPrice => $composableBuilder(
      column: $table.sellPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get sellDate => $composableBuilder(
      column: $table.sellDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get customFields => $composableBuilder(
      column: $table.customFields, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tags => $composableBuilder(
      column: $table.tags, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get reminderDays => $composableBuilder(
      column: $table.reminderDays, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$AssetsTableOrderingComposer
    extends Composer<_$AppDatabase, $AssetsTable> {
  $$AssetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get subCategory => $composableBuilder(
      column: $table.subCategory, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get icon => $composableBuilder(
      column: $table.icon, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get images => $composableBuilder(
      column: $table.images, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get purchasePrice => $composableBuilder(
      column: $table.purchasePrice,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get currentValue => $composableBuilder(
      column: $table.currentValue,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get billingCycle => $composableBuilder(
      column: $table.billingCycle,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get billingAmount => $composableBuilder(
      column: $table.billingAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get nextRenewalDate => $composableBuilder(
      column: $table.nextRenewalDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get autoRenew => $composableBuilder(
      column: $table.autoRenew, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get trialEndDate => $composableBuilder(
      column: $table.trialEndDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalUses => $composableBuilder(
      column: $table.totalUses, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get usedCount => $composableBuilder(
      column: $table.usedCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get sellPrice => $composableBuilder(
      column: $table.sellPrice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get sellDate => $composableBuilder(
      column: $table.sellDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get customFields => $composableBuilder(
      column: $table.customFields,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tags => $composableBuilder(
      column: $table.tags, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get reminderDays => $composableBuilder(
      column: $table.reminderDays,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$AssetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AssetsTable> {
  $$AssetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get subCategory => $composableBuilder(
      column: $table.subCategory, builder: (column) => column);

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumn<String> get images =>
      $composableBuilder(column: $table.images, builder: (column) => column);

  GeneratedColumn<double> get purchasePrice => $composableBuilder(
      column: $table.purchasePrice, builder: (column) => column);

  GeneratedColumn<double> get currentValue => $composableBuilder(
      column: $table.currentValue, builder: (column) => column);

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<String> get billingCycle => $composableBuilder(
      column: $table.billingCycle, builder: (column) => column);

  GeneratedColumn<double> get billingAmount => $composableBuilder(
      column: $table.billingAmount, builder: (column) => column);

  GeneratedColumn<DateTime> get nextRenewalDate => $composableBuilder(
      column: $table.nextRenewalDate, builder: (column) => column);

  GeneratedColumn<bool> get autoRenew =>
      $composableBuilder(column: $table.autoRenew, builder: (column) => column);

  GeneratedColumn<DateTime> get trialEndDate => $composableBuilder(
      column: $table.trialEndDate, builder: (column) => column);

  GeneratedColumn<int> get totalUses =>
      $composableBuilder(column: $table.totalUses, builder: (column) => column);

  GeneratedColumn<int> get usedCount =>
      $composableBuilder(column: $table.usedCount, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<double> get sellPrice =>
      $composableBuilder(column: $table.sellPrice, builder: (column) => column);

  GeneratedColumn<DateTime> get sellDate =>
      $composableBuilder(column: $table.sellDate, builder: (column) => column);

  GeneratedColumn<String> get customFields => $composableBuilder(
      column: $table.customFields, builder: (column) => column);

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<int> get reminderDays => $composableBuilder(
      column: $table.reminderDays, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$AssetsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AssetsTable,
    AssetRow,
    $$AssetsTableFilterComposer,
    $$AssetsTableOrderingComposer,
    $$AssetsTableAnnotationComposer,
    $$AssetsTableCreateCompanionBuilder,
    $$AssetsTableUpdateCompanionBuilder,
    (AssetRow, BaseReferences<_$AppDatabase, $AssetsTable, AssetRow>),
    AssetRow,
    PrefetchHooks Function()> {
  $$AssetsTableTableManager(_$AppDatabase db, $AssetsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AssetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AssetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AssetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String?> subCategory = const Value.absent(),
            Value<String?> icon = const Value.absent(),
            Value<String?> images = const Value.absent(),
            Value<double> purchasePrice = const Value.absent(),
            Value<double?> currentValue = const Value.absent(),
            Value<String> currency = const Value.absent(),
            Value<DateTime> startDate = const Value.absent(),
            Value<DateTime?> endDate = const Value.absent(),
            Value<String> billingCycle = const Value.absent(),
            Value<double?> billingAmount = const Value.absent(),
            Value<DateTime?> nextRenewalDate = const Value.absent(),
            Value<bool> autoRenew = const Value.absent(),
            Value<DateTime?> trialEndDate = const Value.absent(),
            Value<int?> totalUses = const Value.absent(),
            Value<int?> usedCount = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<double?> sellPrice = const Value.absent(),
            Value<DateTime?> sellDate = const Value.absent(),
            Value<String?> customFields = const Value.absent(),
            Value<String?> tags = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<int> reminderDays = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AssetsCompanion(
            id: id,
            name: name,
            type: type,
            subCategory: subCategory,
            icon: icon,
            images: images,
            purchasePrice: purchasePrice,
            currentValue: currentValue,
            currency: currency,
            startDate: startDate,
            endDate: endDate,
            billingCycle: billingCycle,
            billingAmount: billingAmount,
            nextRenewalDate: nextRenewalDate,
            autoRenew: autoRenew,
            trialEndDate: trialEndDate,
            totalUses: totalUses,
            usedCount: usedCount,
            status: status,
            sellPrice: sellPrice,
            sellDate: sellDate,
            customFields: customFields,
            tags: tags,
            note: note,
            reminderDays: reminderDays,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String type,
            Value<String?> subCategory = const Value.absent(),
            Value<String?> icon = const Value.absent(),
            Value<String?> images = const Value.absent(),
            required double purchasePrice,
            Value<double?> currentValue = const Value.absent(),
            Value<String> currency = const Value.absent(),
            required DateTime startDate,
            Value<DateTime?> endDate = const Value.absent(),
            Value<String> billingCycle = const Value.absent(),
            Value<double?> billingAmount = const Value.absent(),
            Value<DateTime?> nextRenewalDate = const Value.absent(),
            Value<bool> autoRenew = const Value.absent(),
            Value<DateTime?> trialEndDate = const Value.absent(),
            Value<int?> totalUses = const Value.absent(),
            Value<int?> usedCount = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<double?> sellPrice = const Value.absent(),
            Value<DateTime?> sellDate = const Value.absent(),
            Value<String?> customFields = const Value.absent(),
            Value<String?> tags = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<int> reminderDays = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AssetsCompanion.insert(
            id: id,
            name: name,
            type: type,
            subCategory: subCategory,
            icon: icon,
            images: images,
            purchasePrice: purchasePrice,
            currentValue: currentValue,
            currency: currency,
            startDate: startDate,
            endDate: endDate,
            billingCycle: billingCycle,
            billingAmount: billingAmount,
            nextRenewalDate: nextRenewalDate,
            autoRenew: autoRenew,
            trialEndDate: trialEndDate,
            totalUses: totalUses,
            usedCount: usedCount,
            status: status,
            sellPrice: sellPrice,
            sellDate: sellDate,
            customFields: customFields,
            tags: tags,
            note: note,
            reminderDays: reminderDays,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AssetsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AssetsTable,
    AssetRow,
    $$AssetsTableFilterComposer,
    $$AssetsTableOrderingComposer,
    $$AssetsTableAnnotationComposer,
    $$AssetsTableCreateCompanionBuilder,
    $$AssetsTableUpdateCompanionBuilder,
    (AssetRow, BaseReferences<_$AppDatabase, $AssetsTable, AssetRow>),
    AssetRow,
    PrefetchHooks Function()>;
typedef $$MediaItemsTableCreateCompanionBuilder = MediaItemsCompanion Function({
  required String id,
  required String name,
  required String type,
  Value<String> status,
  Value<int?> rating,
  Value<String> source,
  Value<String?> sourceId,
  Value<String?> sourceUrl,
  Value<String?> coverUrl,
  Value<String?> localCoverPath,
  Value<String?> author,
  Value<String?> publisher,
  Value<DateTime?> releaseDate,
  Value<int?> duration,
  Value<String?> platforms,
  Value<String?> primaryPlatform,
  Value<int?> season,
  Value<int?> episode,
  Value<int?> totalEpisodes,
  Value<String?> customFields,
  Value<String?> tags,
  Value<String?> category,
  Value<String?> note,
  Value<DateTime?> startDate,
  Value<DateTime?> finishDate,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$MediaItemsTableUpdateCompanionBuilder = MediaItemsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> type,
  Value<String> status,
  Value<int?> rating,
  Value<String> source,
  Value<String?> sourceId,
  Value<String?> sourceUrl,
  Value<String?> coverUrl,
  Value<String?> localCoverPath,
  Value<String?> author,
  Value<String?> publisher,
  Value<DateTime?> releaseDate,
  Value<int?> duration,
  Value<String?> platforms,
  Value<String?> primaryPlatform,
  Value<int?> season,
  Value<int?> episode,
  Value<int?> totalEpisodes,
  Value<String?> customFields,
  Value<String?> tags,
  Value<String?> category,
  Value<String?> note,
  Value<DateTime?> startDate,
  Value<DateTime?> finishDate,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$MediaItemsTableFilterComposer
    extends Composer<_$AppDatabase, $MediaItemsTable> {
  $$MediaItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceId => $composableBuilder(
      column: $table.sourceId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceUrl => $composableBuilder(
      column: $table.sourceUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get coverUrl => $composableBuilder(
      column: $table.coverUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get localCoverPath => $composableBuilder(
      column: $table.localCoverPath,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get author => $composableBuilder(
      column: $table.author, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get publisher => $composableBuilder(
      column: $table.publisher, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get releaseDate => $composableBuilder(
      column: $table.releaseDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get duration => $composableBuilder(
      column: $table.duration, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get platforms => $composableBuilder(
      column: $table.platforms, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get primaryPlatform => $composableBuilder(
      column: $table.primaryPlatform,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get season => $composableBuilder(
      column: $table.season, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get episode => $composableBuilder(
      column: $table.episode, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalEpisodes => $composableBuilder(
      column: $table.totalEpisodes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get customFields => $composableBuilder(
      column: $table.customFields, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tags => $composableBuilder(
      column: $table.tags, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get finishDate => $composableBuilder(
      column: $table.finishDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$MediaItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $MediaItemsTable> {
  $$MediaItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceId => $composableBuilder(
      column: $table.sourceId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceUrl => $composableBuilder(
      column: $table.sourceUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get coverUrl => $composableBuilder(
      column: $table.coverUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get localCoverPath => $composableBuilder(
      column: $table.localCoverPath,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get author => $composableBuilder(
      column: $table.author, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get publisher => $composableBuilder(
      column: $table.publisher, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get releaseDate => $composableBuilder(
      column: $table.releaseDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get duration => $composableBuilder(
      column: $table.duration, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get platforms => $composableBuilder(
      column: $table.platforms, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get primaryPlatform => $composableBuilder(
      column: $table.primaryPlatform,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get season => $composableBuilder(
      column: $table.season, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get episode => $composableBuilder(
      column: $table.episode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalEpisodes => $composableBuilder(
      column: $table.totalEpisodes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get customFields => $composableBuilder(
      column: $table.customFields,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tags => $composableBuilder(
      column: $table.tags, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get finishDate => $composableBuilder(
      column: $table.finishDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$MediaItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MediaItemsTable> {
  $$MediaItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get sourceId =>
      $composableBuilder(column: $table.sourceId, builder: (column) => column);

  GeneratedColumn<String> get sourceUrl =>
      $composableBuilder(column: $table.sourceUrl, builder: (column) => column);

  GeneratedColumn<String> get coverUrl =>
      $composableBuilder(column: $table.coverUrl, builder: (column) => column);

  GeneratedColumn<String> get localCoverPath => $composableBuilder(
      column: $table.localCoverPath, builder: (column) => column);

  GeneratedColumn<String> get author =>
      $composableBuilder(column: $table.author, builder: (column) => column);

  GeneratedColumn<String> get publisher =>
      $composableBuilder(column: $table.publisher, builder: (column) => column);

  GeneratedColumn<DateTime> get releaseDate => $composableBuilder(
      column: $table.releaseDate, builder: (column) => column);

  GeneratedColumn<int> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<String> get platforms =>
      $composableBuilder(column: $table.platforms, builder: (column) => column);

  GeneratedColumn<String> get primaryPlatform => $composableBuilder(
      column: $table.primaryPlatform, builder: (column) => column);

  GeneratedColumn<int> get season =>
      $composableBuilder(column: $table.season, builder: (column) => column);

  GeneratedColumn<int> get episode =>
      $composableBuilder(column: $table.episode, builder: (column) => column);

  GeneratedColumn<int> get totalEpisodes => $composableBuilder(
      column: $table.totalEpisodes, builder: (column) => column);

  GeneratedColumn<String> get customFields => $composableBuilder(
      column: $table.customFields, builder: (column) => column);

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get finishDate => $composableBuilder(
      column: $table.finishDate, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$MediaItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MediaItemsTable,
    MediaItemRow,
    $$MediaItemsTableFilterComposer,
    $$MediaItemsTableOrderingComposer,
    $$MediaItemsTableAnnotationComposer,
    $$MediaItemsTableCreateCompanionBuilder,
    $$MediaItemsTableUpdateCompanionBuilder,
    (
      MediaItemRow,
      BaseReferences<_$AppDatabase, $MediaItemsTable, MediaItemRow>
    ),
    MediaItemRow,
    PrefetchHooks Function()> {
  $$MediaItemsTableTableManager(_$AppDatabase db, $MediaItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MediaItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MediaItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MediaItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int?> rating = const Value.absent(),
            Value<String> source = const Value.absent(),
            Value<String?> sourceId = const Value.absent(),
            Value<String?> sourceUrl = const Value.absent(),
            Value<String?> coverUrl = const Value.absent(),
            Value<String?> localCoverPath = const Value.absent(),
            Value<String?> author = const Value.absent(),
            Value<String?> publisher = const Value.absent(),
            Value<DateTime?> releaseDate = const Value.absent(),
            Value<int?> duration = const Value.absent(),
            Value<String?> platforms = const Value.absent(),
            Value<String?> primaryPlatform = const Value.absent(),
            Value<int?> season = const Value.absent(),
            Value<int?> episode = const Value.absent(),
            Value<int?> totalEpisodes = const Value.absent(),
            Value<String?> customFields = const Value.absent(),
            Value<String?> tags = const Value.absent(),
            Value<String?> category = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<DateTime?> startDate = const Value.absent(),
            Value<DateTime?> finishDate = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MediaItemsCompanion(
            id: id,
            name: name,
            type: type,
            status: status,
            rating: rating,
            source: source,
            sourceId: sourceId,
            sourceUrl: sourceUrl,
            coverUrl: coverUrl,
            localCoverPath: localCoverPath,
            author: author,
            publisher: publisher,
            releaseDate: releaseDate,
            duration: duration,
            platforms: platforms,
            primaryPlatform: primaryPlatform,
            season: season,
            episode: episode,
            totalEpisodes: totalEpisodes,
            customFields: customFields,
            tags: tags,
            category: category,
            note: note,
            startDate: startDate,
            finishDate: finishDate,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String type,
            Value<String> status = const Value.absent(),
            Value<int?> rating = const Value.absent(),
            Value<String> source = const Value.absent(),
            Value<String?> sourceId = const Value.absent(),
            Value<String?> sourceUrl = const Value.absent(),
            Value<String?> coverUrl = const Value.absent(),
            Value<String?> localCoverPath = const Value.absent(),
            Value<String?> author = const Value.absent(),
            Value<String?> publisher = const Value.absent(),
            Value<DateTime?> releaseDate = const Value.absent(),
            Value<int?> duration = const Value.absent(),
            Value<String?> platforms = const Value.absent(),
            Value<String?> primaryPlatform = const Value.absent(),
            Value<int?> season = const Value.absent(),
            Value<int?> episode = const Value.absent(),
            Value<int?> totalEpisodes = const Value.absent(),
            Value<String?> customFields = const Value.absent(),
            Value<String?> tags = const Value.absent(),
            Value<String?> category = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<DateTime?> startDate = const Value.absent(),
            Value<DateTime?> finishDate = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MediaItemsCompanion.insert(
            id: id,
            name: name,
            type: type,
            status: status,
            rating: rating,
            source: source,
            sourceId: sourceId,
            sourceUrl: sourceUrl,
            coverUrl: coverUrl,
            localCoverPath: localCoverPath,
            author: author,
            publisher: publisher,
            releaseDate: releaseDate,
            duration: duration,
            platforms: platforms,
            primaryPlatform: primaryPlatform,
            season: season,
            episode: episode,
            totalEpisodes: totalEpisodes,
            customFields: customFields,
            tags: tags,
            category: category,
            note: note,
            startDate: startDate,
            finishDate: finishDate,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MediaItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MediaItemsTable,
    MediaItemRow,
    $$MediaItemsTableFilterComposer,
    $$MediaItemsTableOrderingComposer,
    $$MediaItemsTableAnnotationComposer,
    $$MediaItemsTableCreateCompanionBuilder,
    $$MediaItemsTableUpdateCompanionBuilder,
    (
      MediaItemRow,
      BaseReferences<_$AppDatabase, $MediaItemsTable, MediaItemRow>
    ),
    MediaItemRow,
    PrefetchHooks Function()>;
typedef $$CustomFieldsTableCreateCompanionBuilder = CustomFieldsCompanion
    Function({
  Value<int> id,
  required String entityType,
  required String entityId,
  required String fieldKey,
  required String fieldName,
  required String fieldType,
  Value<String?> fieldValue,
});
typedef $$CustomFieldsTableUpdateCompanionBuilder = CustomFieldsCompanion
    Function({
  Value<int> id,
  Value<String> entityType,
  Value<String> entityId,
  Value<String> fieldKey,
  Value<String> fieldName,
  Value<String> fieldType,
  Value<String?> fieldValue,
});

class $$CustomFieldsTableFilterComposer
    extends Composer<_$AppDatabase, $CustomFieldsTable> {
  $$CustomFieldsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get entityId => $composableBuilder(
      column: $table.entityId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fieldKey => $composableBuilder(
      column: $table.fieldKey, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fieldName => $composableBuilder(
      column: $table.fieldName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fieldType => $composableBuilder(
      column: $table.fieldType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fieldValue => $composableBuilder(
      column: $table.fieldValue, builder: (column) => ColumnFilters(column));
}

class $$CustomFieldsTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomFieldsTable> {
  $$CustomFieldsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get entityId => $composableBuilder(
      column: $table.entityId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fieldKey => $composableBuilder(
      column: $table.fieldKey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fieldName => $composableBuilder(
      column: $table.fieldName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fieldType => $composableBuilder(
      column: $table.fieldType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fieldValue => $composableBuilder(
      column: $table.fieldValue, builder: (column) => ColumnOrderings(column));
}

class $$CustomFieldsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomFieldsTable> {
  $$CustomFieldsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => column);

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get fieldKey =>
      $composableBuilder(column: $table.fieldKey, builder: (column) => column);

  GeneratedColumn<String> get fieldName =>
      $composableBuilder(column: $table.fieldName, builder: (column) => column);

  GeneratedColumn<String> get fieldType =>
      $composableBuilder(column: $table.fieldType, builder: (column) => column);

  GeneratedColumn<String> get fieldValue => $composableBuilder(
      column: $table.fieldValue, builder: (column) => column);
}

class $$CustomFieldsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CustomFieldsTable,
    CustomField,
    $$CustomFieldsTableFilterComposer,
    $$CustomFieldsTableOrderingComposer,
    $$CustomFieldsTableAnnotationComposer,
    $$CustomFieldsTableCreateCompanionBuilder,
    $$CustomFieldsTableUpdateCompanionBuilder,
    (
      CustomField,
      BaseReferences<_$AppDatabase, $CustomFieldsTable, CustomField>
    ),
    CustomField,
    PrefetchHooks Function()> {
  $$CustomFieldsTableTableManager(_$AppDatabase db, $CustomFieldsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomFieldsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomFieldsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomFieldsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> entityType = const Value.absent(),
            Value<String> entityId = const Value.absent(),
            Value<String> fieldKey = const Value.absent(),
            Value<String> fieldName = const Value.absent(),
            Value<String> fieldType = const Value.absent(),
            Value<String?> fieldValue = const Value.absent(),
          }) =>
              CustomFieldsCompanion(
            id: id,
            entityType: entityType,
            entityId: entityId,
            fieldKey: fieldKey,
            fieldName: fieldName,
            fieldType: fieldType,
            fieldValue: fieldValue,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String entityType,
            required String entityId,
            required String fieldKey,
            required String fieldName,
            required String fieldType,
            Value<String?> fieldValue = const Value.absent(),
          }) =>
              CustomFieldsCompanion.insert(
            id: id,
            entityType: entityType,
            entityId: entityId,
            fieldKey: fieldKey,
            fieldName: fieldName,
            fieldType: fieldType,
            fieldValue: fieldValue,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CustomFieldsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CustomFieldsTable,
    CustomField,
    $$CustomFieldsTableFilterComposer,
    $$CustomFieldsTableOrderingComposer,
    $$CustomFieldsTableAnnotationComposer,
    $$CustomFieldsTableCreateCompanionBuilder,
    $$CustomFieldsTableUpdateCompanionBuilder,
    (
      CustomField,
      BaseReferences<_$AppDatabase, $CustomFieldsTable, CustomField>
    ),
    CustomField,
    PrefetchHooks Function()>;
typedef $$TagsTableCreateCompanionBuilder = TagsCompanion Function({
  Value<int> id,
  required String name,
  Value<String> color,
});
typedef $$TagsTableUpdateCompanionBuilder = TagsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> color,
});

class $$TagsTableFilterComposer extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnFilters(column));
}

class $$TagsTableOrderingComposer extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnOrderings(column));
}

class $$TagsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);
}

class $$TagsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TagsTable,
    Tag,
    $$TagsTableFilterComposer,
    $$TagsTableOrderingComposer,
    $$TagsTableAnnotationComposer,
    $$TagsTableCreateCompanionBuilder,
    $$TagsTableUpdateCompanionBuilder,
    (Tag, BaseReferences<_$AppDatabase, $TagsTable, Tag>),
    Tag,
    PrefetchHooks Function()> {
  $$TagsTableTableManager(_$AppDatabase db, $TagsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> color = const Value.absent(),
          }) =>
              TagsCompanion(
            id: id,
            name: name,
            color: color,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String> color = const Value.absent(),
          }) =>
              TagsCompanion.insert(
            id: id,
            name: name,
            color: color,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TagsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TagsTable,
    Tag,
    $$TagsTableFilterComposer,
    $$TagsTableOrderingComposer,
    $$TagsTableAnnotationComposer,
    $$TagsTableCreateCompanionBuilder,
    $$TagsTableUpdateCompanionBuilder,
    (Tag, BaseReferences<_$AppDatabase, $TagsTable, Tag>),
    Tag,
    PrefetchHooks Function()>;
typedef $$EntityTagsTableCreateCompanionBuilder = EntityTagsCompanion Function({
  Value<int> id,
  required String entityType,
  required String entityId,
  required int tagId,
});
typedef $$EntityTagsTableUpdateCompanionBuilder = EntityTagsCompanion Function({
  Value<int> id,
  Value<String> entityType,
  Value<String> entityId,
  Value<int> tagId,
});

class $$EntityTagsTableFilterComposer
    extends Composer<_$AppDatabase, $EntityTagsTable> {
  $$EntityTagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get entityId => $composableBuilder(
      column: $table.entityId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get tagId => $composableBuilder(
      column: $table.tagId, builder: (column) => ColumnFilters(column));
}

class $$EntityTagsTableOrderingComposer
    extends Composer<_$AppDatabase, $EntityTagsTable> {
  $$EntityTagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get entityId => $composableBuilder(
      column: $table.entityId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get tagId => $composableBuilder(
      column: $table.tagId, builder: (column) => ColumnOrderings(column));
}

class $$EntityTagsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EntityTagsTable> {
  $$EntityTagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => column);

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<int> get tagId =>
      $composableBuilder(column: $table.tagId, builder: (column) => column);
}

class $$EntityTagsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $EntityTagsTable,
    EntityTag,
    $$EntityTagsTableFilterComposer,
    $$EntityTagsTableOrderingComposer,
    $$EntityTagsTableAnnotationComposer,
    $$EntityTagsTableCreateCompanionBuilder,
    $$EntityTagsTableUpdateCompanionBuilder,
    (EntityTag, BaseReferences<_$AppDatabase, $EntityTagsTable, EntityTag>),
    EntityTag,
    PrefetchHooks Function()> {
  $$EntityTagsTableTableManager(_$AppDatabase db, $EntityTagsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EntityTagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EntityTagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EntityTagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> entityType = const Value.absent(),
            Value<String> entityId = const Value.absent(),
            Value<int> tagId = const Value.absent(),
          }) =>
              EntityTagsCompanion(
            id: id,
            entityType: entityType,
            entityId: entityId,
            tagId: tagId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String entityType,
            required String entityId,
            required int tagId,
          }) =>
              EntityTagsCompanion.insert(
            id: id,
            entityType: entityType,
            entityId: entityId,
            tagId: tagId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$EntityTagsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $EntityTagsTable,
    EntityTag,
    $$EntityTagsTableFilterComposer,
    $$EntityTagsTableOrderingComposer,
    $$EntityTagsTableAnnotationComposer,
    $$EntityTagsTableCreateCompanionBuilder,
    $$EntityTagsTableUpdateCompanionBuilder,
    (EntityTag, BaseReferences<_$AppDatabase, $EntityTagsTable, EntityTag>),
    EntityTag,
    PrefetchHooks Function()>;
typedef $$CustomStatusesTableCreateCompanionBuilder = CustomStatusesCompanion
    Function({
  Value<int> id,
  required String entityType,
  required String statusKey,
  required String statusLabel,
  Value<String> color,
});
typedef $$CustomStatusesTableUpdateCompanionBuilder = CustomStatusesCompanion
    Function({
  Value<int> id,
  Value<String> entityType,
  Value<String> statusKey,
  Value<String> statusLabel,
  Value<String> color,
});

class $$CustomStatusesTableFilterComposer
    extends Composer<_$AppDatabase, $CustomStatusesTable> {
  $$CustomStatusesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get statusKey => $composableBuilder(
      column: $table.statusKey, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get statusLabel => $composableBuilder(
      column: $table.statusLabel, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnFilters(column));
}

class $$CustomStatusesTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomStatusesTable> {
  $$CustomStatusesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get statusKey => $composableBuilder(
      column: $table.statusKey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get statusLabel => $composableBuilder(
      column: $table.statusLabel, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnOrderings(column));
}

class $$CustomStatusesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomStatusesTable> {
  $$CustomStatusesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => column);

  GeneratedColumn<String> get statusKey =>
      $composableBuilder(column: $table.statusKey, builder: (column) => column);

  GeneratedColumn<String> get statusLabel => $composableBuilder(
      column: $table.statusLabel, builder: (column) => column);

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);
}

class $$CustomStatusesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CustomStatusesTable,
    CustomStatus,
    $$CustomStatusesTableFilterComposer,
    $$CustomStatusesTableOrderingComposer,
    $$CustomStatusesTableAnnotationComposer,
    $$CustomStatusesTableCreateCompanionBuilder,
    $$CustomStatusesTableUpdateCompanionBuilder,
    (
      CustomStatus,
      BaseReferences<_$AppDatabase, $CustomStatusesTable, CustomStatus>
    ),
    CustomStatus,
    PrefetchHooks Function()> {
  $$CustomStatusesTableTableManager(
      _$AppDatabase db, $CustomStatusesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomStatusesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomStatusesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomStatusesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> entityType = const Value.absent(),
            Value<String> statusKey = const Value.absent(),
            Value<String> statusLabel = const Value.absent(),
            Value<String> color = const Value.absent(),
          }) =>
              CustomStatusesCompanion(
            id: id,
            entityType: entityType,
            statusKey: statusKey,
            statusLabel: statusLabel,
            color: color,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String entityType,
            required String statusKey,
            required String statusLabel,
            Value<String> color = const Value.absent(),
          }) =>
              CustomStatusesCompanion.insert(
            id: id,
            entityType: entityType,
            statusKey: statusKey,
            statusLabel: statusLabel,
            color: color,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CustomStatusesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CustomStatusesTable,
    CustomStatus,
    $$CustomStatusesTableFilterComposer,
    $$CustomStatusesTableOrderingComposer,
    $$CustomStatusesTableAnnotationComposer,
    $$CustomStatusesTableCreateCompanionBuilder,
    $$CustomStatusesTableUpdateCompanionBuilder,
    (
      CustomStatus,
      BaseReferences<_$AppDatabase, $CustomStatusesTable, CustomStatus>
    ),
    CustomStatus,
    PrefetchHooks Function()>;
typedef $$CustomCategoriesTableCreateCompanionBuilder
    = CustomCategoriesCompanion Function({
  Value<int> id,
  required String entityType,
  required String categoryKey,
  required String categoryLabel,
  Value<String?> icon,
});
typedef $$CustomCategoriesTableUpdateCompanionBuilder
    = CustomCategoriesCompanion Function({
  Value<int> id,
  Value<String> entityType,
  Value<String> categoryKey,
  Value<String> categoryLabel,
  Value<String?> icon,
});

class $$CustomCategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CustomCategoriesTable> {
  $$CustomCategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get categoryKey => $composableBuilder(
      column: $table.categoryKey, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get categoryLabel => $composableBuilder(
      column: $table.categoryLabel, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get icon => $composableBuilder(
      column: $table.icon, builder: (column) => ColumnFilters(column));
}

class $$CustomCategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomCategoriesTable> {
  $$CustomCategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get categoryKey => $composableBuilder(
      column: $table.categoryKey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get categoryLabel => $composableBuilder(
      column: $table.categoryLabel,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get icon => $composableBuilder(
      column: $table.icon, builder: (column) => ColumnOrderings(column));
}

class $$CustomCategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomCategoriesTable> {
  $$CustomCategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => column);

  GeneratedColumn<String> get categoryKey => $composableBuilder(
      column: $table.categoryKey, builder: (column) => column);

  GeneratedColumn<String> get categoryLabel => $composableBuilder(
      column: $table.categoryLabel, builder: (column) => column);

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);
}

class $$CustomCategoriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CustomCategoriesTable,
    CustomCategory,
    $$CustomCategoriesTableFilterComposer,
    $$CustomCategoriesTableOrderingComposer,
    $$CustomCategoriesTableAnnotationComposer,
    $$CustomCategoriesTableCreateCompanionBuilder,
    $$CustomCategoriesTableUpdateCompanionBuilder,
    (
      CustomCategory,
      BaseReferences<_$AppDatabase, $CustomCategoriesTable, CustomCategory>
    ),
    CustomCategory,
    PrefetchHooks Function()> {
  $$CustomCategoriesTableTableManager(
      _$AppDatabase db, $CustomCategoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomCategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomCategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomCategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> entityType = const Value.absent(),
            Value<String> categoryKey = const Value.absent(),
            Value<String> categoryLabel = const Value.absent(),
            Value<String?> icon = const Value.absent(),
          }) =>
              CustomCategoriesCompanion(
            id: id,
            entityType: entityType,
            categoryKey: categoryKey,
            categoryLabel: categoryLabel,
            icon: icon,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String entityType,
            required String categoryKey,
            required String categoryLabel,
            Value<String?> icon = const Value.absent(),
          }) =>
              CustomCategoriesCompanion.insert(
            id: id,
            entityType: entityType,
            categoryKey: categoryKey,
            categoryLabel: categoryLabel,
            icon: icon,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CustomCategoriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CustomCategoriesTable,
    CustomCategory,
    $$CustomCategoriesTableFilterComposer,
    $$CustomCategoriesTableOrderingComposer,
    $$CustomCategoriesTableAnnotationComposer,
    $$CustomCategoriesTableCreateCompanionBuilder,
    $$CustomCategoriesTableUpdateCompanionBuilder,
    (
      CustomCategory,
      BaseReferences<_$AppDatabase, $CustomCategoriesTable, CustomCategory>
    ),
    CustomCategory,
    PrefetchHooks Function()>;
typedef $$DisplayConfigsTableCreateCompanionBuilder = DisplayConfigsCompanion
    Function({
  Value<int> id,
  required String entityType,
  required String viewType,
  required String fields,
});
typedef $$DisplayConfigsTableUpdateCompanionBuilder = DisplayConfigsCompanion
    Function({
  Value<int> id,
  Value<String> entityType,
  Value<String> viewType,
  Value<String> fields,
});

class $$DisplayConfigsTableFilterComposer
    extends Composer<_$AppDatabase, $DisplayConfigsTable> {
  $$DisplayConfigsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get viewType => $composableBuilder(
      column: $table.viewType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fields => $composableBuilder(
      column: $table.fields, builder: (column) => ColumnFilters(column));
}

class $$DisplayConfigsTableOrderingComposer
    extends Composer<_$AppDatabase, $DisplayConfigsTable> {
  $$DisplayConfigsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get viewType => $composableBuilder(
      column: $table.viewType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fields => $composableBuilder(
      column: $table.fields, builder: (column) => ColumnOrderings(column));
}

class $$DisplayConfigsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DisplayConfigsTable> {
  $$DisplayConfigsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => column);

  GeneratedColumn<String> get viewType =>
      $composableBuilder(column: $table.viewType, builder: (column) => column);

  GeneratedColumn<String> get fields =>
      $composableBuilder(column: $table.fields, builder: (column) => column);
}

class $$DisplayConfigsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DisplayConfigsTable,
    DisplayConfig,
    $$DisplayConfigsTableFilterComposer,
    $$DisplayConfigsTableOrderingComposer,
    $$DisplayConfigsTableAnnotationComposer,
    $$DisplayConfigsTableCreateCompanionBuilder,
    $$DisplayConfigsTableUpdateCompanionBuilder,
    (
      DisplayConfig,
      BaseReferences<_$AppDatabase, $DisplayConfigsTable, DisplayConfig>
    ),
    DisplayConfig,
    PrefetchHooks Function()> {
  $$DisplayConfigsTableTableManager(
      _$AppDatabase db, $DisplayConfigsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DisplayConfigsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DisplayConfigsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DisplayConfigsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> entityType = const Value.absent(),
            Value<String> viewType = const Value.absent(),
            Value<String> fields = const Value.absent(),
          }) =>
              DisplayConfigsCompanion(
            id: id,
            entityType: entityType,
            viewType: viewType,
            fields: fields,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String entityType,
            required String viewType,
            required String fields,
          }) =>
              DisplayConfigsCompanion.insert(
            id: id,
            entityType: entityType,
            viewType: viewType,
            fields: fields,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DisplayConfigsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DisplayConfigsTable,
    DisplayConfig,
    $$DisplayConfigsTableFilterComposer,
    $$DisplayConfigsTableOrderingComposer,
    $$DisplayConfigsTableAnnotationComposer,
    $$DisplayConfigsTableCreateCompanionBuilder,
    $$DisplayConfigsTableUpdateCompanionBuilder,
    (
      DisplayConfig,
      BaseReferences<_$AppDatabase, $DisplayConfigsTable, DisplayConfig>
    ),
    DisplayConfig,
    PrefetchHooks Function()>;
typedef $$AppSettingsTableCreateCompanionBuilder = AppSettingsCompanion
    Function({
  required String key,
  Value<String?> value,
  Value<int> rowid,
});
typedef $$AppSettingsTableUpdateCompanionBuilder = AppSettingsCompanion
    Function({
  Value<String> key,
  Value<String?> value,
  Value<int> rowid,
});

class $$AppSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$AppSettingsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AppSettingsTable,
    AppSetting,
    $$AppSettingsTableFilterComposer,
    $$AppSettingsTableOrderingComposer,
    $$AppSettingsTableAnnotationComposer,
    $$AppSettingsTableCreateCompanionBuilder,
    $$AppSettingsTableUpdateCompanionBuilder,
    (AppSetting, BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>),
    AppSetting,
    PrefetchHooks Function()> {
  $$AppSettingsTableTableManager(_$AppDatabase db, $AppSettingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> key = const Value.absent(),
            Value<String?> value = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AppSettingsCompanion(
            key: key,
            value: value,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String key,
            Value<String?> value = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AppSettingsCompanion.insert(
            key: key,
            value: value,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AppSettingsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AppSettingsTable,
    AppSetting,
    $$AppSettingsTableFilterComposer,
    $$AppSettingsTableOrderingComposer,
    $$AppSettingsTableAnnotationComposer,
    $$AppSettingsTableCreateCompanionBuilder,
    $$AppSettingsTableUpdateCompanionBuilder,
    (AppSetting, BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>),
    AppSetting,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AssetsTableTableManager get assets =>
      $$AssetsTableTableManager(_db, _db.assets);
  $$MediaItemsTableTableManager get mediaItems =>
      $$MediaItemsTableTableManager(_db, _db.mediaItems);
  $$CustomFieldsTableTableManager get customFields =>
      $$CustomFieldsTableTableManager(_db, _db.customFields);
  $$TagsTableTableManager get tags => $$TagsTableTableManager(_db, _db.tags);
  $$EntityTagsTableTableManager get entityTags =>
      $$EntityTagsTableTableManager(_db, _db.entityTags);
  $$CustomStatusesTableTableManager get customStatuses =>
      $$CustomStatusesTableTableManager(_db, _db.customStatuses);
  $$CustomCategoriesTableTableManager get customCategories =>
      $$CustomCategoriesTableTableManager(_db, _db.customCategories);
  $$DisplayConfigsTableTableManager get displayConfigs =>
      $$DisplayConfigsTableTableManager(_db, _db.displayConfigs);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
}
