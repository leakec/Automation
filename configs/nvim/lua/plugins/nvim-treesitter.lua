-- Tree sitter for code folding
return {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    ensure_installed = { "cpp", "python" },
    auto_install = true,
    config = function()
        require('nvim-treesitter.configs').setup {
            auto_install = true,
        }
    end
}
