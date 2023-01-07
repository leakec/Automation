-- Lazy.nvim plugin loading
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup("plugins")

-- Set tab
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Set persistent undo
vim.opt.undodir = os.getenv("HOME") .. "/.vimdid"
vim.opt.undofile = true

-- Turn line numbering on, used in conjunction with sitiom/nvim-numbertoggle plugin
vim.opt.number = true

-- Split new windows to the right or below
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Bash-like tab completion
vim.o.wildmode = "longest,list,full"

---Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('yank_highlight', {}),
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup='IncSearch', timeout=300 }
  end,
})

-- Code folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.api.nvim_create_autocmd({"BufWinEnter", "BufReadPost","FileReadPost"}, {
    pattern = "*",
    command = "normal zR",
    desc = "Open all tree sitterfolds.",
})

-- CoC setup
require('coc-config')

-- Used to check if package is available 
function isModuleAvailable(name)
  if package.loaded[name] then
    return true
  else
    for _, searcher in ipairs(package.searchers or package.loaders) do
      local loader = searcher(name)
      if type(loader) == 'function' then
        package.preload[name] = loader
        return true
      end
    end
    return false
  end
end

-- Set mappings for leap
if isModuleAvailable("leap") then
    require('leap').add_default_mappings()
    require('leap').opts.highlight_unlabeled_phase_one_targets = true
end

-- Telescope setup
if isModuleAvailable("telescope") then
    require("telescope-config")
end

-- Navigating the jump list with portal
if isModuleAvailable("portal") then
    require("portal-config")
end


-- LSP setup
-- local lsp = require('lsp-zero')
-- lsp.preset('recommended')
--
-- lsp.use('pyright', {
--   settings = {
--     python = {
--       analysis = {
-- 		autoImportCompletions = true,
-- 		autoSearchPaths = true,
-- 		useLibraryCodeForTypes = true,
-- 		typeCheckingMode = 'basic',
--       }
--     }
--   }
-- })
-- lsp.setup()

-- Cosmetic packages
-- Smooth scrolling
if isModuleAvailable("neoscroll") then
    require('neoscroll-config')
end
