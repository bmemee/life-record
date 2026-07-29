/// 提醒页面
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/asset.dart';
import '../../providers/asset_providers.dart';
import '../../providers/app_providers.dart';
import '../../services/notification_service.dart';

class ReminderPage extends ConsumerWidget {
  const ReminderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final upcomingAssetsAsync = ref.watch(upcomingRenewalsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('提醒中心'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => _checkReminders(context, ref),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildReminderHeader(context),
          const SizedBox(height: 16),
          upcomingAssetsAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('加载失败: $e')),
            data: (assets) => assets.isEmpty
                ? _buildEmptyState(context)
                : _buildRemindersList(context, ref, assets),
          ),
        ],
      ),
    );
  }

  Widget _buildReminderHeader(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.notifications_active, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 8),
                Text('自动提醒', style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              '订阅续费和免费试用到期时自动提醒',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: [
                ActionChip(
                  avatar: const Icon(Icons.timer, size: 16),
                  label: const Text('提前 3 天'),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Icon(Icons.check_circle, size: 64, color: Colors.green),
            const SizedBox(height: 16),
            const Text(
              '暂无待提醒项目',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            const Text(
              '即将到期的订阅和试用会在这里显示',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRemindersList(BuildContext context, WidgetRef ref, List<Asset> assets) {
    final renewals = assets.where((a) => a.nextRenewalDate != null).toList();
    final trials = assets.where((a) => a.trialEndDate != null).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (renewals.isNotEmpty) ...[
          Text('续费提醒', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          ...renewals.map((asset) => _buildRenewalCard(context, asset)),
          const SizedBox(height: 16),
        ],
        if (trials.isNotEmpty) ...[
          Text('试用到期', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          ...trials.map((asset) => _buildTrialCard(context, asset)),
        ],
      ],
    );
  }

  Widget _buildRenewalCard(BuildContext context, Asset asset) {
    final daysUntil = asset.nextRenewalDate!.difference(DateTime.now()).inDays;
    final isUrgent = daysUntil <= 3;

    return Card(
      color: isUrgent ? Colors.red.shade50 : null,
      child: ListTile(
        leading: Icon(
          Icons.subscriptions,
          color: isUrgent ? Colors.red : Theme.of(context).colorScheme.primary,
        ),
        title: Text(asset.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('¥${(asset.billingAmount ?? 0).toStringAsFixed(2)}/${asset.billingCycle.label}'),
            Text(
              daysUntil <= 0 ? '已到期' : '$daysUntil 天后续费',
              style: TextStyle(color: isUrgent ? Colors.red : Colors.orange),
            ),
          ],
        ),
        trailing: Text(
          '${asset.nextRenewalDate!.month}/${asset.nextRenewalDate!.day}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildTrialCard(BuildContext context, Asset asset) {
    final daysUntil = asset.trialEndDate!.difference(DateTime.now()).inDays;
    final isUrgent = daysUntil <= 1;

    return Card(
      color: isUrgent ? Colors.orange.shade50 : null,
      child: ListTile(
        leading: Icon(
          Icons.timer,
          color: isUrgent ? Colors.orange : Theme.of(context).colorScheme.primary,
        ),
        title: Text(asset.name),
        subtitle: Text(
          daysUntil <= 0 ? '试用已结束' : '$daysUntil 天后试用结束',
          style: TextStyle(color: isUrgent ? Colors.orange : Colors.grey),
        ),
        trailing: Text(
          '${asset.trialEndDate!.month}/${asset.trialEndDate!.day}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Future<void> _checkReminders(BuildContext context, WidgetRef ref) async {
    try {
      final service = ref.read(notificationServiceProvider);
      final count = await service.checkUpcomingRenewals(ref);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(count > 0 ? '已发送 $count 条提醒' : '暂无待提醒项目')),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('检查失败: $e')),
        );
      }
    }
  }
}

// Provider for upcoming renewals
final upcomingRenewalsProvider = FutureProvider<List<Asset>>((ref) async {
  final repo = ref.watch(assetRepositoryProvider);
  return repo.getUpcomingRenewals(30);
});