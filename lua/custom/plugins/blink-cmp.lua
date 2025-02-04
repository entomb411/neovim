return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { { 'giuxtaposition/blink-cmp-copilot', lazy = true }, { 'rafamadriz/friendly-snippets', lazy = true } },

  lazy = true,
  event = 'VeryLazy',
  -- use a release tag to download pre-built binaries
  version = '*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- See the full "keymap" documentation for information on defining your own keymap.
    keymap = { preset = 'default' },

    appearance = {
      -- Sets the fallback highlight groups to nvim-cmp's highlight groups
      -- Useful for when your theme doesn't support blink.cmp
      -- Will be removed in a future release
      use_nvim_cmp_as_default = true,
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono',
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
      providers = {
        copilot = {
          name = 'copilot',
          module = 'blink-cmp-copilot',
          score_offset = 100,
          async = true,
        },
      },
    },
  },
  opts_extend = { 'sources.default' },
  -- Use Alt-N to accept the Nth item in the completion list.
  -- Disable it for now because they tend to conflict with existing keymaps in my terminals/shells.
  keymap = {
    preset = 'default',
    -- ['<A-1>'] = { function(cmp) cmp.accept { index = 1 } end, },
    -- ['<A-2>'] = { function(cmp) cmp.accept { index = 2 } end, },
    -- ['<A-3>'] = { function(cmp) cmp.accept { index = 3 } end, },
    -- ['<A-4>'] = { function(cmp) cmp.accept { index = 4 } end, },
    -- ['<A-5>'] = { function(cmp) cmp.accept { index = 5 } end, },
    ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
    ['<C-up>'] = { 'scroll_documentation_up', 'fallback' },
    ['<C-down>'] = { 'scroll_documentation_down', 'fallback' },
  },
  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 500,
    },
    DISABLED_menu = {
      draw = {
        columns = { { 'item_idx' }, { 'kind_icon' }, { 'label', 'label_description', gap = 1 } },
        components = {
          DISABLED_item_idx = {
            text = function(ctx)
              local ret_text = ctx.idx >= 6 and ' ' or tostring(ctx.idx)
              -- Print ret_text for debugging
              -- require("noice").log("ret_text", ret_text)
              return ret_text
            end,
            highlight = 'BlinkCmpItemIdx', -- optional, only if you want to change its color
          },
        },
        -- treesitter = { 'lsp' },
      },
    },
  },
  signature = { enabled = true },
}
