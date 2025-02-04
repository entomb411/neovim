-- Highlight todo, notes, etc in comments
return { 'folke/todo-comments.nvim', lazy = true, event = 'VeryLazy', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } }
