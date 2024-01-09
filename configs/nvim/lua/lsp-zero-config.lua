local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

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
    mapping = {
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({select = false}),

        -- Ctrl+K to trigger completion menu
        ['<C-K>'] = cmp.mapping.complete(),

        -- Select previous and next item
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),

        -- Navigate between snippet placeholder
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
    }
})

vim.api.nvim_set_keymap('n', 'gv', ':vsplit | lua vim.lsp.buf.definition()<CR>', {silent=true})
vim.keymap.set('i', '<c-K>', function() lsp.buf.signature_help() end, {silent=true})
