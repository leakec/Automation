-- LSP
return {

    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'hrsh7th/cmp-path'},     -- Optional, for path autocomplete
        {'hrsh7th/cmp-nvim-lsp-signature-help'}, -- Optional, used for completion inside function signatures
        {'L3MON4D3/LuaSnip'},     -- Required

        -- Formatting
        {'mhartington/formatter.nvim'},
    },
    config = function()
        local lsp = require('lsp-zero').preset({})
        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {'pyright', 'clangd', 'tsserver', 'rust_analyzer'},
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({})
                end,
                -- this is the "custom handler" for `lua_ls`
                lua_ls = function()
                    local lua_opts = lsp.nvim_lua_ls()
                    require('lspconfig').lua_ls.setup(lua_opts)
                end,
            }
        })

        lsp.on_attach(function(client, bufnr)
            lsp.default_keymaps({buffer = bufnr})
        end)

        -- You need to setup `cmp` after lsp-zero
        local cmp = require('cmp')

        cmp.setup({
            -- Menu is hidden by default, invoked only when I call it
            completion = {
                autocomplete = false,
            },

            -- Completion sources
            sources = {
                {name = 'nvim_lsp'},
                {name = 'nvim_lsp_signature_help'},
                {name = 'path'},
            },

            -- Key bindings
            mapping = cmp.mapping.preset.insert({
                -- `Enter` key to confirm completion
                ['<CR>'] = cmp.mapping.confirm({select = false}),

                -- Ctrl+K to trigger completion menu
                ['<C-K>'] = cmp.mapping.complete(),

                -- Select previous and next item
                ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                ['<Tab>'] = cmp.mapping.select_next_item(),

                -- Navigate between snippet placeholder
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
            })
        })

        -- Formatting setup
        local formatter = require('formatter')
        formatter.setup({
            logging=true,
            log_level = vim.log.levels.TRACE,
            filetype={python={require("formatter.filetypes.python").black}}
        })

        vim.api.nvim_set_keymap('n', 'gv', ':vsplit | lua vim.lsp.buf.definition()<CR>', {silent=true})
        vim.keymap.set('i', '<c-K>', function() lsp.buf.signature_help() end, {silent=true})
        if vim.lsp.inlay_hint then
            vim.keymap.set('n', '<leader>th', function()
            vim.lsp.inlay_hint(0, nil)
            end, { desc = 'Toggle Inlay Hints' })
        end
        
    end
}
