-- Use :FloatermNew to open a terminal window, use :FloatermToggle to hide/reopen that. The filetype of the terminal buffer is floaterm.
--
-- If you've opened multiple floaterm instances, they will be attached to a double-circular-linkedlist. Then you can use :FloatermNext or : FloatermPrev to switch between them.
--
-- ❗️Note: Long-running jobs (e.g. yarn watch) inside the builtin terminal would probably slowdown your operation. It's recommended to put them into the external terminals.

return {
  'voldikss/vim-floaterm',
}
