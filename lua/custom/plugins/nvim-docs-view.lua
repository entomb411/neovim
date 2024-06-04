return {
  {
    'amrbashir/nvim-docs-view',
    lazy = true,
    cmd = 'DocsViewToggle',
    opts = {
      position = 'right',
      width = 60,
    },
    keys = {
      {
        '<leader>cd',
        '<cmd>DocsViewToggle<CR>',
        mode = 'n',
        desc = '[D]ocs View Toggle',
      },
    },
  },
}
