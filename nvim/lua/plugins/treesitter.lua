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

