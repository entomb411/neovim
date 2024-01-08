return {
  -- disable lspconfig for rust_analyzer
  { "neovim/nvim-lspconfig", ft = { "rust" }, config = function() end },
  {
    "mrcjkb/rustaceanvim",
    version = "^3", -- Recommended
    ft = { "rust" },
  },
}
