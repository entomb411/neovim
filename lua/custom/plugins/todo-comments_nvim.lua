-- Highlight todo, notes, etc in comments
-- Keywords are:
-- FIX, FIXME, BUG, FIXIT, ISSUE
-- TODO
-- HACK
-- WARN, WARNING, XXX
-- PERF, OPTIM, PERFORMANCE, OPTIMIZE
-- NOTE, INFO
-- TEST, TESTING, PASSED, FAILED
--
-- `:TodoFzfLua` will show all todos in the project using fzf-lua.
-- `:Trouble todo` will show all todos in the project using Trouble.
return {
  'folke/todo-comments.nvim',
  lazy = true,
  event = 'VeryLazy',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = { signs = false },
  keys = {
    {
      ']t',
      function()
        require('todo-comments').jump_next()
      end,
      desc = 'Next todo comment',
    },
    {
      '[t',
      function()
        require('todo-comments').jump_prev()
      end,
      desc = 'Previous todo comment',
    },
    {
      '<leader>st',
      '<cmd>TodoFzfLua<cr>',
      desc = '[T]odo comments',
    },
  },
}
