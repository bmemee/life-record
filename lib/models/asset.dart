/// 资产数据模型
library;

import 'package:uuid/uuid.dart';

/// 资产类型
enum AssetType {
  physicalItem('物品资产'),
  subscription('订阅会员'),
  oneTimePurchase('买断服务'),
  consumable('消耗品');

  final String label;
  const AssetType(this.label);
}

/// 资产状态
enum AssetStatus {
  active('服役中'),
  retired('已退役'),
  sold('已卖出'),
  discarded('已丢弃');

  final String label;
  const AssetStatus(this.label);
}

/// 计费周期
enum BillingCycle {
  oneTime('一次性'),
  weekly('周'),
  monthly('月'),
  yearly('年'),
  custom('自定义');

  final String label;
  const BillingCycle(this.label);
}

/// 资产实体
class Asset {
  final String id;
  final String name;
  final AssetType type;
  final String? subCategory;
  final String? icon;
  final List<String> images;
  
  // 价值
  final double purchasePrice;
  final double? currentValue;
  final String currency;
  
  // 时间
  final DateTime startDate;
  final DateTime? endDate;
  
  // 订阅专用
  final BillingCycle billingCycle;
  final double? billingAmount;
  final DateTime? nextRenewalDate;
  final bool autoRenew;
  final DateTime? trialEndDate;
  
  // 消耗品专用
  final int? totalUses;
  final int? usedCount;
  
  // 状态
  final AssetStatus status;
  
  // 变现记录
  final double? sellPrice;
  final DateTime? sellDate;
  
  // 自定义字段（键值对）
  final Map<String, dynamic> customFields;
  
  // 标签
  final List<String> tags;
  
  // 其他
  final String? note;
  final int reminderDays;
  
  final DateTime createdAt;
  final DateTime updatedAt;

  Asset({
    String? id,
    required this.name,
    required this.type,
    this.subCategory,
    this.icon,
    List<String>? images,
    required this.purchasePrice,
    this.currentValue,
    this.currency = 'CNY',
    required this.startDate,
    this.endDate,
    this.billingCycle = BillingCycle.oneTime,
    this.billingAmount,
    this.nextRenewalDate,
    this.autoRenew = false,
    this.trialEndDate,
    this.totalUses,
    this.usedCount,
    this.status = AssetStatus.active,
    this.sellPrice,
    this.sellDate,
    Map<String, dynamic>? customFields,
    List<String>? tags,
    this.note,
    this.reminderDays = 3,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : id = id ?? const Uuid().v4(),
        images = images ?? [],
        customFields = customFields ?? {},
        tags = tags ?? [],
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  /// 计费周期对应的天数（用于计算日均成本）
  int get _cycleDays {
    switch (billingCycle) {
      case BillingCycle.weekly:
        return 7;
      case BillingCycle.monthly:
        return 30;
      case BillingCycle.yearly:
        return 365;
      case BillingCycle.custom:
        if (endDate != null) {
          return endDate!.difference(startDate).inDays;
        }
        return 365;
      case BillingCycle.oneTime:
        // 一次性付费：如果有结束日期用实际天数，否则默认按365天估算
        if (endDate != null && endDate!.isAfter(startDate)) {
          return endDate!.difference(startDate).inDays;
        }
        // 没有结束日期的，按已用天数或默认1年
        return usedDays > 0 ? usedDays : 365;
    }
  }

  /// 计算已用天数
  int get usedDays {
    final end = endDate ?? DateTime.now();
    final days = end.difference(startDate).inDays;
    return days < 0 ? 0 : days;
  }

  /// 计算日均成本
  double get dailyCost {
    // 订阅类型：按 billingAmount ÷ 计费周期天数
    if (type == AssetType.subscription) {
      final amount = billingAmount ?? purchasePrice;
      if (amount == 0) return 0;
      return amount / _cycleDays;
    }

    // 其他类型：按总成本 ÷ 有效天数
    final netCost = purchasePrice - (sellPrice ?? 0);
    if (netCost == 0) return 0;

    final days = usedDays > 0 ? usedDays : _cycleDays;
    return netCost / days;
  }

  /// 计算月均成本
  double get monthlyCost => dailyCost * 30;

  /// 获取失效日期（订阅：下次续费前一天；其他：endDate）
  DateTime? get expiryDate {
    if (nextRenewalDate != null) {
      return nextRenewalDate!.subtract(const Duration(days: 1));
    }
    if (endDate != null) return endDate;
    // 订阅没有续费日期时，按 startDate + 一个计费周期推算
    if (type == AssetType.subscription && billingCycle != BillingCycle.oneTime) {
      return startDate.add(Duration(days: _cycleDays));
    }
    return null;
  }

  /// 计算变现盈亏
  double? get profitOrLoss {
    if (sellPrice == null) return null;
    return sellPrice! - purchasePrice;
  }

  /// 计算回本进度（基于目标日均成本）
  double getPaybackProgress(double targetDailyCost) {
    if (purchasePrice == 0) return 1.0;
    return (usedDays * targetDailyCost) / purchasePrice;
  }

  /// 是否已回本
  bool isPayback(double targetDailyCost) {
    return getPaybackProgress(targetDailyCost) >= 1.0;
  }

  /// 续费倒计时（天数）
  int? get renewalCountdown {
    if (nextRenewalDate == null) return null;
    return nextRenewalDate!.difference(DateTime.now()).inDays;
  }

  /// 复制并更新
  Asset copyWith({
    String? name,
    AssetType? type,
    String? subCategory,
    String? icon,
    List<String>? images,
    double? purchasePrice,
    double? currentValue,
    String? currency,
    DateTime? startDate,
    DateTime? endDate,
    BillingCycle? billingCycle,
    double? billingAmount,
    DateTime? nextRenewalDate,
    bool? autoRenew,
    DateTime? trialEndDate,
    int? totalUses,
    int? usedCount,
    AssetStatus? status,
    double? sellPrice,
    DateTime? sellDate,
    Map<String, dynamic>? customFields,
    List<String>? tags,
    String? note,
    int? reminderDays,
  }) {
    return Asset(
      id: id,
      name: name ?? this.name,
      type: type ?? this.type,
      subCategory: subCategory ?? this.subCategory,
      icon: icon ?? this.icon,
      images: images ?? List.from(this.images),
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
      customFields: customFields ?? Map.from(this.customFields),
      tags: tags ?? List.from(this.tags),
      note: note ?? this.note,
      reminderDays: reminderDays ?? this.reminderDays,
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
      'subCategory': subCategory,
      'icon': icon,
      'images': images,
      'purchasePrice': purchasePrice,
      'currentValue': currentValue,
      'currency': currency,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'billingCycle': billingCycle.name,
      'billingAmount': billingAmount,
      'nextRenewalDate': nextRenewalDate?.toIso8601String(),
      'autoRenew': autoRenew,
      'trialEndDate': trialEndDate?.toIso8601String(),
      'totalUses': totalUses,
      'usedCount': usedCount,
      'status': status.name,
      'sellPrice': sellPrice,
      'sellDate': sellDate?.toIso8601String(),
      'customFields': customFields,
      'tags': tags,
      'note': note,
      'reminderDays': reminderDays,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  /// 从 JSON 创建
  factory Asset.fromJson(Map<String, dynamic> json) {
    return Asset(
      id: json['id'] as String,
      name: json['name'] as String,
      type: AssetType.values.firstWhere((e) => e.name == json['type']),
      subCategory: json['subCategory'] as String?,
      icon: json['icon'] as String?,
      images: (json['images'] as List<dynamic>?)?.cast<String>().toList(),
      purchasePrice: (json['purchasePrice'] as num).toDouble(),
      currentValue: (json['currentValue'] as num?)?.toDouble(),
      currency: json['currency'] as String? ?? 'CNY',
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] != null ? DateTime.parse(json['endDate'] as String) : null,
      billingCycle: BillingCycle.values.firstWhere(
        (e) => e.name == json['billingCycle'],
        orElse: () => BillingCycle.oneTime,
      ),
      billingAmount: (json['billingAmount'] as num?)?.toDouble(),
      nextRenewalDate: json['nextRenewalDate'] != null
          ? DateTime.parse(json['nextRenewalDate'] as String)
          : null,
      autoRenew: json['autoRenew'] as bool? ?? false,
      trialEndDate: json['trialEndDate'] != null
          ? DateTime.parse(json['trialEndDate'] as String)
          : null,
      totalUses: json['totalUses'] as int?,
      usedCount: json['usedCount'] as int?,
      status: AssetStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => AssetStatus.active,
      ),
      sellPrice: (json['sellPrice'] as num?)?.toDouble(),
      sellDate: json['sellDate'] != null
          ? DateTime.parse(json['sellDate'] as String)
          : null,
      customFields: Map<String, dynamic>.from(json['customFields'] as Map? ?? {}),
      tags: (json['tags'] as List<dynamic>?)?.cast<String>().toList() ?? [],
      note: json['note'] as String?,
      reminderDays: json['reminderDays'] as int? ?? 3,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }
}