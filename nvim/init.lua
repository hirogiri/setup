------------------------------------------------------------
-- プログラミング用 Neovim【初心者向け完成形】(Nvim 0.11+)
-- - lazy.nvim
-- - Treesitter
-- - Mason
-- - 標準LSP (vim.lsp.config / vim.lsp.enable)
-- - nvim-cmp 補完
------------------------------------------------------------

-----------------------
-- 基本設定
-----------------------
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = " "

-----------------------
-- lazy.nvim bootstrap
-----------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-----------------------
-- Plugins
-----------------------
require("lazy").setup({
  -- Treesitter（色付け/構文解析）
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua", "vim", "vimdoc",
          "python",
          "javascript", "typescript",
          "json", "html", "css", "bash"
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- LSPサーバの管理
  { "williamboman/mason.nvim", config = true },

  -- 補完
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = {
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        },
        sources = { { name = "nvim_lsp" } },
      })
    end,
  },

  -- nvim-lspconfig は “サーバ定義の提供” として入れる（ただし require('lspconfig') は使わない）
  "neovim/nvim-lspconfig",

  ----------------------------------------------------------
  -- ★ ファイルツリー（ここに挟む）
  ----------------------------------------------------------
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          follow_current_file = { enabled = true },
          hijack_netrw_behavior = "open_default",
        },
      })
    end,
  },
  ----------------------------------------------------------
  -- 検索（Telescope）
  ----------------------------------------------------------
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").setup({})
    end,
  },

  ----------------------------------------------------------
  -- Git: 変更行の表示（+ ~ -）
  ----------------------------------------------------------
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },

  ----------------------------------------------------------
  -- Git: コマンド操作（status / commit / diff）
  ----------------------------------------------------------
  {
    "tpope/vim-fugitive",
  },

})

-----------------------
-- LSP（Nvim 0.11+ の新方式）
-----------------------
local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
local capabilities = ok_cmp and cmp_lsp.default_capabilities() or nil

-- 全サーバ共通（任意）
vim.lsp.config("*", {
  capabilities = capabilities,
})

-- Lua 用（vim をグローバル扱い）
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
    },
  },
})

-- 有効化：tsserver ではなく ts_ls
vim.lsp.enable({ "lua_ls", "pyright", "ts_ls", "jdtls", "gopls" })

-----------------------
-- LSP キーマップ
-----------------------
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files)   -- ファイル検索
vim.keymap.set("n", "<leader>fg", builtin.live_grep)    -- 文字列検索
vim.keymap.set("n", "<leader>fb", builtin.buffers)      -- 開いてるファイル
vim.keymap.set("n", "<leader>fr", builtin.oldfiles)     -- 最近のファイル

vim.keymap.set("n", "<leader>t", ":split | terminal<CR>")
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])

-- ウィンドウ移動（エディタ ⇄ ターミナル共通）
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]])
vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]])
vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]])
vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]])

-- Neo-tree（ファイルツリー）
vim.keymap.set("n", "<leader>n", ":Neotree toggle<CR>")
vim.keymap.set("n", "<leader>o", ":Neotree focus<CR>") -- 任意：ツリーへフォーカス

