-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Open telescope file_browser picker
vim.api.nvim_set_keymap("n", "<space>fp", ":Telescope file_browser<CR>", {
  noremap = true,
  desc = "Open file browser",
})

-- Open telescope live_grep_args
vim.api.nvim_set_keymap(
  "n",
  "<leader>fg",
  ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
  { desc = "Live Grep (Args)" }
)

-- Grep word under cursor
-- Actually already <leader>sw
-- local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
-- vim.keymap.set("n", "<leader>gc", live_grep_args_shortcuts.grep_word_under_cursor)

-- vim.api.nvim_set_keymap("n", "<leader>gc", live_grep_args_shortcuts.grep_word_under_cursor)

-- open file_browser with the path of the current buffer
-- vim.api.nvim_set_keymap(
--   "n",
--   "<space>fp",
--   ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
--   { noremap = true }
-- )
