return {
  {
    -- Find keymaps for a given prefix.
    -- :KeyAnalyzer <prefix> [mode]
    -- For example,
    --   `:KeyAnalyzer <C-M>x i`  - Show mappings starting with CTRL + M x in insert mode
    'meznaric/key-analyzer.nvim',
    lazy = true,
    event = 'VeryLazy',
    opts = {},
  },
  {
    -- hawtkeys.nvim is a nvim plugin for finding and suggesting memorable and easy-to-press keys for your nvim shortcuts.
    -- It takes into consideration keyboard layout, easy-to-press combinations and memorable phrases,
    -- and excludes already mapped combinations to provide you with suggested keys for your commands
    --
    -- Searching New Keymaps
    -- :Hawtkeys
    --
    -- Show All Existing Keymaps
    -- :HawtkeysAll
    --
    -- Showing Duplicate Keymaps
    -- :HawtkeysDupes
    'tris203/hawtkeys.nvim',
    lazy = true,
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    config = {},
  },
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()

      -- Document existing key chains
      local wk = require 'which-key'
      wk.add {
        { '<leader>c', group = '[C]ode' },
        { '<leader>cg', group = '[G]it' },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>b', group = '[B]uffer' },
      }

      -- Define a function to get the range of the current line
      local function get_line_range()
        local line = vim.api.nvim_win_get_cursor(0)[1]
        local start_pos = { line, 0 }
        local end_pos = { line, vim.fn.col '$' - 1 }
        return { ['start'] = start_pos, ['end'] = end_pos }
      end

      -- Define a function to format the current line
      local function format_current_line()
        local params = {
          range = get_line_range(),
        }
        vim.lsp.buf.format(params)
      end

      wk.add {
        { '<leader>cf', group = '[F]ormat' },
        { '<leader>cfl', format_current_line, desc = '[L]ine' },
        { '<Leader>cfs', vim.lsp.buf.format, desc = '[S]election', mode = 'v' },
      }

      wk.add {
        -- Kill (exit) the current buffer
        {
          '<leader>bk',
          function()
            vim.api.nvim_buf_delete(0, { force = true })
          end,
          desc = '[K]ill',
        },
      }
    end,
  },
}
