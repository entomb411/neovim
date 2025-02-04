-- Largely copied from:
-- https://github.com/LazyVim/LazyVim/blob/1432f318b6b061d3da510ebd795a3292b10e636b/lua/lazyvim/plugins/extras/lang/clangd.lua#L4

return {
  -- Add C/C++ to treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = true,
    event = 'VeryLazy',
    opts = function(_, opts)
      if type(opts.ensure_installed) == 'table' then
        vim.list_extend(opts.ensure_installed, { 'c', 'cpp' })
      end
    end,
  },
  {
    'p00f/clangd_extensions.nvim',
    lazy = true,
    config = function() end,
    opts = {
      inlay_hints = {
        inline = false,
      },
      ast = {
        --These require codicons (https://github.com/microsoft/vscode-codicons)
        role_icons = {
          type = '',
          declaration = '',
          expression = '',
          specifier = '',
          statement = '',
          ['template argument'] = '',
        },
        kind_icons = {
          Compound = '',
          Recovery = '',
          TranslationUnit = '',
          PackExpansion = '',
          TemplateTypeParm = '',
          TemplateTemplateParm = '',
          TemplateParamObject = '',
        },
      },
    },
  },
}
