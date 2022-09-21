-- Set tab
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Set persistent undo
vim.opt.undodir = os.getenv("HOME") .. "/.vimdid"
vim.opt.undofile = true

-- Turn line numbering on, used in conjunction with sitiom/nvim-numbertoggle plugin
vim.opt.number = true

-- Coc setup 
require('coc-config')

-- Code folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.api.nvim_create_autocmd({"BufWinEnter", "BufReadPost","FileReadPost"}, {
    pattern = "*",
    command = "normal zR",
    desc = "Open all tree sitterfolds.",
})

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

	-- For line numbering
	use {
	   "sitiom/nvim-numbertoggle",
	   config = function()
		  require("numbertoggle").setup()
	   end
	}

	-- Tree sitter for code folding
	use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
		ensure_installed = { "cpp", "python" },
		auto_install = true,
    }

    -- Coc setup
    use {'neoclide/coc.nvim', branch = 'release'}

    -- Telescope plugin (fuzzy sorting) + sorter for speed
    --use {
    --  'nvim-telescope/telescope.nvim',
    --    requires = { {'nvim-lua/plenary.nvim'} }
    --}
    --use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

    -- Boostrap packer 
    if packer_bootstrap then
        require('packer').sync()
    end

end)
