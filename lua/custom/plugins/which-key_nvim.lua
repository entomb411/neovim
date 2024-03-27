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
      wk.register {
        ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        ['<leader>cg'] = { name = '[G]it', _ = 'which_key_ignore' },
        ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
        ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
        ['<leader>b'] = { name = '[B]uffer', _ = 'which_key_ignore' },
      }

      -- Define a function to get the range of the current line
      local function get_line_range()
        local line = vim.api.nvim_win_get_cursor(0)[1]
        local start_pos = { line - 1, 0 }
        local end_pos = { line - 1, vim.fn.col '$' - 1 }
        return { ['start'] = start_pos, ['end'] = end_pos }
      end

      -- Define a function to format the current line
      local function format_current_line()
        local params = {
          -- options = vim.lsp.util.make_formatting_params_options(),
          range = get_line_range(),
        }
        vim.lsp.buf_request(0, 'textDocument/rangeFormatting', params)
      end

      -- Broken T_T
      wk.register {
        ['<leader>cf'] = { name = '[F]ormat', _ = 'which_key_ignore' },
        ['<leader>cfl'] = { format_current_line, '[L]ine' },
      }

      -- Supposed to format the current line, but it's so broken for some reason.
      -- wk.register {
      --   ['<leader>cf'] = { name = '[F]ormat', _ = 'which_key_ignore' },
      --   -- Format line
      --   ['<leader>cfl'] = {
      --     vim.lsp.buf.format {
      --       range = {
      --         ['start'] = { vim.api.nvim_win_get_cursor(0)[1], 0 },
      --         ['end'] = { vim.api.nvim_win_get_cursor(0)[1], vim.fn.col '$' - 1 },
      --       },
      --     },
      --     '[L]ine',
      --   },
      -- }
      --
      wk.register({
        ['<Leader>cfs'] = { vim.lsp.buf.format, '[S]election' },
      }, { mode = 'v' })
    end,
  },
}
