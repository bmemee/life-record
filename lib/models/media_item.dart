/// 娱乐记录数据模型
library;

import 'package:uuid/uuid.dart';

/// 娱乐类型
enum MediaType {
  book('书籍'),
  novel('小说'),
  movie('电影'),
  tv('电视'),
  anime('动漫'),
  manga('漫画'),
  game('游戏');

  final String label;
  const MediaType(this.label);
}

/// 娱乐状态
enum MediaStatus {
  wantToRead('想看'),
  reading('在看'),
  completed('看过'),
  dropped('弃坑'),
  pending('待定');

  final String label;
  const MediaStatus(this.label);
}

/// 数据来源
enum MediaSource {
  manual('手动录入'),
  douban('豆瓣'),
  weRead('微信读书'),
  tmdb('TMDB'),
  igdb('IGDB'),
  openLibrary('Open Library');

  final String label;
  const MediaSource(this.label);
}

/// 娱乐记录实体
class MediaItem {
  final String id;
  final String name;
  final MediaType type;
  final MediaStatus status;
  
  // 评分（1-5）
  final int? rating;
  
  // 来源信息
  final MediaSource source;
  final String? sourceId;
  final String? sourceUrl;
  
  // 图片
  final String? coverUrl;
  final String? localCoverPath;
  
  // 详细信息
  final String? author;
  final String? publisher;
  final DateTime? releaseDate;
  final int? duration; // 游戏时长(小时) / 书籍页数 / 电影时长(分钟)
  
  // 游戏专用 - 多平台
  final List<String> platforms;
  final String? primaryPlatform;
  
  // 电视/动漫专用 - 季数和集数
  final int? season;
  final int? episode;
  final int? totalEpisodes;
  
  // 自定义字段
  final Map<String, dynamic> customFields;
  
  // 标签
  final List<String> tags;
  
  // 分类（用户自定义）
  final String? category;
  
  // 其他
  final String? note;
  final DateTime? startDate; // 开始看的时间
  final DateTime? finishDate; // 看完的时间
  
  final DateTime createdAt;
  final DateTime updatedAt;

  MediaItem({
    String? id,
    required this.name,
    required this.type,
    this.status = MediaStatus.wantToRead,
    this.rating,
    this.source = MediaSource.manual,
    this.sourceId,
    this.sourceUrl,
    this.coverUrl,
    this.localCoverPath,
    this.author,
    this.publisher,
    this.releaseDate,
    this.duration,
    List<String>? platforms,
    this.primaryPlatform,
    this.season,
    this.episode,
    this.totalEpisodes,
    Map<String, dynamic>? customFields,
    List<String>? tags,
    this.category,
    this.note,
    this.startDate,
    this.finishDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : id = id ?? const Uuid().v4(),
        platforms = platforms ?? [],
        customFields = customFields ?? {},
        tags = tags ?? [],
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  /// 是否已完结
  bool get isFinished => status == MediaStatus.completed;
  
  /// 是否在看
  bool get isInProgress => status == MediaStatus.reading;

  /// 进度百分比（针对有集数的）
  double? get progressPercentage {
    if (totalEpisodes == null || episode == null) return null;
    if (totalEpisodes! == 0) return null;
    return episode! / totalEpisodes!;
  }

  /// 复制并更新
  MediaItem copyWith({
    String? name,
    MediaType? type,
    MediaStatus? status,
    int? rating,
    MediaSource? source,
    String? sourceId,
    String? sourceUrl,
    String? coverUrl,
    String? localCoverPath,
    String? author,
    String? publisher,
    DateTime? releaseDate,
    int? duration,
    List<String>? platforms,
    String? primaryPlatform,
    int? season,
    int? episode,
    int? totalEpisodes,
    Map<String, dynamic>? customFields,
    List<String>? tags,
    String? category,
    String? note,
    DateTime? startDate,
    DateTime? finishDate,
  }) {
    return MediaItem(
      id: id,
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
      platforms: platforms ?? List.from(this.platforms),
      primaryPlatform: primaryPlatform ?? this.primaryPlatform,
      season: season ?? this.season,
      episode: episode ?? this.episode,
      totalEpisodes: totalEpisodes ?? this.totalEpisodes,
      customFields: customFields ?? Map.from(this.customFields),
      tags: tags ?? List.from(this.tags),
      category: category ?? this.category,
      note: note ?? this.note,
      startDate: startDate ?? this.startDate,
      finishDate: finishDate ?? this.finishDate,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
    );
  }

  /// 转为 JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type.name,
      'status': status.name,
      'rating': rating,
      'source': source.name,
      'sourceId': sourceId,
      'sourceUrl': sourceUrl,
      'coverUrl': coverUrl,
      'localCoverPath': localCoverPath,
      'author': author,
      'publisher': publisher,
      'releaseDate': releaseDate?.toIso8601String(),
      'duration': duration,
      'platforms': platforms,
      'primaryPlatform': primaryPlatform,
      'season': season,
      'episode': episode,
      'totalEpisodes': totalEpisodes,
      'customFields': customFields,
      'tags': tags,
      'category': category,
      'note': note,
      'startDate': startDate?.toIso8601String(),
      'finishDate': finishDate?.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  /// 从 JSON 创建
  factory MediaItem.fromJson(Map<String, dynamic> json) {
    return MediaItem(
      id: json['id'] as String,
      name: json['name'] as String,
      type: MediaType.values.firstWhere((e) => e.name == json['type']),
      status: MediaStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => MediaStatus.wantToRead,
      ),
      rating: json['rating'] as int?,
      source: MediaSource.values.firstWhere(
        (e) => e.name == json['source'],
        orElse: () => MediaSource.manual,
      ),
      sourceId: json['sourceId'] as String?,
      sourceUrl: json['sourceUrl'] as String?,
      coverUrl: json['coverUrl'] as String?,
      localCoverPath: json['localCoverPath'] as String?,
      author: json['author'] as String?,
      publisher: json['publisher'] as String?,
      releaseDate: json['releaseDate'] != null
          ? DateTime.parse(json['releaseDate'] as String)
          : null,
      duration: json['duration'] as int?,
      platforms: (json['platforms'] as List<dynamic>?)?.cast<String>().toList(),
      primaryPlatform: json['primaryPlatform'] as String?,
      season: json['season'] as int?,
      episode: json['episode'] as int?,
      totalEpisodes: json['totalEpisodes'] as int?,
      customFields: Map<String, dynamic>.from(json['customFields'] as Map? ?? {}),
      tags: (json['tags'] as List<dynamic>?)?.cast<String>().toList() ?? [],
      category: json['category'] as String?,
      note: json['note'] as String?,
      startDate: json['startDate'] != null
          ? DateTime.parse(json['startDate'] as String)
          : null,
      finishDate: json['finishDate'] != null
          ? DateTime.parse(json['finishDate'] as String)
          : null,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }
}