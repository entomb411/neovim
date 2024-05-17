-- Don't install rust-analyzer using Mason.
-- Instead install it using rustup:
-- rustup component add rust-analyzer
return {
    { 'rust-lang/rust.vim' },
    {
        'mrcjkb/rustaceanvim',
        -- version = '^4',
        branch = 'master',
        ft = { 'rust' },
    }
}
