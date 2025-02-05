return {
  'ibhagwan/fzf-lua',
  -- or if using mini.icons/mini.nvim
  dependencies = { 'echasnovski/mini.nvim', 'folke/which-key.nvim', 'nvim-tree/nvim-web-devicons' },
  lazy = true,
  event = 'VeryLazy',
  config = function()
    local fzf = require 'fzf-lua'
    fzf.setup {}
    local wk = require 'which-key'
    -- Look at :help fzf-lua-commands
    wk.add {
      -- Buffers and Files --
      { '<leader>sb', '<cmd>FzfLua buffers<cr>', desc = '[B]uffers' },
      { '<leader>sf', '<cmd>FzfLua files<cr>', desc = '[F]iles' },
      { '<leader>si', '<cmd>FzfLua lines<cr>', desc = 'Open Buffers L[i]nes' },
      { '<leader>st', '<cmd>FzfLua treesitter<cr>', desc = '[T]reesitter' },

      -- Search --
      { '<leader>ss', '<cmd>FzfLua live_grep<cr>', desc = '[S]earch by live grep' },
      { '<leader>sw', '<cmd>FzfLua grep_cword<cr>', desc = '[W]ord' },
      { '<leader>s<space>', '<cmd>FzfLua live_grep_glob<cr>', desc = 'Live grep glob' },
      -- Tags --
      -- Git --
      { '<leader>sg', group = '[G]it' },
      { '<leader>sgf', '<cmd>FzfLua git_files<cr>', desc = '[F]iles' },
      { '<leader>sgs', '<cmd>FzfLua git_status<cr>', desc = '[S]tatus' },
      { '<leader>sgc', '<cmd>FzfLua git_bcommits<cr>', desc = '[C]ommits (buffer)' },
      { '<leader>sgl', '<cmd>FzfLua git_commits<cr>', desc = '[L]og' },
      { '<leader>sgb', '<cmd>FzfLua git_blame<cr>', desc = '[B]lame' },
      { '<leader>sgr', '<cmd>FzfLua git_branches<cr>', desc = 'B[r]anches' },
      { '<leader>sgt', '<cmd>FzfLua git_stash<cr>', desc = 'S[t]ash' },
      -- TODO: Add function to search git hunks, similar to Snacks.picker.git_diff. --
      {
        '<leader>sgh',
        function()
          local core = require 'fzf-lua.core'
          local config = require 'fzf-lua.config'
        end,
        desc = 'Git [H]unks',
      },

      -- LSP/Diagnostics
      { '<leader>sl', group = '[L]SP' },
      { '<leader>slr', '<cmd>FzfLua lsp_references<cr>', desc = '[R]eferences' },
      { '<leader>sld', '<cmd>FzfLua lsp_definitions<cr>', desc = '[D]efinitions' },
      { '<leader>slD', '<cmd>FzfLua lsp_declarations<cr>', desc = '[D]eclarations' },
      { '<leader>slt', '<cmd>FzfLua lsp_typedefs<cr>', desc = '[T]ypedefs' },
      { '<leader>sli', '<cmd>FzfLua lsp_implementations<cr>', desc = '[I]mplementations' },
      { '<leader>sls', '<cmd>FzfLua lsp_document_symbols<cr>', desc = 'Document [S]ymbols' },
      { '<leader>slS', '<cmd>FzfLua lsp_live_workspace_symbols<cr>', desc = 'Workspace [S]ymbols' },
      { '<leader>slc', '<cmd>FzfLua lsp_code_actions<cr>', desc = '[C]ode Actions' },
      { '<leader>slf', '<cmd>FzfLua lsp_finder<cr>', desc = '[F]inder' },
      { '<leader>sla', group = 'Di[a]gnostics' },
      { '<leader>slad', '<cmd>FzfLua lsp_document_diagnostics<cr>', desc = '[D]ocument' },
      { '<leader>slaw', '<cmd>FzfLua lsp_workspace_diagnostics<cr>', desc = '[W]orkspace' },
      -- Misc --
      { '<leader>sr', '<cmd>FzfLua resume<cr>', desc = '[R]esume' },
      { '<leader>sx', '<cmd>FzfLua builtin<cr>', desc = 'Builtin Pickers' },
      { '<leader>sh', '<cmd>FzfLua helptags<cr>', desc = '[H]elp' },
      { '<leader>sa', '<cmd>FzfLua manpages<cr>', desc = 'M[a]npages' },
      { '<leader>sc', '<cmd>FzfLua colorschemes<cr>', desc = '[C]olourschemes' },
      { '<leader>so', '<cmd>FzfLua commands<cr>', desc = 'C[o]mmands' },
      { '<leader>sy', '<cmd>FzfLua command_history<cr>', desc = 'Command Histor[y]' },
      { '<leader>sm', '<cmd>FzfLua marks<cr>', desc = '[M]arks' },
      { '<leader>sj', '<cmd>FzfLua jumps<cr>', desc = '[J]umps' },
      { '<leader>s"', '<cmd>FzfLua registers<cr>', desc = 'Registers' },
      { '<leader>sk', '<cmd>FzfLua keymaps<cr>', desc = '[K]eymaps' },
    }
  end,
}
