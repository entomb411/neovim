-- See `:help gitsigns` to understand what the configuration keys do

local default_signs = {
  add = { text = '│' },
  change = { text = '│' },
  delete = { text = '_' },
  topdelete = { text = '‾' },
  changedelete = { text = '~' },
  untracked = { text = '┆' },
}

local custom_signs = {
  add = { text = '+' },
  change = { text = '~' },
  delete = { text = '_' },
  topdelete = { text = '‾' },
  changedelete = { text = '~' },
}

return {
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    signcolumn = true,
    opts = {
      signs = custom_signs,
    },
    config = function(_, opts) -- The first parameter is a LazyPlugin, which we don't know or care what it is.
      -- Default implementation of config() automatically runs require(MAIN).setup(opts).
      -- This means that if you want to extend config(), you should call this same function, and add whatever logic you want afterwards.
      require('gitsigns').setup(opts)

      local which_key = require 'which-key'
      which_key.add {
        { '<leader>cgs', group = 'Git[s]igns' },
        { '<leader>cgsb', "<cmd>lua require('gitsigns').blame_line()<cr>", desc = 'Blame current line' },
        { '<leader>cgst', "<cmd>lua require('gitsigns').toggle_current_line_blame()<cr>", desc = 'Toggle blame current line' },
        { '<leader>cgsd', "<cmd>lua require('gitsigns').diffthis()<cr>", desc = 'Diff this' },
        { '<leader>cgsh', group = '[H]unk' },
        { '<leader>cgshs', "<cmd>lua require('gitsigns').stage_hunk()<cr>", desc = 'Stage hunk' },
        { '<leader>cgshr', "<cmd>lua require('gitsigns').reset_hunk()<cr>", desc = 'Reset hunk' },
        { '<leader>cgshu', "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", desc = 'Undo stage hunk' },
        { '<leader>cgs]', "<cmd>lua require('gitsigns').next_hunk()<cr>", desc = 'Next hunk' },
        { '<leader>cgs[', "<cmd>lua require('gitsigns').prev_hunk()<cr>", desc = 'Previous hunk' },
      }
    end,
  },
}
