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

          -- Show if we are recording a macro, otherwise show the names of the active LSPs.
          lualine_y = {
            function()
              local reg = vim.fn.reg_recording()
              if reg ~= '' then
                return 'Recording @' .. reg
              else
                local lsp_names = {}
                for _, client in pairs(vim.lsp.get_clients()) do
                  if client.attached_buffers[vim.api.nvim_get_current_buf()] then
                    table.insert(lsp_names, client.name)
                  end
                end
                return table.concat(lsp_names, ',')
              end
            end,
          },
        },
      }
    end,
  },
}
