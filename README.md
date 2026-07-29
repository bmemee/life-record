# Life Record - 个人资产与娱乐记录应用

一款用于手机端的个人记录应用，帮助您追踪资产价值和娱乐消费。

## 功能特性

### 资产记录
- **4种资产类型**：物品资产、订阅会员、买断服务、消耗品
- **自动计算**：日均成本、月均成本
- **变现盈亏**：记录卖出价格，计算盈亏
- **回本进度**：基于目标日均成本查看回本百分比
- **智能提醒**：续费、免费试用到期

### 娱乐记录
- **7种类型**：书籍、小说、电影、电视、动漫、漫画、游戏
- **随机推荐**：不知道看什么时随机选一个
- **多平台游戏**：PC/PS/Xbox/Switch/手机
- **API 搜索**：TMDB（电影/电视/动漫）、IGDB（游戏）、Open Library（书籍）
- **手动添加**：找不到的作品可手动录入

### 数据管理
- **导出**：导出为 JSON 文件并分享
- **导入**：从 JSON 文件导入（不重复导入已存在记录）
- **统计图表**：资产分布饼图、娱乐记录柱状图

### 主题与自定义
- **主题切换**：亮色/暗色/跟随系统
- **主题色**：8种可选主色
- **自定义分类**：资产管理分类
- **自定义标签**：娱乐记录标签
- **自定义字段**：支持添加任意字段
- **自定义状态**：支持自定义资产/娱乐状态

## 技术栈

- **状态管理**：Riverpod
- **本地存储**：Drift (SQLite)
- **路由**：GoRouter
- **图表**：fl_chart
- **网络**：Dio
- **图片**：cached_network_image + image_picker
- **通知**：flutter_local_notifications
- **文件操作**：file_picker, path_provider, share_plus

## 项目结构

```
lib/
├── main.dart                          # 应用入口
├── models/                            # 数据模型
│   ├── asset.dart                     # 资产模型
│   └── media_item.dart                # 娱乐记录模型
├── database/
│   └── app_database.dart              # Drift 数据库
├── providers/                         # 状态管理
│   ├── app_providers.dart             # 全局状态
│   ├── asset_providers.dart           # 资产数据
│   ├── media_providers.dart           # 娱乐数据
│   └── custom_providers.dart          # 自定义管理
├── services/                          # 业务服务
│   ├── services.dart                  # 服务集合
│   ├── export_import_service.dart     # 导出导入
│   ├── api_search_service.dart        # API 搜索
│   ├── image_service.dart             # 图片管理
│   └── notification_service.dart      # 通知提醒
├── theme/
│   └── app_theme.dart                 # 主题配置
├── router/
│   └── app_router.dart                # 路由配置
└── pages/                             # 页面
    ├── home_page.dart                 # 主页（底部导航）
    ├── assets/
    │   └── assets_list_page.dart      # 资产模块
    ├── media/
    │   └── media_list_page.dart       # 娱乐模块
    ├── stats/
    │   └── stats_page.dart            # 统计页
    └── settings/
        └── settings_page.dart         # 设置页
```

## 数据库表

- `assets`：资产记录
- `media_items`：娱乐记录
- `custom_fields`：自定义字段
- `tags`：标签
- `entity_tags`：实体-标签关联
- `custom_statuses`：自定义状态
- `custom_categories`：自定义分类
- `display_configs`：显示配置
- `app_settings`：应用设置

## 开发环境

- Flutter 3.41+
- Dart 3.0+

## 开始使用

```bash
# 安装依赖
flutter pub get

# 运行应用
flutter run -d chrome         # Web 端
flutter run -d <device_id>    # 设备端

# 构建
flutter build apk             # Android APK
flutter build ios             # iOS
```

## API 配置

应用需要以下 API 凭证（可选，用于搜索外部数据）：

- **TMDB API Key**：搜索电影、电视、动漫
  - 申请地址：https://www.themoviedb.org/settings/api
- **IGDB Client ID + Secret**：搜索游戏
  - 申请地址：https://api.igdb.com/

在「设置 → API 配置」中配置。

## License

MIT