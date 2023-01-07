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

-- Install packer for plugins
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Setup plugins
-- coc setup for LSP
return require('packer').startup(function(use)

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Store last position when closing a file
    use 'farmergreg/vim-lastplace'

	-- For code traversal
	use 'ggandor/leap.nvim'

	-- For synchronizing nvim across tmux 
	use {
		"aserowy/tmux.nvim",
		config = function() require("tmux").setup() end
	}

	-- For line numbering
	use {"sitiom/nvim-numbertoggle"}

	-- Tree sitter for code folding
	use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
		ensure_installed = { "cpp", "python" },
		auto_install = true,
    }

    -- Coc setup
    use {'neoclide/coc.nvim', branch = 'release'}

	-- LSP setup
	--use {
	--  'VonHeikemen/lsp-zero.nvim',
	--  requires = {
	--		-- LSP Support
	--		{'neovim/nvim-lspconfig'},
	--		{'williamboman/mason.nvim'},
	--		{'williamboman/mason-lspconfig.nvim'},

	--		-- Autocompletion
	--		{'hrsh7th/nvim-cmp'},
	--		{'hrsh7th/cmp-buffer'},
	--		{'hrsh7th/cmp-path'},
	--		{'saadparwaiz1/cmp_luasnip'},
	--		{'hrsh7th/cmp-nvim-lsp'},
	--		{'hrsh7th/cmp-nvim-lua'},

	--		-- Snippets
	--		{'L3MON4D3/LuaSnip'},
	--		{'rafamadriz/friendly-snippets'},
	--	  }
	--	}

    -- Telescope plugin (fuzzy sorting) + sorter for speed
    use {
      'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }


    -- Cosmetic packages

    -- Smooth scrolling
    use 'karb94/neoscroll.nvim'

    -- Boostrap packer 
    if packer_bootstrap then
        require('packer').sync()
    end

end)
