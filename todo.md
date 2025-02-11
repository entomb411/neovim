- Add/fix python formatting.
- JSON minify/prettify.

- Take a note of all the LSPs that Mason is currently handling.
   + black
   + clangd
   + lua-language-server (lua_ls)
   + marksman
   + pyright
   + stylua
- Remove Mason. Use nvim-lspconfig to set up the LSPs. Just need to ensure that the LSPs are installed on the system, which Mason would do for you.
- Remove mini picker.
- Use a different startpage (current mini.starter). Probably will use snacks dashboard.
- Split snacks and mini into different files for each module.
