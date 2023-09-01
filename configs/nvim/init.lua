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
function codeFolding()
    if vim.api.nvim_buf_line_count(0) < 50000 then
        -- This is really slow for large buffers, so only run it on small ones 
        vim.opt.foldmethod = "expr" 
        vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    end
end

vim.api.nvim_create_autocmd({"BufWinEnter", "BufEnter"}, {
    callback=codeFolding
})

-- Automatically unfold everything
vim.api.nvim_create_autocmd({"BufWinEnter", "BufReadPost","FileReadPost"}, {
    pattern = "*",
    command = "normal zR",
    desc = "Open all tree sitterfolds.",
})

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

-- Colorscheme (do this first so others pick it up)
if isModuleAvailable("tokyonight") then
    require('tokyonight-config')

    -- Set colors based on terminal
    --vim.opt.termguicolors = true
end

-- LSP setup

-- CoC setup
--require('coc-config')

-- LSP zero
if isModuleAvailable("lsp-zero") then
    require("lsp-zero-config")
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

-- Telescope setup
if isModuleAvailable("nvim-treesitter") then
    require("nvim-treesitter-config")
end

-- Gitsigns setup
if isModuleAvailable("gitsigns") then
    require("gitsigns-config")
end

-- Neogen
if isModuleAvailable("neogen") then
    require("neogen-config")
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

-- Status line 
if isModuleAvailable("lualine") then
    require('lualine-config')
end

-- USER FUNCTIONS
if isModuleAvailable("user.functions") then
    require('user.functions')
end

