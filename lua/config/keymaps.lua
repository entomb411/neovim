-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Open telescope file_browser picker
-- vim.api.nvim_set_keymap("n", "<space>fp", ":Telescope file_browser<CR>", {
--   noremap = true,
--   desc = "Open file browser",
-- })

-- Open telescope live_grep_args
vim.api.nvim_set_keymap(
  "n",
  "<leader>fg",
  ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
  { desc = "Live Grep (Args)" }
)

vim.keymap.set("n", "<leader>sj", "<cmd>lua require('telescope.builtin').jumplist()<cr>", { desc = "Jump list" })

vim.api.nvim_set_keymap(
"n",
"<leader>fs",
":Telescope lsp_document_symbols<CR>",
{ desc = "Document symbols" }
)

vim.api.nvim_set_keymap(
"n",
"<leader>cg",
"0v$<Space>cf<CR><C-[>",
{ desc = "Format line"}
)

vim.keymap.set(
  "n",
  "<leader>su",
  require("undotree").toggle,
  { noremap = true, silent = true, desc = "Toggle Undotree" }
)

-- Format selection
vim.keymap.set("v", "<Leader>bf", vim.lsp.buf.format, { desc = "Format selection" })

---- Popup menu options ----
-- Configuring nvim-cmp
local cmp = require("cmp")
cmp.setup {
  mapping = {
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  },
}

vim.keymap.set("n", "cc", '"_diw"0P', { noremap = true, desc = "Replace word with last yanked text"})
-- vim.keymap.set("v", "cc", '"_d"0P', {noremap = true, desc = "Replace selection with last yanked text"})
