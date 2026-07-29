/// 外部 API 搜索服务
library;

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/media_item.dart';
import 'settings_service.dart';

class ApiSearchResult {
  final String name;
  final String? author;
  final String? coverUrl;
  final String? description;
  final DateTime? releaseDate;
  final String? sourceId;
  final String? sourceUrl;
  final List<String> platforms;
  final int? totalEpisodes;
  final int? duration;
  final int? rating;

  ApiSearchResult({
    required this.name,
    this.author,
    this.coverUrl,
    this.description,
    this.releaseDate,
    this.sourceId,
    this.sourceUrl,
    this.platforms = const [],
    this.totalEpisodes,
    this.duration,
    this.rating,
  });

  MediaItem toMediaItem(MediaType type, MediaSource source) {
    return MediaItem(
      name: name,
      type: type,
      source: source,
      sourceId: sourceId,
      sourceUrl: sourceUrl,
      coverUrl: coverUrl,
      author: author,
      releaseDate: releaseDate,
      platforms: platforms,
      totalEpisodes: totalEpisodes,
      duration: duration,
      rating: rating,
    );
  }
}

final apiSearchServiceProvider = Provider<ApiSearchService>((ref) {
  return ApiSearchService(ref);
});

class ApiSearchService {
  final Ref _ref;
  final Dio _dio;

  ApiSearchService(this._ref) : _dio = Dio();

  /// 根据类型搜索
  Future<List<ApiSearchResult>> search(MediaType type, String query) async {
    final settings = _ref.read(settingsServiceProvider);
    final tmdbKey = await settings.getTmdbApiKey() ?? '';
    final igdbClientId = await settings.getIgdbClientId() ?? '';
    final igdbClientSecret = await settings.getIgdbClientSecret() ?? '';

    switch (type) {
      case MediaType.book:
      case MediaType.novel:
        return searchOpenLibrary(query);
      case MediaType.movie:
      case MediaType.tv:
      case MediaType.anime:
        return searchTmdb(type, query, tmdbKey);
      case MediaType.manga:
        return searchOpenLibraryManga(query);
      case MediaType.game:
        return searchIgdb(query, igdbClientId, igdbClientSecret);
    }
  }

  /// Open Library 搜索（书籍/小说）
  Future<List<ApiSearchResult>> searchOpenLibrary(String query) async {
    try {
      final response = await _dio.get(
        'https://openlibrary.org/search.json',
        queryParameters: {
          'q': query,
          'limit': 20,
        },
      );

      final docs = response.data['docs'] as List<dynamic>;
      return docs.map((doc) => ApiSearchResult(
        name: doc['title'] ?? '未知',
        author: (doc['author_name'] as List<dynamic>?)?.firstOrNull,
        coverUrl: doc['cover_i'] != null
            ? 'https://covers.openlibrary.org/b/id/${doc['cover_i']}-M.jpg'
            : null,
        sourceId: doc['key']?.toString(),
        sourceUrl: doc['key'] != null
            ? 'https://openlibrary.org${doc['key']}'
            : null,
        releaseDate: doc['first_publish_year'] != null
            ? DateTime.tryParse('${doc['first_publish_year']}-01-01')
            : null,
        rating: doc['ratings_average'] != null
            ? ((doc['ratings_average'] as num) / 2).round()
            : null,
      )).toList();
    } catch (e) {
      return [];
    }
  }

  /// Open Library 搜索漫画
  Future<List<ApiSearchResult>> searchOpenLibraryManga(String query) async {
    return searchOpenLibrary('$query manga');
  }

  /// TMDB 搜索（电影/电视/动漫）
  Future<List<ApiSearchResult>> searchTmdb(MediaType type, String query, String apiKey) async {
    if (apiKey.isEmpty) {
      return _searchTmdbMock(type, query);
    }

    try {
      String endpoint;
      switch (type) {
        case MediaType.movie:
          endpoint = 'search/movie';
          break;
        case MediaType.tv:
          endpoint = 'search/tv';
          break;
        case MediaType.anime:
          endpoint = 'search/tv';
          break;
        default:
          endpoint = 'search/movie';
      }

      final response = await _dio.get(
        'https://api.themoviedb.org/3/$endpoint',
        queryParameters: {
          'api_key': apiKey,
          'query': query,
          'language': 'zh-CN',
        },
      );

      final results = response.data['results'] as List<dynamic>;
      return results.map((item) {
        final isMovie = type == MediaType.movie;
        return ApiSearchResult(
          name: isMovie ? item['title'] : item['name'],
          coverUrl: item['poster_path'] != null
              ? 'https://image.tmdb.org/t/p/w300${item['poster_path']}'
              : null,
          description: item['overview'],
          sourceId: item['id']?.toString(),
          sourceUrl: isMovie
              ? 'https://www.themoviedb.org/movie/${item['id']}'
              : 'https://www.themoviedb.org/tv/${item['id']}',
          releaseDate: DateTime.tryParse(
            isMovie ? item['release_date'] : item['first_air_date'],
          ),
          rating: item['vote_average'] != null
              ? ((item['vote_average'] as num) / 2).round()
              : null,
        );
      }).toList();
    } catch (e) {
      return [];
    }
  }

  /// TMDB 模拟数据（无 API key 时使用）
  Future<List<ApiSearchResult>> _searchTmdbMock(MediaType type, String query) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      ApiSearchResult(
        name: '$query (搜索示例)',
        author: '未知',
        coverUrl: null,
        description: '请配置 TMDB API Key 以获取真实数据',
        sourceId: 'mock_$query',
        sourceUrl: null,
        rating: 4,
      ),
    ];
  }

  /// IGDB 搜索（游戏）
  Future<List<ApiSearchResult>> searchIgdb(String query, String clientId, String clientSecret) async {
    if (clientId.isEmpty || clientSecret.isEmpty) {
      return _searchIgdbMock(query);
    }

    try {
      // 先获取访问令牌
      final tokenResponse = await _dio.post(
        'https://id.twitch.tv/oauth2/token',
        queryParameters: {
          'client_id': clientId,
          'client_secret': clientSecret,
          'grant_type': 'client_credentials',
        },
      );

      final accessToken = tokenResponse.data['access_token'];

      // 搜索游戏
      final response = await _dio.post(
        'https://api.igdb.com/v4/games',
        options: Options(
          headers: {
            'Client-ID': clientId,
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'text/plain',
          },
        ),
        data: '''
          search "$query";
          fields name, cover.url, first_release_date, total_rating, platforms.name, summary;
          limit 20;
        ''',
      );

      final games = response.data as List<dynamic>;
      return games.map((game) => ApiSearchResult(
        name: game['name'] ?? '未知',
        coverUrl: game['cover'] != null
            ? 'https:${game['cover']['url']?.replaceFirst('t_thumb', 't_cover_big')}'
            : null,
        description: game['summary'],
        sourceId: game['id']?.toString(),
        sourceUrl: 'https://www.igdb.com/games/${game['slug']}',
        releaseDate: game['first_release_date'] != null
            ? DateTime.fromMillisecondsSinceEpoch(game['first_release_date'] * 1000)
            : null,
        rating: game['total_rating'] != null
            ? ((game['total_rating'] as num) / 20).round()
            : null,
        platforms: (game['platforms'] as List<dynamic>?)
            ?.map((p) => p['name'] as String)
            .toList() ?? [],
      )).toList();
    } catch (e) {
      return [];
    }
  }

  /// IGDB 模拟数据
  Future<List<ApiSearchResult>> _searchIgdbMock(String query) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      ApiSearchResult(
        name: '$query (搜索示例)',
        author: '游戏工作室',
        coverUrl: null,
        description: '请配置 IGDB API Key 以获取真实数据',
        sourceId: 'mock_$query',
        sourceUrl: null,
        platforms: ['PC', 'PS5'],
        rating: 4,
      ),
    ];
  }
}

extension _ListExtension<T> on List<T> {
  T? get firstOrNull => isEmpty ? null : first;
}