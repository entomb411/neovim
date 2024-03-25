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
      -- which_key.register {
      --   ['m'] = {
      --     name = '+marks',
      --     [','] = 'Set next available lowercase mark',
      --   },
      -- }
    end,
  },
}
