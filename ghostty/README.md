# Ghostty Configuration

Ghostty ターミナルエミュレータの個人用設定ファイルです。
見た目のカスタマイズ（背景の透過やテーマ）と、便利なクイックターミナル機能を有効にしています。

## 📁 ディレクトリ構成

本リポジトリは、Ghostty の設定ファイルのみで構成されています。

```text
.
└── config  # Ghostty のメイン設定ファイル
```

## 🚀 インストール手順

### 1. Ghostty のインストール

Ghostty が未インストールの場合は、以下の手順でインストールしてください。

#### macOS (Homebrew)
```bash
brew install --cask ghostty
```

#### その他のOS
公式の [Ghostty ダウンロードページ](https://ghostty.org/download) を参照してください。

### 2. 設定ファイルの反映

本リポジトリの `config` ファイルを Ghostty の設定ディレクトリに配置します。

```bash
# 設定ディレクトリの作成（存在しない場合）
mkdir -p ~/.config/ghostty

# シンボリックリンクを貼る、またはコピーする
ln -s $(pwd)/config ~/.config/ghostty/config
```

すでに設定ファイルが存在する場合は、バックアップを取ることをお勧めします。

## 🛠 設定の概要

### 見た目 (Visuals)
- **フォント**: `JetBrainsMono Nerd Font` (サイズ: 12)
- **テーマ**: `Catppuccin Macchiato`
- **透過設定**: 不透明度 `0.7`、背景のぼかし `20`
- **カーソル**: ブロック形式、点滅有効

### クイックターミナル (Quick Terminal)
画面の右側にオーバーレイ表示されるターミナル機能です。
- **トグルのショートカット**: `Option + T`
- **表示位置**: 右側 (幅 40%)
- **アニメーション**: 有効 (0.2s)
- **自動非表示**: 有効 (フォーカスが外れると隠れます)

## ⌨️ キーバインド

| キー | アクション |
| :--- | :--- |
| `Option + T` | クイックターミナルの表示/非表示を切り替え (Global) |

---

Ghostty の詳細な設定オプションについては、`ghostty +list-configs` コマンドで確認できます。
