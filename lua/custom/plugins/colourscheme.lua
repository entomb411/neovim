return {
  {
    'eldritch-theme/eldritch.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.opt.background = 'dark'
      vim.cmd.colorscheme 'eldritch'
    end,
  },
  {
    'folke/tokyonight.nvim',
    lazy = true,
    event = "User LazyColorscheme",
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      -- vim.cmd.colorscheme 'tokyonight-night'

      -- You can configure highlights by doing something like
      vim.cmd.hi 'Comment gui=none'
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = true,
    event = "User LazyColorscheme",
  },
  {
    "joshdick/onedark.vim",
    lazy = true,
    event = "User LazyColorscheme",
  },
  {
    "Mofiqul/dracula.nvim",
    lazy = true,
    event = "User LazyColorscheme",
  },
  {
    "catppuccin/nvim",
    lazy = true,
    event = "User LazyColorscheme",
  },
  {
    "bluz71/vim-moonfly-colors",
    lazy = true,
    event = "User LazyColorscheme",
  },
  {
    "bluz71/vim-nightfly-colors",
    lazy = true,
    event = "User LazyColorscheme",
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    event = "User LazyColorscheme",
  },
}
