import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';

import '../database/app_database.dart';
import 'app_providers.dart';

final tagRepositoryProvider = Provider<TagRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return TagRepository(db);
});

final allTagsProvider = FutureProvider<List<Tag>>((ref) async {
  final repo = ref.watch(tagRepositoryProvider);
  return repo.getAllTags();
});

final customStatusRepositoryProvider = Provider<CustomStatusRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return CustomStatusRepository(db);
});

final customCategoryRepositoryProvider = Provider<CustomCategoryRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return CustomCategoryRepository(db);
});

class TagRepository {
  final AppDatabase _db;
  
  TagRepository(this._db);
  
  Future<List<Tag>> getAllTags() async {
    return await _db.select(_db.tags).get();
  }
  
  Future<Tag?> getTagById(int id) async {
    return await (_db.select(_db.tags)..where((t) => t.id.equals(id))).getSingleOrNull();
  }
  
  Future<List<Tag>> getTagsByEntity(String entityType, String entityId) async {
    final entityTags = await (_db.select(_db.entityTags)
      ..where((t) => t.entityType.equals(entityType) & t.entityId.equals(entityId))).get();
    
    final tagIds = entityTags.map((et) => et.tagId).toList();
    if (tagIds.isEmpty) return [];
    
    return await (_db.select(_db.tags)..where((t) => t.id.isIn(tagIds))).get();
  }
  
  Future<int> insertTag(TagsCompanion tag) async {
    return await _db.into(_db.tags).insert(tag);
  }
  
  Future<void> updateTag(Tag tag) async {
    await _db.update(_db.tags)
      ..where((t) => t.id.equals(tag.id))
      ..write(
        TagsCompanion(
          name: Value(tag.name),
          color: Value(tag.color),
        ),
      );
  }
  
  Future<void> deleteTag(int id) async {
    await _db.delete(_db.entityTags)..where((t) => t.tagId.equals(id));
    await _db.delete(_db.tags)..where((t) => t.id.equals(id));
  }
  
  Future<void> addTagToEntity(String entityType, String entityId, int tagId) async {
    final exists = await (_db.select(_db.entityTags)
      ..where((t) => t.entityType.equals(entityType) 
        & t.entityId.equals(entityId) 
        & t.tagId.equals(tagId))).getSingleOrNull();
    
    if (exists == null) {
      await _db.into(_db.entityTags).insert(EntityTagsCompanion.insert(
        entityType: entityType,
        entityId: entityId,
        tagId: tagId,
      ));
    }
  }
  
  Future<void> removeTagFromEntity(String entityType, String entityId, int tagId) async {
    await _db.delete(_db.entityTags)
      ..where((t) => t.entityType.equals(entityType) 
        & t.entityId.equals(entityId) 
        & t.tagId.equals(tagId));
  }
}

class CustomStatusRepository {
  final AppDatabase _db;
  
  CustomStatusRepository(this._db);
  
  Future<List<CustomStatus>> getStatusesByType(String entityType) async {
    return await (_db.select(_db.customStatuses)
      ..where((t) => t.entityType.equals(entityType))).get();
  }
  
  Future<int> insertStatus(CustomStatusesCompanion status) async {
    return await _db.into(_db.customStatuses).insert(status);
  }
  
  Future<void> updateStatus(CustomStatus status) async {
    await _db.update(_db.customStatuses)
      ..where((t) => t.id.equals(status.id))
      ..write(
        CustomStatusesCompanion(
          statusKey: Value(status.statusKey),
          statusLabel: Value(status.statusLabel),
          color: Value(status.color),
        ),
      );
  }
  
  Future<void> deleteStatus(int id) async {
    await _db.delete(_db.customStatuses)..where((t) => t.id.equals(id));
  }
}

class CustomCategoryRepository {
  final AppDatabase _db;
  
  CustomCategoryRepository(this._db);
  
  Future<List<CustomCategory>> getCategoriesByType(String entityType) async {
    return await (_db.select(_db.customCategories)
      ..where((t) => t.entityType.equals(entityType))).get();
  }
  
  Future<int> insertCategory(CustomCategoriesCompanion category) async {
    return await _db.into(_db.customCategories).insert(category);
  }
  
  Future<void> updateCategory(CustomCategory category) async {
    await _db.update(_db.customCategories)
      ..where((t) => t.id.equals(category.id))
      ..write(
        CustomCategoriesCompanion(
          categoryKey: Value(category.categoryKey),
          categoryLabel: Value(category.categoryLabel),
          icon: Value(category.icon),
        ),
      );
  }
  
  Future<void> deleteCategory(int id) async {
    await _db.delete(_db.customCategories)..where((t) => t.id.equals(id));
  }
}