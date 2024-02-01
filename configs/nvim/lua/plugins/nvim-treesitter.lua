-- Tree sitter for code folding
return {
    {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        ensure_installed = { "cpp", "python" },
        auto_install = true,
        config = function()
            require('nvim-treesitter.configs').setup {
                auto_install = true,
            }
        end
    },

    {
        'nvim-treesitter/nvim-treesitter-context',
        config = function()
            local tc = require("treesitter-context")
            tc.setup({enable=false})
            vim.keymap.set("n", "<leader>gc", function() tc.go_to_context(vim.v.count1) end, { silent = true })
            vim.keymap.set("n", "<leader>tc", function() vim.cmd.TSContextToggle() end, { silent = true })
        end
    }
}
