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

vim.keymap.set('n', '<leader>su', require('undotree').toggle, { noremap = true, silent = true, desc = "Toggle Undotree" })

