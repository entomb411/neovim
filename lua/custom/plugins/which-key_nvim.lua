-- For example, in the following configuration, we use:
--  event = 'VimEnter'
--
-- which loads which-key before all the UI elements are loaded. Events can be
-- normal autocommands events (`:help autocmd-events`).
--
-- Then, because we use the `config` key, the configuration only runs
-- after the plugin has been loaded:
--  config = function() ... end
return {
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
