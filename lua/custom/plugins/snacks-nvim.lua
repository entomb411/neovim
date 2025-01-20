local enable_keybindings = false -- Set this flag to true or false to enable/disable keybindings

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
  keys = enable_keybindings
      and {
        -- Picker keybindings
        {
          '<leader>sx',
          function()
            Snacks.picker.pickers()
          end,
          desc = '[S]earch Built-In Pickers',
        },
        -- find
        {
          '<leader>sb',
          function()
            Snacks.picker.buffers()
          end,
          desc = '[S]earch [B]uffers',
        },
        {
          '<leader>sn',
          function()
            Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
          end,
          desc = '[S]earch [N]eovim Config',
        },
        {
          '<leader>sf',
          function()
            Snacks.picker.files()
          end,
          desc = '[S]earch [F]iles',
        },
        {
          '<leader>s.',
          function()
            Snacks.picker.recent()
          end,
          desc = '[S]earch Recent Files',
        },
        -- git
        {
          '<leader>sGl',
          function()
            Snacks.picker.git_log()
          end,
          desc = '[S]earch [G]it [L]og',
        },
        {
          '<leader>sGf',
          function()
            Snacks.picker.git_files()
          end,
          desc = '[S]earch [G]it [F]iles',
        },
        {
          '<leader>sGs',
          function()
            Snacks.picker.git_status()
          end,
          desc = '[S]earch [G]it [S]tatus',
        },
        -- vim.keymap.set('n', '<leader>cgc', builtin.git_commits, { desc = 'Search [G]it [C]ommits' })
        -- vim.keymap.set('n', '<leader>cgb', builtin.git_branches, { desc = 'Search [G]it [B]ranches' })
        -- vim.keymap.set('n', '<leader>cgf', builtin.git_bcommits, { desc = 'Search [G]it Bu[f]fer Commits' })
        -- Grep
        {
          '<leader>sL',
          function()
            Snacks.picker.lines()
          end,
          desc = '[S]earch Buffer [L]ines',
        },
        {
          '<leader>sB',
          function()
            Snacks.picker.grep_buffers()
          end,
          desc = '[S]earch Open [B]uffers',
        },
        {
          '<leader>sg',
          function()
            Snacks.picker.grep()
          end,
          desc = '[S]earch by [G]rep',
        },
        {
          '<leader>si',
          function()
            Snacks.picker.grep { ignored = true, format = 'file', finder = 'grep', live = true, supports_live = true }
          end,
          desc = '[S]earch by Grep No-[I]gnore',
        },
        {
          '<leader>s/',
          function()
            Snacks.picker.grep { ignored = false, buffers = true, format = 'file', finder = 'grep', live = true, supports_live = true }
          end,
          desc = '[S]earch [/] by Grep in Open Files',
        },
        {
          '<leader>sw',
          function()
            Snacks.picker.grep_word()
          end,
          desc = '[S]earch [W]ord',
          mode = { 'n', 'x' },
        },
        -- search
        {
          '<leader>s"',
          function()
            Snacks.picker.registers()
          end,
          desc = '[S]earch [R]egisters',
        },
        {
          '<leader>sa',
          function()
            Snacks.picker.autocmds()
          end,
          desc = '[S]earch [A]utocmds',
        },
        {
          '<leader>sH',
          function()
            Snacks.picker.command_history()
          end,
          desc = '[S]earch Command [H]istory',
        },
        {
          '<leader>sC',
          function()
            Snacks.picker.commands()
          end,
          desc = '[S]earch [C]ommands',
        },
        {
          '<leader>sd',
          function()
            Snacks.picker.diagnostics()
          end,
          desc = '[S]earch [D]iagnostics',
        },
        {
          '<leader>sh',
          function()
            Snacks.picker.help()
          end,
          desc = '[S]earch [H]elp',
        },
        {
          '<leader>sH',
          function()
            Snacks.picker.highlights()
          end,
          desc = '[S]earch [H]ighlights',
        },
        {
          '<leader>sj',
          function()
            Snacks.picker.jumps()
          end,
          desc = '[S]earch [J]umplist',
        },
        {
          '<leader>sk',
          function()
            Snacks.picker.keymaps()
          end,
          desc = '[S]earch [K]eymaps',
        },
        -- { '<leader>st', function() end, { desc = '[S]earch [T]ree-sitter' })
        {
          '<leader>sl',
          function()
            Snacks.picker.loclist()
          end,
          desc = 'Location List',
        },
        {
          '<leader>sM',
          function()
            Snacks.picker.man()
          end,
          desc = '[S]earch [M]an Pages',
        },
        {
          '<leader>sm',
          function()
            Snacks.picker.marks()
          end,
          desc = '[S]earch [M]arks',
        },
        {
          '<leader>sr',
          function()
            Snacks.picker.resume()
          end,
          desc = '[S]earch [R]esume',
        },
        {
          '<leader>sq',
          function()
            Snacks.picker.qflist()
          end,
          desc = '[S]earch [Q]uickfix List',
        },
        {
          '<leader>sc',
          function()
            Snacks.picker.colorschemes()
          end,
          desc = '[S]earch [C]olorschemes',
        },
        {
          '<leader>sp',
          function()
            Snacks.picker.projects()
          end,
          desc = '[S]earch [P]rojects',
        },
        -- LSP
        {
          'gd',
          function()
            Snacks.picker.lsp_definitions()
          end,
          desc = '[G]oto [D]efinition',
        },
        {
          'gr',
          function()
            Snacks.picker.lsp_references()
          end,
          nowait = true,
          desc = '[G]oto [R]eferences',
        },
        {
          'gI',
          function()
            Snacks.picker.lsp_implementations()
          end,
          desc = '[G]oto [I]mplementation',
        },
        {
          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          '<leader>D',
          function()
            Snacks.picker.lsp_type_definitions()
          end,
          desc = 'Type [D]efinition',
        },
        {
          '<leader>sls',
          function()
            Snacks.picker.lsp_symbols()
          end,
          desc = '[S]earch [L]sp [S]ymbols',
        },
      }
    or nil,
}
