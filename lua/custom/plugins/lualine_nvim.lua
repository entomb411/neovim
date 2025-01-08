return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    enabled = true,
    config = function()
      require('lualine').setup {
        sections = {
          lualine_c = {
            {
              'filename',
              path = 1,
              -- cond = require('noice').api.statusline.filename.has,
              -- color = { fg = '#579e64' },
            },
          },
          -- lualine_x = {
          --   {
          --     require('noice').api.statusline.mode.get,
          --     cond = require('noice').api.statusline.mode.has,
          --     color = { fg = '#ff9e64' },
          --   },
          -- },

          -- Show if we are recording a macro
          lualine_y = {
            function()
              local reg = vim.fn.reg_recording()
              if reg ~= "" then
                return "Recording @" .. reg
              else
                return ''
              end
            end
          },
        },
      }
    end,
  },
}
