-- https://github.com/CopilotC-Nvim/CopilotChat.nvim
return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    enabled = true,
    dependencies = { 'nvim-tree/nvim-web-devicons', 'folke/which-key.nvim' },
    opts = {
      show_help = 'yes', -- Show help text for CopilotChatInPlace, default: yes
      debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
      disable_extra_info = 'no', -- Disable extra information (e.g: system prompt) in the response.
      language = 'English', -- Copilot answer language settings when using default prompts. Default language is English.
      -- proxy = "socks5://127.0.0.1:3000", -- Proxies requests via https or socks.
      -- temperature = 0.1,
    },
    build = function()
      vim.notify "Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim."
    end,
    branch = 'main',
    event = 'VeryLazy',
    config = function(_, opts)
      require('CopilotChat').setup(opts)

      local which_key = require 'which-key'
      which_key.add {
        { '<leader>cc', group = 'CopilotChat' },
      }
    end,
    keys = {
      {
        '<leader>ccb',
        function()
          local input = vim.fn.input 'Quick Chat: '
          if input ~= '' then
            require('CopilotChat').ask(input, { selection = require('CopilotChat.select').buffer })
          end
        end,
        desc = 'CopilotChat - Chat with current buffer',
      },
      { '<leader>cce', '<cmd>CopilotChatExplain<cr>', desc = 'CopilotChat - Explain code' },
      { '<leader>cct', '<cmd>CopilotChatTests<cr>', desc = 'CopilotChat - Generate tests' },
      {
        '<leader>ccT',
        '<cmd>CopilotChatVsplitToggle<cr>',
        desc = 'CopilotChat - Toggle Vsplit', -- Toggle vertical split
      },
      {
        '<leader>ccv',
        ':CopilotChatVisual',
        mode = 'x',
        desc = 'CopilotChat - Open in vertical split',
      },
      {
        '<leader>ccx',
        ':CopilotChatInPlace<cr>',
        mode = 'x',
        desc = 'CopilotChat - Run in-place code',
      },
      {
        '<leader>ccf',
        '<cmd>CopilotChatFixDiagnostic<cr>', -- Get a fix for the diagnostic message under the cursor.
        desc = 'CopilotChat - Fix diagnostic',
      },
      {
        '<leader>ccr',
        '<cmd>CopilotChatReset<cr>', -- Reset chat history and clear buffer.
        desc = 'CopilotChat - Reset chat history and clear buffer',
      },
    },
  },
}
