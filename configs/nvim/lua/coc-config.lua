-- TextEdit might fail if hidden is not set.
vim.o.hidden = true

-- Some servers have issues with backup files, see #649.
-- Contents of previous vimrc
vim.o.backup = false
vim.o.writebackup = false

--Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
--delays and poor user experience.
vim.o.updatetime = 300

-- Don't pass messages to |ins-completion-menu|.
vim.o.shortmess = vim.o.shortmess .. "c"

--Always show the signcolumn, otherwise it would shift the text each time
--diagnostics appear/become resolved.
vim.o.signcolumn = "number"

-- Use <Tab> and <S-Tab> to navigate the completion list in coc
vim.api.nvim_set_keymap("i", "<TAB>", "coc#pum#visible() ? coc#pum#next(1) : '<TAB>'", {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap("i", "<S-TAB>", "coc#pum#visible() ? coc#pum#prev(1) : '<C-h>'", {noremap = true, expr = true})

-- Use <C-k> to trigger completion.
vim.api.nvim_set_keymap("i", "<C-k>", "coc#refresh()", { silent = true, expr = true })

-- Make <CR> auto-select the first completion item and notify coc.nvim to
vim.api.nvim_set_keymap("i", "<CR>", "coc#pum#visible() ? coc#pum#confirm() : '<CR>'" , {silent = true, expr = true, noremap = true})

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
vim.api.nvim_set_keymap("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
vim.api.nvim_set_keymap("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})

-- GoTo code navigation.
vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)", {silent = true})
vim.api.nvim_set_keymap("n", "gv", ":call CocAction('jumpDefinition','vsplit')<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
vim.api.nvim_set_keymap("n", "gi", "<Plug>(coc-implementation)", {silent = true})
vim.api.nvim_set_keymap("n", "gr", "<Plug>(coc-reference)", {silent = true})

-- Use ga or gA for code action
vim.api.nvim_set_keymap("n", "ga", "<Plug>(coc-codeaction-line)", {})
vim.api.nvim_set_keymap("x", "ga", "<Plug>(coc-codeaction-selected)", {})
vim.api.nvim_set_keymap("n", "gA", "<Plug>(coc-codeaction)", {})

-- Use K to show documentation in preview window.
vim.api.nvim_set_keymap("n", "K", ":call CocActionAsync('doHover')<CR>", {silent = true, noremap = true})

-- Symbol renaming.
vim.api.nvim_set_keymap("n", "<leader>rn", "<Plug>(coc-rename)", {})

-- Formatting selected code.
vim.api.nvim_set_keymap("n", "<leader>f", ":CocCommand prettier.formatFile<CR>", {noremap = true})

-- Applying codeAction to the selected region.
-- Example: `<leader>aap` for current paragraph
vim.api.nvim_set_keymap("n", "<leader>a", "<Plug>(coc-codeaction-selected)", {})
vim.api.nvim_set_keymap("x", "<leader>a", "<Plug>(coc-codeaction-selected)", {})

-- Remap keys for applying codeAction to the current buffer.
vim.api.nvim_set_keymap("n", "<leader>ac", "<Plug>(coc-codeaction)", {})

-- Apply AutoFix to problem on the current line.
vim.api.nvim_set_keymap("n", "<leader>qf", "<Plug>(coc-fix-current)", {})

-- Remap <C-f> and <C-b> for scroll float windows/popups.
vim.api.nvim_set_keymap("n", "<C-f>", "coc#float#has_scroll() ? coc#float#scroll(1) : \"\\<C-f>\"", {silent = true, expr = true, noremap = true})
vim.api.nvim_set_keymap("n", "<C-b>", "coc#float#has_scroll() ? coc#float#scroll(0) : \"\\<C-b>\"", {silent = true, expr = true, noremap = true})
vim.api.nvim_set_keymap("i", "<C-f>", "coc#float#has_scroll() ? coc#float#scroll(1) : \"\\<C-f>\"", {silent = true, expr = true, noremap = true})
vim.api.nvim_set_keymap("i", "<C-b>", "coc#float#has_scroll() ? coc#float#scroll(0) : \"\\<C-b>\"", {silent = true, expr = true, noremap = true})
vim.api.nvim_set_keymap("v", "<C-f>", "coc#float#has_scroll() ? coc#float#scroll(1) : \"\\<C-f>\"", {silent = true, expr = true, noremap = true})
vim.api.nvim_set_keymap("v", "<C-b>", "coc#float#has_scroll() ? coc#float#scroll(0) : \"\\<C-b>\"", {silent = true, expr = true, noremap = true})

-- Add `:Format` command to format current buffer.
vim.api.nvim_create_user_command('Format', ":call CocAction('format')", {})

-- Add `:OR` command for organize imports of the current buffer.
vim.api.nvim_create_user_command('OR', ":call CocAction('runCommand', 'editor.action.organizeImport')", {})

-- Mappings for CoCList
-- Show all diagnostics.
vim.api.nvim_set_keymap("n", "<space>a", ":<C-u>CocList diagnostics<cr>", {silent = true, nowait = true})
-- Manage extensions.
vim.api.nvim_set_keymap("n", "<space>e", ":<C-u>CocList extensions<cr>", {silent = true, nowait = true})
-- Show commands.
vim.api.nvim_set_keymap("n", "<space>c", ":<C-u>CocList commands<cr>", {silent = true, nowait = true})
-- Find symbol of current document.
vim.api.nvim_set_keymap("n", "<space>o", ":<C-u>CocList outline<cr>", {silent = true, nowait = true})
-- Search workspace symbols.
vim.api.nvim_set_keymap("n", "<space>s", ":<C-u>CocList -I symbols<cr>", {silent = true, nowait = true})
-- Do default action for next item.
vim.api.nvim_set_keymap("n", "<space>j", ":<C-u>CocNext<CR>", {silent = true, nowait = true})
-- Do default action for previous item.
vim.api.nvim_set_keymap("n", "<space>k", ":<C-u>CocPrev<CR>", {silent = true, nowait = true})
-- Resume latest coc list.
vim.api.nvim_set_keymap("n", "<space>p", ":<C-u>CocListResume<CR>", {silent = true, nowait = true})
