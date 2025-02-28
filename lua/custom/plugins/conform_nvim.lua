return {
  -- Autoformat
  'stevearc/conform.nvim',
  lazy = true,
  opts = {
    notify_on_error = false,
    format_on_save = function()
      if vim.g.autoformat then
        return {
          timeout_ms = 500,
          lsp_fallback = true,
        }
      else
        return {}
      end
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'black' },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
      -- javascript = { { "prettierd", "prettier" } },
    },
  },
  keys = {
    {
      '<leader>cfb',
      '<cmd>lua require("conform").format({lsp_format="fallback"})<CR>',
      mode = 'n',
      desc = '[B]uffer',
    },
  },
}
