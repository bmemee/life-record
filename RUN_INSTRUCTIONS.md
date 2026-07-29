# 运行说明

## Flutter SDK 已安装

Flutter SDK 已通过 Chocolatey 安装到 `C:\tools\flutter`（3.41.9 稳定版，约 1.71 GB）。

由于沙盒限制，无法移动到 D 盘。如需移动，请：
1. 以管理员身份打开 PowerShell
2. 执行：`Move-Item C:\tools\flutter D:\flutter -Force`
3. 修改系统环境变量 `PATH`，将 `C:\tools\flutter\bin` 改为 `D:\flutter\bin`

## 项目结构

```
d:\APPWork\life_record\
├── pubspec.yaml                # 项目依赖
├── analysis_options.yaml       # 代码规范
├── README.md                   # 项目说明
├── RUN_INSTRUCTIONS.md         # 运行说明（本文档）
└── lib/
    ├── main.dart               # 应用入口
    ├── models/                 # 数据模型
    │   ├── asset.dart          # 资产模型
    │   └── media_item.dart     # 娱乐记录模型
    ├── database/
    │   └── app_database.dart   # Drift 数据库
    ├── providers/              # Riverpod 状态管理
    │   ├── app_providers.dart
    │   ├── asset_providers.dart
    │   ├── media_providers.dart
    │   └── custom_providers.dart
    ├── services/               # 业务服务
    │   ├── services.dart
    │   ├── export_import_service.dart    # 导出导入
    │   ├── api_search_service.dart       # API 搜索
    │   ├── image_service.dart            # 图片管理
    │   └── notification_service.dart     # 通知提醒
    ├── theme/
    │   └── app_theme.dart      # 主题配置
    ├── router/
    │   └── app_router.dart     # 路由配置
    └── pages/                  # 页面
        ├── home_page.dart
        ├── assets/
        │   └── assets_list_page.dart
        ├── media/
        │   └── media_list_page.dart
        ├── stats/
        │   └── stats_page.dart
        └── settings/
            └── settings_page.dart
```

## 运行步骤

### 1. 打开新的 PowerShell 窗口

新窗口会加载更新后的 PATH 环境变量（已添加 `C:\tools\flutter\bin`）。

### 2. 验证 Flutter 安装

```powershell
flutter --version
flutter doctor
```

### 3. 进入项目目录

```powershell
cd d:\APPWork\life_record
```

### 4. 安装依赖

```powershell
flutter pub get
```

### 5. 运行代码生成（Drift 数据库）

```powershell
dart run build_runner build
```

### 6. 运行应用

**Web 端（推荐用于测试）：**
```powershell
flutter run -d chrome
```

**Android 设备/模拟器：**
```powershell
flutter run
```

**iOS 模拟器（需 macOS）：**
```powershell
flutter run -d <device_id>
```

**查看可用设备：**
```powershell
flutter devices
```

## 已实现的功能

### 1. 资产记录
- 4种资产类型：物品资产、订阅会员、买断服务、消耗品
- 完整的添加/编辑/删除流程
- 自动计算：日均成本、月均成本
- 变现盈亏分析
- 订阅周期管理（周/月/年/一次性/自定义）
- 续费提醒设置
- 免费试用追踪
- 自定义分类
- 筛选功能（按类型/状态）

### 2. 娱乐记录
- 7种类型：书籍、小说、电影、电视、动漫、漫画、游戏
- 完整的添加/编辑/删除流程
- **API 搜索**：TMDB（电影/电视/动漫）、IGDB（游戏）、Open Library（书籍）
- 搜索结果一键添加
- 评分系统（1-5 星）
- 状态管理（想看/在看/看过/弃坑/待定）
- **多平台游戏**支持
- 开始/完成日期记录
- 外部链接保存
- **随机推荐**（按类型筛选或全类型随机）

### 3. 数据管理
- **导出**：导出全部数据为 JSON 文件并分享
- **导入**：从 JSON 文件导入（不重复导入已存在记录）
- **统计**：资产总览、分类占比饼图、娱乐类型柱状图

### 4. 主题与外观
- 亮色/暗色/跟随系统 三种模式
- 8种主题色可选
- 实时切换

### 5. 提醒功能
- 订阅续费提醒
- 免费试用到期提醒
- 提前天数可配置

### 6. API 配置
- TMDB API Key（用于搜索电影/电视/动漫）
- IGDB 凭证（用于搜索游戏）

## API Key 申请

### TMDB
1. 访问 https://www.themoviedb.org/signup 注册
2. 进入 https://www.themoviedb.org/settings/api 申请 API Key
3. 在应用「设置 → API 配置」中填入

### IGDB
1. 访问 https://api.igdb.com/signup 注册 Twitch 账号
2. 在 https://dev.twitch.tv/console/apps 创建应用
3. 获取 Client ID 和 Client Secret
4. 在应用「设置 → API 配置」中填入

## 构建发布版

```powershell
# Android APK
flutter build apk

# Android App Bundle
flutter build appbundle

# iOS
flutter build ios

# Web
flutter build web
```

## 项目特点

1. **完整的 CRUD**：所有数据支持增删改查
2. **本地优先**：所有数据存储在本地 SQLite，无需网络
3. **多类型支持**：资产4类 + 娱乐7类
4. **丰富的元数据**：评分、平台、状态、日期、备注等
5. **可视化统计**：饼图、柱状图
6. **智能提醒**：本地通知
7. **数据可携带**：JSON 导入导出
8. **完整的主题系统**：亮/暗 + 8种颜色

## 后续可扩展

- [ ] 标签系统（已建立数据库表，待UI）
- [ ] 自定义分类/状态/字段管理UI
- [ ] 豆瓣/微信读书数据导入
- [ ] 资产趋势图
- [ ] 折旧曲线
- [ ] 数据备份到云端
- [ ] 多设备同步

## 故障排查

### 命令找不到
关闭并重新打开 PowerShell，让 PATH 生效。

### pub get 失败
检查网络，可能需要配置代理：
```powershell
$env:PUB_HOSTED_URL="https://pub.flutter-io.cn"
$env:FLUTTER_STORAGE_BASE_URL="https://storage.flutter-io.cn"
flutter pub get
```

### Drift 代码生成失败
```powershell
flutter clean
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

### Android 构建失败
确保安装了 Android Studio 并配置了 SDK：
```powershell
flutter doctor --android-licenses
```

## 联系方式

项目位置：`d:\APPWork\life_record\`
Flutter SDK：`C:\tools\flutter\`
