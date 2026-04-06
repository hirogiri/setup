# Neovim Configuration (hirogiri-setup)

`lazy.nvim` をプラグインマネージャーに採用した、Lua ベースのモダンな Neovim 設定です。
特にターミナル操作の効率化と、開発効率を重視した 2x2 レイアウトを特徴としています。

## 📁 ディレクトリ構成

```text
.
├── init.lua              # エントリポイント
├── lua/
│   ├── core/
│   │   ├── options.lua   # 基本オプション設定 (行番号、インデント等)
│   │   └── keymaps.lua   # 基本・カスタムキーバインド
│   ├── lsp/
│   │   └── init.lua      # LSP (nvim-lspconfig) の設定
│   └── plugins/
│       ├── init.lua      # lazy.nvim 本体とプラグインリスト
│       ├── neotree.lua   # ファイルツリー (Neo-tree)
│       ├── telescope.lua # 曖昧検索 (Telescope)
│       └── toggleterm.lua # ターミナル管理 (ToggleTerm)
└── lazy-lock.json        # プラグインのバージョンロック
```

## 🚀 セットアップ方法

### 1. 前提条件
- **Neovim (v0.9.0以上)**
- **GitHub CLI (gh)** もしくは **Git**
- **Nerd Fonts** (Neo-tree やステータスラインのアイコン表示に推奨)

### 2. インストール
既存の設定がある場合はバックアップを取ってから実行してください。

```bash
# 設定ディレクトリへ移動
cd ~/.config

# リポジトリをクローン
gh repo clone hirogiri/setup nvim
# または git clone git@github.com:hirogiri/setup.git nvim

# Neovim を起動（自動的にプラグインのインストールが始まります）
nvim
```

## ⌨️ 主要なキーバインド

### ターミナル操作 (2x2 Layout)
画面を分割してターミナルを常駐させるためのショートカットです。

- `<C-t>` : 下側にターミナルを分割起動
- `<C-S-t>` : 右側にターミナルを分割起動
- `<Esc>` : ターミナルモードからノーマルモードへ戻る
- `<C-\>` : 最後に使ったターミナルの表示/非表示 (ToggleTerm)

### ウィンドウ移動
ターミナルモードからでも、そのまま隣のウィンドウへ移動できます。

- `<C-h>` : 左のウィンドウへ
- `<C-j>` : 下のウィンドウへ
- `<C-k>` : 上のウィンドウへ
- `<C-l>` : 右의 ウィンドウへ

### ファイル・検索
- `<leader>n` : Neo-tree (ファイルツリー) の表示切り替え
- `<leader>ff` : ファイル検索 (Telescope)
- `<leader>fg` : 文字列検索 (Live Grep)

### LSP (言語サーバー)
- `gd` : 定義へジャンプ
- `gr` : 参照元を一覧表示
- `K`  : ホバー表示 (ドキュメント確認)
- `<leader>rn` : リネーム (変数名などの一括変更)

## 🛠 カスタマイズ
設定を変更した後は、`init.lua` をリロードするか Neovim を再起動することで反映されます。
新しいプラグインを追加する場合は `lua/plugins/init.lua` に追記してください。
