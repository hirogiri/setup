-- LSP
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

-- Telescope（起動時に require しない：押したときにロード）
vim.keymap.set("n", "<leader>ff", function() require("telescope.builtin").find_files() end)
vim.keymap.set("n", "<leader>fg", function() require("telescope.builtin").live_grep() end)
vim.keymap.set("n", "<leader>fb", function() require("telescope.builtin").buffers() end)
vim.keymap.set("n", "<leader>fr", function() require("telescope.builtin").oldfiles() end)

-- terminal (layout-focused)
-- 下側に分割してターミナルを起動 (Ctrl + t)
vim.keymap.set("n", "<C-t>", function()
  vim.cmd("belowright split | terminal")
end)

-- 右側に分割してターミナルを起動 (Ctrl + Shift + T)
-- 注: Ghostty側で Ctrl+Shift+T が使われていないか確認が必要です
vim.keymap.set("n", "<C-S-t>", function()
  vim.cmd("vertical rightbelow split | terminal")
end)

-- ターミナル内でも同じ操作で分割を増やせるように (tモード)
vim.keymap.set("t", "<C-t>", [[<C-\><C-n>:belowright split | terminal<CR>]])
vim.keymap.set("t", "<C-S-t>", [[<C-\><C-n>:vertical rightbelow split | terminal<CR>]])

-- ターミナルモードからノーマルモードに戻る
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
-- ウィンドウ移動 (ターミナル内からそのまま別のウィンドウへ)
vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]])
vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]])
vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]])
vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]])

-- window move
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]])
vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]])
vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]])
vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]])

-- Neo-tree
vim.keymap.set("n", "<leader>n", ":Neotree toggle<CR>")
vim.keymap.set("n", "<leader>o", ":Neotree focus<CR>")

