import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';

import '../database/app_database.dart';
import '../models/asset.dart';
import 'app_providers.dart';

final assetRepositoryProvider = Provider<AssetRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return AssetRepository(db);
});

final assetsProvider = FutureProvider<List<Asset>>((ref) async {
  final repo = ref.watch(assetRepositoryProvider);
  return repo.getAllAssets();
});

final assetsByTypeProvider = FutureProvider.family<List<Asset>, AssetType>((ref, type) async {
  final repo = ref.watch(assetRepositoryProvider);
  return repo.getAssetsByType(type);
});

final totalAssetValueProvider = FutureProvider<double>((ref) async {
  final repo = ref.watch(assetRepositoryProvider);
  return repo.getTotalAssetValue();
});

final monthlySubscriptionCostProvider = FutureProvider<double>((ref) async {
  final repo = ref.watch(assetRepositoryProvider);
  return repo.getMonthlySubscriptionCost();
});

class AssetRepository {
  final AppDatabase _db;
  
  AssetRepository(this._db);
  
  Future<List<Asset>> getAllAssets() async {
    final rows = await (_db.select(_db.assets)
      ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])).get();
    return rows.map(_rowToAsset).toList();
  }
  
  Future<List<Asset>> getAssetsByType(AssetType type) async {
    final rows = await (_db.select(_db.assets)
      ..where((t) => t.type.equals(type.name))
      ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])).get();
    return rows.map(_rowToAsset).toList();
  }
  
  Future<List<Asset>> getAssetsByStatus(AssetStatus status) async {
    final rows = await (_db.select(_db.assets)
      ..where((t) => t.status.equals(status.name))
      ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])).get();
    return rows.map(_rowToAsset).toList();
  }
  
  Future<List<Asset>> searchAssets(String query) async {
    final rows = await (_db.select(_db.assets)
      ..where((t) => t.name.contains(query) | t.tags.contains(query))
      ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])).get();
    return rows.map(_rowToAsset).toList();
  }
  
  Future<Asset?> getAssetById(String id) async {
    final row = await (_db.select(_db.assets)..where((t) => t.id.equals(id))).getSingleOrNull();
    return row != null ? _rowToAsset(row) : null;
  }
  
  Future<void> insertAsset(Asset asset) async {
    await _db.into(_db.assets).insert(_assetToRow(asset));
  }
  
  Future<void> updateAsset(Asset asset) async {
    await _db.update(_db.assets)
      .replace(_assetToRow(asset));
  }
  
  Future<void> deleteAsset(String id) async {
    await _db.delete(_db.assets)..where((t) => t.id.equals(id));
  }
  
  Future<double> getTotalAssetValue() async {
    final rows = await (_db.select(_db.assets)
      ..where((t) => t.status.equals(AssetStatus.active.name))).get();
    return rows.fold<double>(0.0, (sum, row) => sum + (row.currentValue ?? row.purchasePrice));
  }
  
  Future<double> getMonthlySubscriptionCost() async {
    final rows = await (_db.select(_db.assets)
      ..where((t) => t.type.equals(AssetType.subscription.name))
      ..where((t) => t.status.equals(AssetStatus.active.name))).get();
    
    double total = 0.0;
    for (final row in rows) {
      final amount = row.billingAmount ?? 0;
      final cycle = BillingCycle.values.firstWhere(
        (c) => c.name == row.billingCycle,
        orElse: () => BillingCycle.monthly,
      );
      
      switch (cycle) {
        case BillingCycle.weekly:
          total += amount * 4.33;
          break;
        case BillingCycle.monthly:
          total += amount;
          break;
        case BillingCycle.yearly:
          total += amount / 12;
          break;
        case BillingCycle.oneTime:
        case BillingCycle.custom:
          break;
      }
    }
    return total;
  }
  
  Future<List<Asset>> getUpcomingRenewals(int days) async {
    final thresholdDate = DateTime.now().add(Duration(days: days));
    final rows = await (_db.select(_db.assets)
      ..where((t) => t.type.equals(AssetType.subscription.name))
      ..where((t) => t.nextRenewalDate.isNotNull())
      ..where((t) => t.nextRenewalDate.isSmallerOrEqualValue(thresholdDate))
      ..orderBy([(t) => OrderingTerm.asc(t.nextRenewalDate)])).get();
    return rows.map(_rowToAsset).toList();
  }
  
  Asset _rowToAsset(AssetRow row) {
    return Asset(
      id: row.id,
      name: row.name,
      type: AssetType.values.firstWhere((t) => t.name == row.type),
      subCategory: row.subCategory,
      icon: row.icon,
      images: row.images != null ? _parseJsonList(row.images!) : [],
      purchasePrice: row.purchasePrice,
      currentValue: row.currentValue,
      currency: row.currency,
      startDate: row.startDate,
      endDate: row.endDate,
      billingCycle: BillingCycle.values.firstWhere(
        (c) => c.name == row.billingCycle,
        orElse: () => BillingCycle.oneTime,
      ),
      billingAmount: row.billingAmount,
      nextRenewalDate: row.nextRenewalDate,
      autoRenew: row.autoRenew,
      trialEndDate: row.trialEndDate,
      totalUses: row.totalUses,
      usedCount: row.usedCount,
      status: AssetStatus.values.firstWhere(
        (s) => s.name == row.status,
        orElse: () => AssetStatus.active,
      ),
      sellPrice: row.sellPrice,
      sellDate: row.sellDate,
      customFields: row.customFields != null ? _parseJsonMap(row.customFields!) : {},
      tags: row.tags != null ? _parseJsonList(row.tags!) : [],
      note: row.note,
      reminderDays: row.reminderDays,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }
  
  AssetRow _assetToRow(Asset asset) {
    return AssetRow(
      id: asset.id,
      name: asset.name,
      type: asset.type.name,
      subCategory: asset.subCategory,
      icon: asset.icon,
      images: asset.images.isNotEmpty ? _toJsonString(asset.images) : null,
      purchasePrice: asset.purchasePrice,
      currentValue: asset.currentValue,
      currency: asset.currency,
      startDate: asset.startDate,
      endDate: asset.endDate,
      billingCycle: asset.billingCycle.name,
      billingAmount: asset.billingAmount,
      nextRenewalDate: asset.nextRenewalDate,
      autoRenew: asset.autoRenew,
      trialEndDate: asset.trialEndDate,
      totalUses: asset.totalUses,
      usedCount: asset.usedCount,
      status: asset.status.name,
      sellPrice: asset.sellPrice,
      sellDate: asset.sellDate,
      customFields: asset.customFields.isNotEmpty ? _toJsonString(asset.customFields) : null,
      tags: asset.tags.isNotEmpty ? _toJsonString(asset.tags) : null,
      note: asset.note,
      reminderDays: asset.reminderDays,
      createdAt: asset.createdAt,
      updatedAt: asset.updatedAt,
    );
  }
  
  List<String> _parseJsonList(String json) {
    try {
      return (const JsonDecoder().convert(json) as List<dynamic>).cast<String>();
    } catch (_) {
      return [];
    }
  }
  
  Map<String, dynamic> _parseJsonMap(String json) {
    try {
      return const JsonDecoder().convert(json) as Map<String, dynamic>;
    } catch (_) {
      return {};
    }
  }
  
  String _toJsonString(dynamic value) {
    return const JsonEncoder().convert(value);
  }
}