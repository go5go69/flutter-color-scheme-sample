# flutter_color_scheme_sample

This is a Flutter Web application that demonstrates the use of `ColorScheme` with Material 3, allowing users to:

- View how different `ColorScheme` properties are applied to common widgets
- Interactively change color values via a settings page
- Trigger UI overlays like Dialogs, SnackBars, and BottomSheets

## 🌐 Live Demo

Access the deployed app here:  
👉 [https://flutter-color-scheme-sample.web.app](https://flutter-color-scheme-sample.web.app)

## 🔧 Features

### ✅ Home Page
#### Widget Tab
- Visualizes how `ColorScheme` roles apply to `ElevatedButton`, `OutlinedButton`, `Switch`, `Checkbox`, `Slider`, etc.

#### ✅ Code Tab
- Shows the current `ColorScheme` in a labeled swatch format

### ✅ Overlay Page
- Demonstrates usage of `SnackBar`, `BottomSheet`, and `Dialog` with `FilledButton`

### ✅ Settings Page
- Allows users to edit individual `ColorScheme` properties using color pickers
- Immediate visual feedback across the app


## 🚀 Getting Started

### Prerequisites

- [Flutter](https://docs.flutter.dev/get-started/install) with [FVM](https://fvm.app/)

### Install dependencies

```
fvm flutter pub get
```

## 💻 Run Locally

```
fvm flutter run -d chrome
```

## 📁 Project Structure

```
lib/
├── main.dart
├── theme/
│   └── color_scheme_provider.dart
├── presentation/
│   ├── pages/
│   │   ├── home_page.dart
│   │   ├── dialog_snack_sheet_page.dart
│   │   └── setting_page.dart
│   ├── tab_content/
│   │   ├── code_tab.dart
│   │   └── widget_tab.dart
│   └── widgets/
│       ├── color_scheme_swatch.dart
│       ├── section_card.dart
└── root.dart
```

# flutter_color_scheme_sample（日本語）

このアプリは Flutter Web 上で ColorScheme（Material 3）の色指定が各ウィジェットにどのように反映されるかを視覚的に確認・変更できるデモアプリです。

## 🌐 デモサイト

デプロイ済みのアプリはこちらからアクセスできます：  
👉 [https://flutter-color-scheme-sample.web.app](https://flutter-color-scheme-sample.web.app)

## 🔧 主な機能

### ✅ Home Page
#### Widget タブ
ElevatedButton や Switch, Slider など主要ウィジェットでの ColorScheme の反映箇所を確認できます

#### Code タブ
現在使用中の ColorScheme をスウォッチ形式で表示

### ✅ Overlay ページ
FilledButton により SnackBar / BottomSheet / Dialog を表示するサンプルを確認可能

### ✅ 設定ページ
各 ColorScheme プロパティをカラーピッカーで自由に変更

アプリ全体に即時反映され、視覚的に確認できます

## 🚀 セットアップ手順 

- [Flutter](https://docs.flutter.dev/get-started/install) + [FVM](https://fvm.app/) の導入

### 依存関係のインストール

```
fvm flutter pub get
```

## 💻 ローカルでの実行

```
fvm flutter run -d chrome
```

## 📁 ディレクトリ構成

```
lib/
├── main.dart
├── theme/
│   └── color_scheme_provider.dart
├── presentation/
│   ├── pages/
│   │   ├── home_page.dart
│   │   ├── dialog_snack_sheet_page.dart
│   │   └── setting_page.dart
│   ├── tab_content/
│   │   ├── code_tab.dart
│   │   └── widget_tab.dart
│   └── widgets/
│       ├── color_scheme_swatch.dart
│       ├── section_card.dart
└── root.dart
```
