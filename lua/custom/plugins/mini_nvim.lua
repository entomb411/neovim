return {
  -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  dependencies = {
    { 'folke/which-key.nvim' },
  },
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup {
      -- Add custom surroundings to be used on top of builtin ones. For more
      -- information with examples, see `:h MiniSurround.config`.
      custom_surroundings = nil,

      -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
      highlight_duration = 500,

      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        add = '<M-s>a', -- Add surrounding in Normal and Visual modes
        delete = '<M-s>d', -- Delete surrounding
        find = '<M-s>f', -- Find surrounding (to the right)
        find_left = '<M-s>F', -- Find surrounding (to the left)
        highlight = '<M-s>h', -- Highlight surrounding
        replace = '<M-s>r', -- Replace surrounding
        update_n_lines = '<M-s>n', -- Update `n_lines`

        suffix_last = 'l', -- Suffix to search with "prev" method
        suffix_next = 'n', -- Suffix to search with "next" method
      },

      -- Number of lines within which surrounding is searched
      n_lines = 20,

      -- Whether to respect selection type:
      -- - Place surroundings on separate lines in linewise mode.
      -- - Place surroundings on each line in blockwise mode.
      respect_selection_type = false,

      -- How to search for surrounding (first inside current line, then inside
      -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
      -- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
      -- see `:h MiniSurround.config`.
      search_method = 'cover',

      -- Whether to disable showing non-error feedback
      -- This also affects (purely informational) helper messages shown after
      -- idle time if user input is required.
      silent = false,
    }

    -- Use square brackets to go forward/backward to a certain target.
    -- [ + upper-suffix : go first.
    -- [ + lower-suffix : go backward.
    -- ] + lower-suffix : go forward.
    -- ] + upper-suffix : go last.
    -- Supported targets (for more information see help for corresponding Lua function):
    -- Target Mappings  Lua function
    -- Buffer   [B [b ]b ]B    MiniBracketed.buffer()
    -- Comment block    [C [c ]c ]C    MiniBracketed.comment()
    -- Conflict marker    [X [x ]x ]X    MiniBracketed.conflict()
    -- Diagnostic   [D [d ]d ]D    MiniBracketed.diagnostic()
    -- File on disk   [F [f ]f ]F    MiniBracketed.file()
    -- Indent change    [I [i ]i ]I    MiniBracketed.indent()
    -- Jump from jumplist inside current buffer   [J [j ]j ]J    MiniBracketed.jump()
    -- Location from location list    [L [l ]l ]L    MiniBracketed.location()
    -- Old files    [O [o ]o ]O    MiniBracketed.oldfile()
    -- Quickfix entry from quickfix list    [Q [q ]q ]Q    MiniBracketed.quickfix()
    -- DISABLED: Tree-sitter node and parents   [T [t ]t ]T    MiniBracketed.treesitter()
    -- Undo states from specially tracked linear history    [U [u ]u ]U    MiniBracketed.undo()
    -- Window in current tab    [W [w ]w ]W    MiniBracketed.window()
    -- Yank selection replacing latest put region   [Y [y ]y ]Y    MiniBracketed.yank()
    require('mini.bracketed').setup { treesitter = { suffix = '' } }

    -- Minimal and fast tabline showing listed buffers.
    require('mini.tabline').setup()

    -- Read, write, and delete sessions.
    require('mini.sessions').setup { autoread = false, autowrite = true }

    -- Visualize scope with animated vertical bar.
    require('mini.indentscope').setup()

    -- Move any selection in any direction.
    -- require('mini.move').setup()

    -- Use mini picker (alternative to Telescope)
    local use_mini_pick = false
    if use_mini_pick then
      local mini_pick = require 'mini.pick'
      mini_pick.setup()
      local mini_extra = require 'mini.extra'
      mini_extra.setup()
      vim.keymap.set('n', '<leader>mh', mini_pick.builtin.help, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>mk', mini_extra.pickers.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>mf', mini_pick.builtin.files, { desc = '[S]earch [F]iles' })

      -- Search built-in pickers
      vim.keymap.set('n', '<leader>mx', function()
        -- Create array of built-in pickers which combines pickers from mini.pick and mini.extra.
        local pickers = {}
        local picker_names = {}
        for key, picker in pairs(mini_pick.builtin) do
          table.insert(picker_names, key)
          pickers[key] = picker
        end
        for key, picker in pairs(mini_extra.pickers) do
          table.insert(picker_names, key)
          pickers[key] = picker
        end

        local result = mini_pick.start {
          source = {
            name = 'Built-In',
            items = picker_names,
            -- preview = function(buf_id, item)
            --   local help_text =
            --   -- Show the help info for the item.
            --   vim.api.nvim_buf_set_lines(buf_id, 0, -1, false, { item })
            -- end,
          },
        }
        if result then
          pickers[result]()
        end
      end, { desc = '[S]earch Built-In Pickers' })
      vim.keymap.set('n', '<leader>mw', function()
        -- Get the current word under the cursor.
        local word = vim.fn.expand '<cword>'
        -- Grep the workspace for only that word.
        mini_pick.builtin.grep { pattern = word }
      end, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>mg', mini_pick.builtin.grep_live, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>md', mini_extra.pickers.diagnostic, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>mr', mini_pick.builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>mb', mini_pick.builtin.buffers, { desc = '[S]earch [B]uffers' })
      -- vim.keymap.set('n', '<leader>ma', mini_pick.builtin.files, { desc = '[S]earch [A]ll Files' })
      -- vim.keymap.set('n', '<leader>mp', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", { desc = 'Live Gre[p] (Args)' })
      vim.keymap.set('n', '<leader>mt', mini_extra.pickers.treesitter, { desc = '[S]earch [T]ree-sitter' })
      vim.keymap.set('n', '<leader>m"', mini_extra.pickers.registers, { desc = '[S]earch Registers' })
      vim.keymap.set('n', '<leader>mm', mini_extra.pickers.marks, { desc = '[S]earch [M]arks' })
      local wk = require 'which-key'
      wk.add {
        { '<leader>m', group = '[M]ini.Pick' },
        { '<leader>ml', group = '[L]SP' },
      }
      vim.keymap.set('n', '<leader>mle', function()
        mini_extra.pickers.lsp { scope = 'declaration' }
      end, { desc = 'Declaration' })
      vim.keymap.set('n', '<leader>mld', function()
        mini_extra.pickers.lsp { scope = 'definition' }
      end, { desc = 'Definition' })
      vim.keymap.set('n', '<leader>mls', function()
        mini_extra.pickers.lsp { scope = 'document_symbol' }
      end, { desc = 'Symbols' })
      vim.keymap.set('n', '<leader>mli', function()
        mini_extra.pickers.lsp { scope = 'implementation' }
      end, { desc = 'Implementation' })
      vim.keymap.set('n', '<leader>mlr', function()
        mini_extra.pickers.lsp { scope = 'references' }
      end, { desc = 'References' })
      vim.keymap.set('n', '<leader>mlt', function()
        mini_extra.pickers.lsp { scope = 'type_definition' }
      end, { desc = 'Type Definition' })
      vim.keymap.set('n', '<leader>mlw', function()
        mini_extra.pickers.lsp { scope = 'workspace_symbol' }
      end, { desc = 'Workspace Symbols' })

      vim.keymap.set('n', '<leader>mc', mini_extra.pickers.commands, { desc = '[S]earch [C]ommands' })
    end

    -- Fast and flexible start screen
    local use_mini_starter = false
    if use_mini_starter then
      local starter = require 'mini.starter'
      starter.setup {
        items = {
          use_mini_pick and starter.sections.pick() or nil,
          starter.sections.sessions(5, true),
          starter.sections.builtin_actions(),
        },
      }
    end

    -- Navigate and manipulate file system
    -- Run with ':lua MiniFiles.open()'
    -- Press j/k to navigate down/up.
    -- Press l to expand entry under cursor: show directory or open file in the most recent window.
    -- Press h to go to parent directory.
    -- Type g? for more information about other available mappings.
    -- Move as in any other buffer ($, G, f/t, etc.).
    local minifiles = require 'mini.files'
    minifiles.setup()
    minifiles.config.windows.preview = true -- Show preview of files and directories
    minifiles.config.windows.width_preview = 80 -- Width of preview window
    minifiles.config.windows.width_nofocus = 30 -- Width of windows not in focus
    vim.keymap.set('n', '<leader>wf', _G.MiniFiles.open, { desc = 'Browse [W]orkspace [F]iles' })
    vim.keymap.set('n', '<leader>wc', function()
      local curr_buf = vim.api.nvim_buf_get_name(0)
      -- If curr_buf is not a valid file then open from the workspace root.
      if vim.fn.filereadable(curr_buf) == 0 then
        minifiles.open(nil, false)
      else
        minifiles.open(curr_buf, false)
      end
    end, { desc = 'Browse [W]orkspace [C]urrent File' })

    -- Add keymaps to open highlighted file in a split.
    local map_split = function(buf_id, lhs, direction)
      local rhs = function()
        -- Make new window and set it as target
        local cur_target = _G.MiniFiles.get_explorer_state().target_window
        local new_target = vim.api.nvim_win_call(cur_target, function()
          vim.cmd(direction .. ' split')
          return vim.api.nvim_get_current_win()
        end)

        _G.MiniFiles.set_target_window(new_target)

        -- This intentionally doesn't act on file under cursor in favor of
        -- explicit "go in" action (`l` / `L`). To immediately open file,
        -- add appropriate `MiniFiles.go_in()` call instead of this comment.
      end

      -- Adding `desc` will result into `show_help` entries
      local desc = 'Split ' .. direction
      vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc })
    end

    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesBufferCreate',
      callback = function(args)
        local buf_id = args.data.buf_id
        -- Tweak keys to your liking
        map_split(buf_id, '<C-s>', 'belowright horizontal')
        map_split(buf_id, '<C-v>', 'belowright vertical')
      end,
    })

    -- Attempting to debug why the help window is too narrow.
    -- I don't seem to get a MiniFilesWindowOpen event when the help window is opened.
    local debug_mini_files = false
    if debug_mini_files then
      vim.api.nvim_create_autocmd('User', {
        pattern = 'MiniFilesWindowOpen',
        callback = function(args)
          -- Get window config
          local win_id = args.data.win_id
          local win_config = vim.api.nvim_win_get_config(win_id)
          vim.print('WindowOpen: ' .. vim.inspect(win_config))

          -- Calculate the width of the longest line in the buffer.
          local buf_id = args.data.buf_id
          local lines = vim.api.nvim_buf_get_lines(buf_id, 0, -1, false)
          local current_width = vim.api.nvim_win_get_width(0)
          local max_width = current_width
          for _, line in ipairs(lines) do
            max_width = math.max(max_width, vim.fn.strdisplaywidth(line))
            vim.print('line: ' .. line)
            vim.print('width: ' .. vim.fn.strdisplaywidth(line))
          end
          vim.print('window-width: ' .. current_width)
          vim.print('max-width: ' .. max_width)
        end,
      })
    end

    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}
