return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', 'folke/which-key.nvim' },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function(_, opts)
    require('trouble').setup(opts)

    require('which-key').register {
      ['<leader>x'] = {
        name = 'Trouble',
        x = 'which_key_ignore',
      },
    }
  end,
  event = 'VeryLazy',
  keys = {
    -- Lua
    {
      '<leader>xx',
      function()
        require('trouble').toggle()
      end,
      desc = 'Toggle Trouble',
    },
    {
      '<leader>xw',
      function()
        require('trouble').toggle 'workspace_diagnostics'
      end,
      desc = 'Toggle workspace diagnostics (Trouble)',
    },
    {
      '<leader>xd',
      function()
        require('trouble').toggle 'document_diagnostics'
      end,
      desc = 'Toggle document diagnostics (Trouble)',
    },
    {
      '<leader>xq',
      function()
        require('trouble').toggle 'quickfix'
      end,
      desc = 'Toggle quickfix (Trouble)',
    },
    {
      '<leader>xl',
      function()
        require('trouble').toggle 'loclist'
      end,
      desc = 'Toggle location list (Trouble)',
    },
    {
      '<leader>xgr',
      function()
        require('trouble').toggle 'lsp_references'
      end,
      desc = 'Show LSP references (Trouble)',
    },
    {
      '<leader>xgd',
      function()
        require('trouble').toggle 'lsp_definitions'
      end,
      desc = 'Show LSP definitions (Trouble)',
    },
    {
      '<leader>xgt',
      function()
        require('trouble').toggle 'lst_type_definitions'
      end,
      desc = 'Show LSP type definitions (Trouble)',
    },
  },
}
