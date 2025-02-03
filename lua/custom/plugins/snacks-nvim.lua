local enable_keybindings = true -- Set this flag to true or false to enable/disable keybindings

return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  enabled = true,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = false },
    dashboard = { enabled = false },
    indent = { enabled = false },
    input = { enabled = false },
    notifier = { enabled = false },
    quickfile = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
    picker = {},
  },
  dependencies = {
    'folke/which-key.nvim',
  },
  config = function(_, opts) -- The first parameter is a LazyPlugin, which we don't know or care what it is.
    -- Default implementation of config() automatically runs require(MAIN).setup(opts).
    -- This means that if you want to extend config(), you should call this same function, and add whatever logic you want afterwards.
    require('snacks').setup(opts)

    local which_key = require 'which-key'
    which_key.add {
      { '<leader>p', group = 'Snacks [P]icker' },
      { '<leader>pl', group = 'LSP' },
    }
  end,
  keys = enable_keybindings
      and {
        -- Picker keybindings
        {
          '<leader>px',
          function()
            Snacks.picker.pickers()
          end,
          desc = 'Search Built-In Pickers',
        },
        -- find
        {
          '<leader>pb',
          function()
            Snacks.picker.buffers()
          end,
          desc = 'Search Buffers',
        },
        {
          '<leader>pn',
          function()
            Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
          end,
          desc = 'Search Neovim Config',
        },
        {
          '<leader>pf',
          function()
            Snacks.picker.files()
          end,
          desc = 'Search Files',
        },
        {
          '<leader>p.',
          function()
            Snacks.picker.recent()
          end,
          desc = 'Search Recent Files',
        },
        -- git
        {
          '<leader>pGl',
          function()
            Snacks.picker.git_log()
          end,
          desc = 'Search Git Log',
        },
        {
          '<leader>pGf',
          function()
            Snacks.picker.git_files()
          end,
          desc = 'Search Git Files',
        },
        {
          '<leader>pGs',
          function()
            Snacks.picker.git_status()
          end,
          desc = 'Search Git Status',
        },
        -- vim.keymap.set('n', '<leader>cgc', builtin.git_commits, { desc = 'Search Git Commits' })
        -- vim.keymap.set('n', '<leader>cgb', builtin.git_branches, { desc = 'Search Git Branches' })
        -- vim.keymap.set('n', '<leader>cgf', builtin.git_bcommits, { desc = 'Search Git Buffer Commits' })
        -- Grep
        {
          '<leader>pL',
          function()
            Snacks.picker.lines()
          end,
          desc = 'Search Buffer Lines',
        },
        {
          '<leader>pB',
          function()
            Snacks.picker.grep_buffers()
          end,
          desc = 'Search Open Buffers',
        },
        {
          '<leader>pg',
          function()
            Snacks.picker.grep()
          end,
          desc = 'Search by Grep',
        },
        {
          '<leader>pi',
          function()
            Snacks.picker.grep { ignored = true, format = 'file', finder = 'grep', live = true, supports_live = true }
          end,
          desc = 'Search by Grep No-Ignore',
        },
        {
          '<leader>p/',
          function()
            Snacks.picker.grep { ignored = false, buffers = true, format = 'file', finder = 'grep', live = true, supports_live = true }
          end,
          desc = 'Search / by Grep in Open Files',
        },
        {
          '<leader>pw',
          function()
            Snacks.picker.grep_word()
          end,
          desc = 'Search Word',
          mode = { 'n', 'x' },
        },
        -- search
        {
          '<leader>p"',
          function()
            Snacks.picker.registers()
          end,
          desc = 'Search Registers',
        },
        {
          '<leader>pa',
          function()
            Snacks.picker.autocmds()
          end,
          desc = 'Search Autocmds',
        },
        {
          '<leader>pH',
          function()
            Snacks.picker.command_history()
          end,
          desc = 'Search Command History',
        },
        {
          '<leader>pC',
          function()
            Snacks.picker.commands()
          end,
          desc = 'Search Commands',
        },
        {
          '<leader>pd',
          function()
            Snacks.picker.diagnostics()
          end,
          desc = 'Search Diagnostics',
        },
        {
          '<leader>ph',
          function()
            Snacks.picker.help()
          end,
          desc = 'Search Help',
        },
        {
          '<leader>pH',
          function()
            Snacks.picker.highlights()
          end,
          desc = 'Search Highlights',
        },
        {
          '<leader>pj',
          function()
            Snacks.picker.jumps()
          end,
          desc = 'Search Jumplist',
        },
        {
          '<leader>pk',
          function()
            Snacks.picker.keymaps()
          end,
          desc = 'Search Keymaps',
        },
        -- { '<leader>pt', function() end, { desc = 'Search Tree-sitter' })
        {
          '<leader>po',
          function()
            Snacks.picker.loclist()
          end,
          desc = 'Location List',
        },
        {
          '<leader>pM',
          function()
            Snacks.picker.man()
          end,
          desc = 'Search Man Pages',
        },
        {
          '<leader>pm',
          function()
            Snacks.picker.marks()
          end,
          desc = 'Search Marks',
        },
        {
          '<leader>pr',
          function()
            Snacks.picker.resume()
          end,
          desc = 'Search Resume',
        },
        {
          '<leader>pq',
          function()
            Snacks.picker.qflist()
          end,
          desc = 'Search Quickfix List',
        },
        {
          '<leader>pc',
          function()
            Snacks.picker.colorschemes()
          end,
          desc = 'Search Colorschemes',
        },
        {
          '<leader>pp',
          function()
            Snacks.picker.projects()
          end,
          desc = 'Search Projects',
        },
        -- LSP
        {
          '<leader>pd',
          function()
            Snacks.picker.lsp_definitions()
          end,
          desc = 'Goto Definition',
        },
        {
          '<leader>pr',
          function()
            Snacks.picker.lsp_references()
          end,
          nowait = true,
          desc = 'Goto References',
        },
        {
          '<leader>pI',
          function()
            Snacks.picker.lsp_implementations()
          end,
          desc = 'Goto Implementation',
        },
        {
          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          '<leader>pD',
          function()
            Snacks.picker.lsp_type_definitions()
          end,
          desc = 'Type Definition',
        },
        {
          '<leader>pls',
          function()
            Snacks.picker.lsp_symbols()
          end,
          desc = 'Search Lsp Symbols',
        },
      }
    or nil,
}
