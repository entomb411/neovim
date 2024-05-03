-- Use none-ls for python, lua, and shell scripts.
return {
  -- none-ls
  {
    'nvimtools/none-ls.nvim',
    -- event = 'LazyFile',
    dependencies = {
      'williamboman/mason.nvim',
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local null_ls = require 'null-ls'
      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.shfmt,
        },
      }
    end,
  },
}
