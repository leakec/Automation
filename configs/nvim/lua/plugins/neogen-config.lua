-- Docstrings
return {
    "danymat/neogen", 
    dependencies = "nvim-treesitter/nvim-treesitter", 
    config = true,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*" 
    config = function()
        require('neogen').setup {
            enabled = true,
            languages = {
                python = {
                    template = {
                        annotation_convention = "numpydoc"
                    }
                },
            }
        }

        vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", { noremap = true, silent = true })
    end
}
