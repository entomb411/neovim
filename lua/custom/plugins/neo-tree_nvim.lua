return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    enabled = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    keys = {
      { '<leader>we', '<cmd>Neotree toggle reveal filesystem<CR>', desc = 'Toggle [W]orkspace [E]xplorer' },
      { '<leader>be', '<cmd>Neotree toggle buffers<CR>', desc = 'Toggle [B]uffers [E]xplorer' },
    },
    deactivate = function()
      vim.cmd [[Neotree close]]
    end,
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
      },
    },
  },
}
