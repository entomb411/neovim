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
  },
}
