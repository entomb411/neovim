return {
  -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
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
    require('mini.surround').setup()

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
    -- Tree-sitter node and parents   [T [t ]t ]T    MiniBracketed.treesitter()
    -- Undo states from specially tracked linear history    [U [u ]u ]U    MiniBracketed.undo()
    -- Window in current tab    [W [w ]w ]W    MiniBracketed.window()
    -- Yank selection replacing latest put region   [Y [y ]y ]Y    MiniBracketed.yank()
    require('mini.bracketed').setup()

    -- Minimal and fast tabline showing listed buffers.
    require('mini.tabline').setup()

    -- Read, write, and delete sessions.
    -- require('mini.sessions').setup()

    -- Visualize scope with animated vertical bar.
    require('mini.indentscope').setup()

    -- Fast and flexible start screen
    local starter = require 'mini.starter'
    starter.setup {
      dependencies = {
        'telescope_nvim.lua',
        'nvim-telescope/telescope-file-browser.nvim',
      },
      items = {
        starter.sections.telescope(),
        starter.sections.sessions(5, true),
        starter.sections.builtin_actions(),
      },
    }

    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    local statusline = require 'mini.statusline'
    -- set use_icons to true if you have a Nerd Font
    statusline.setup { use_icons = vim.g.have_nerd_font }

    -- You can configure sections in the statusline by overriding their
    -- default behavior. For example, here we set the section for
    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
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
    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}
