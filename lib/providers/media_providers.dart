import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';

import '../database/app_database.dart';
import '../models/media_item.dart';
import 'app_providers.dart';

final mediaRepositoryProvider = Provider<MediaRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return MediaRepository(db);
});

final mediaItemsProvider = FutureProvider<List<MediaItem>>((ref) async {
  final repo = ref.watch(mediaRepositoryProvider);
  return repo.getAllMediaItems();
});

final mediaItemsByTypeProvider = FutureProvider.family<List<MediaItem>, MediaType>((ref, type) async {
  final repo = ref.watch(mediaRepositoryProvider);
  return repo.getMediaItemsByType(type);
});

final mediaItemsByStatusProvider = FutureProvider.family<List<MediaItem>, MediaStatus>((ref, status) async {
  final repo = ref.watch(mediaRepositoryProvider);
  return repo.getMediaItemsByStatus(status);
});

final randomMediaItemProvider = FutureProvider.family<MediaItem?, ({MediaType? type, MediaStatus? status})>((ref, filter) async {
  final repo = ref.watch(mediaRepositoryProvider);
  return repo.getRandomMediaItem(filter.type, filter.status);
});

final mediaItemByIdProvider = FutureProvider.family<MediaItem?, String>((ref, id) async {
  final repo = ref.watch(mediaRepositoryProvider);
  return repo.getMediaItemById(id);
});

class MediaRepository {
  final AppDatabase _db;
  
  MediaRepository(this._db);
  
  Future<List<MediaItem>> getAllMediaItems() async {
    final rows = await (_db.select(_db.mediaItems)
      ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])).get();
    return rows.map(_rowToMediaItem).toList();
  }
  
  Future<List<MediaItem>> getMediaItemsByType(MediaType type) async {
    final rows = await (_db.select(_db.mediaItems)
      ..where((t) => t.type.equals(type.name))
      ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])).get();
    return rows.map(_rowToMediaItem).toList();
  }
  
  Future<List<MediaItem>> getMediaItemsByStatus(MediaStatus status) async {
    final rows = await (_db.select(_db.mediaItems)
      ..where((t) => t.status.equals(status.name))
      ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])).get();
    return rows.map(_rowToMediaItem).toList();
  }
  
  Future<List<MediaItem>> getMediaItemsByTypeAndStatus(MediaType type, MediaStatus status) async {
    final rows = await (_db.select(_db.mediaItems)
      ..where((t) => t.type.equals(type.name) & t.status.equals(status.name))
      ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])).get();
    return rows.map(_rowToMediaItem).toList();
  }
  
  Future<List<MediaItem>> searchMediaItems(String query) async {
    final rows = await (_db.select(_db.mediaItems)
      ..where((t) => t.name.contains(query) | t.tags.contains(query))
      ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])).get();
    return rows.map(_rowToMediaItem).toList();
  }
  
  Future<MediaItem?> getMediaItemById(String id) async {
    final row = await (_db.select(_db.mediaItems)..where((t) => t.id.equals(id))).getSingleOrNull();
    return row != null ? _rowToMediaItem(row) : null;
  }
  
  Future<void> insertMediaItem(MediaItem item) async {
    await _db.into(_db.mediaItems).insert(_mediaItemToRow(item));
  }
  
  Future<void> updateMediaItem(MediaItem item) async {
    await _db.update(_db.mediaItems)
      .replace(_mediaItemToRow(item));
  }
  
  Future<void> deleteMediaItem(String id) async {
    await _db.delete(_db.mediaItems)..where((t) => t.id.equals(id));
  }
  
  Future<MediaItem?> getRandomMediaItem(MediaType? type, MediaStatus? status) async {
    var query = _db.select(_db.mediaItems);
    
    if (type != null) {
      query = query..where((t) => t.type.equals(type.name));
    }
    if (status != null) {
      query = query..where((t) => t.status.equals(status.name));
    }
    
    final rows = await query.get();
    if (rows.isEmpty) return null;
    
    final randomIndex = DateTime.now().millisecondsSinceEpoch % rows.length;
    return _rowToMediaItem(rows[randomIndex]);
  }
  
  Future<int> getCountByType(MediaType type) async {
    final result = await (_db.selectOnly(_db.mediaItems)
      ..addColumns([_db.mediaItems.id.count()])
      ..where(_db.mediaItems.type.equals(type.name))).getSingle();
    return result.read(_db.mediaItems.id.count()) ?? 0;
  }
  
  Future<int> getCountByStatus(MediaStatus status) async {
    final result = await (_db.selectOnly(_db.mediaItems)
      ..addColumns([_db.mediaItems.id.count()])
      ..where(_db.mediaItems.status.equals(status.name))).getSingle();
    return result.read(_db.mediaItems.id.count()) ?? 0;
  }
  
  MediaItem _rowToMediaItem(MediaItemRow row) {
    return MediaItem(
      id: row.id,
      name: row.name,
      type: MediaType.values.firstWhere((t) => t.name == row.type),
      status: MediaStatus.values.firstWhere(
        (s) => s.name == row.status,
        orElse: () => MediaStatus.wantToRead,
      ),
      rating: row.rating,
      source: MediaSource.values.firstWhere(
        (s) => s.name == row.source,
        orElse: () => MediaSource.manual,
      ),
      sourceId: row.sourceId,
      sourceUrl: row.sourceUrl,
      coverUrl: row.coverUrl,
      localCoverPath: row.localCoverPath,
      author: row.author,
      publisher: row.publisher,
      releaseDate: row.releaseDate,
      duration: row.duration,
      platforms: row.platforms != null ? _parseJsonList(row.platforms!) : [],
      primaryPlatform: row.primaryPlatform,
      season: row.season,
      episode: row.episode,
      totalEpisodes: row.totalEpisodes,
      customFields: row.customFields != null ? _parseJsonMap(row.customFields!) : {},
      tags: row.tags != null ? _parseJsonList(row.tags!) : [],
      category: row.category,
      note: row.note,
      startDate: row.startDate,
      finishDate: row.finishDate,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }
  
  MediaItemRow _mediaItemToRow(MediaItem item) {
    return MediaItemRow(
      id: item.id,
      name: item.name,
      type: item.type.name,
      status: item.status.name,
      rating: item.rating,
      source: item.source.name,
      sourceId: item.sourceId,
      sourceUrl: item.sourceUrl,
      coverUrl: item.coverUrl,
      localCoverPath: item.localCoverPath,
      author: item.author,
      publisher: item.publisher,
      releaseDate: item.releaseDate,
      duration: item.duration,
      platforms: item.platforms.isNotEmpty ? _toJsonString(item.platforms) : null,
      primaryPlatform: item.primaryPlatform,
      season: item.season,
      episode: item.episode,
      totalEpisodes: item.totalEpisodes,
      customFields: item.customFields.isNotEmpty ? _toJsonString(item.customFields) : null,
      tags: item.tags.isNotEmpty ? _toJsonString(item.tags) : null,
      category: item.category,
      note: item.note,
      startDate: item.startDate,
      finishDate: item.finishDate,
      createdAt: item.createdAt,
      updatedAt: item.updatedAt,
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