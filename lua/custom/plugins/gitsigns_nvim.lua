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
      which_key.register {
        ['<leader>cgs'] = {
          name = 'Git[s]igns',
          b = { "<cmd>lua require('gitsigns').blame_line()<cr>", 'Blame current line' },
          t = { "<cmd>lua require('gitsigns').toggle_current_line_blame()<cr>", 'Toggle blame current line' },
          d = { "<cmd>lua require('gitsigns').diffthis()<cr>", 'Diff this' },
          h = {
            name = '+hunk',
            s = { "<cmd>lua require('gitsigns').stage_hunk()<cr>", 'Stage hunk' },
            r = { "<cmd>lua require('gitsigns').reset_hunk()<cr>", 'Reset hunk' },
            u = { "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", 'Undo stage hunk' },
          },
        },
        [']h'] = { "<cmd>lua require('gitsigns').next_hunk()<cr>", 'Next hunk' },
        ['[h'] = { "<cmd>lua require('gitsigns').prev_hunk()<cr>", 'Previous hunk' },
        --   ['m'] = {
        --     name = '+marks',
        --     [','] = 'Set next available lowercase mark',
        --   },
      }
    end,
  },
}
