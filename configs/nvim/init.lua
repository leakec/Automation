-- Set tab
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Set persistent undo
vim.opt.undodir = os.getenv("HOME") .. "/.vimdid"
vim.opt.undofile = true

-- Turn line numbering on, used in conjunction with sitiom/nvim-numbertoggle plugin
vim.opt.number = true

-- Coc setup below this point: ----------------------------------------------------
require('coc-config')

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
