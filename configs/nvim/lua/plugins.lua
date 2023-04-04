return {
	-- For synchronizing nvim across tmux 
	{
		"aserowy/tmux.nvim",
		config = function() require("tmux").setup() end
	},

    -- NAVIGATION
    -- Store last position when closing a file
    'farmergreg/vim-lastplace',

	-- For code traversal
	'ggandor/leap.nvim',

	-- For line numbering
	{"sitiom/nvim-numbertoggle"},

    -- Navigating the jump list
    {
    "cbochs/portal.nvim",
        dependencies = {
            "cbochs/grapple.nvim",  -- Optional: provides the "grapple" query item
            "ThePrimeagen/harpoon", -- Optional: provides the "harpoon" query item
        },
    },

    -- Telescope plugin (fuzzy sorting) + sorter for speed
    {
      'nvim-telescope/telescope.nvim',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },

    {'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },

    -- CODE VISUALIZATION
	-- Tree sitter for code folding
	{
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
		ensure_installed = { "cpp", "python" },
		auto_install = true,
    },

    -- Julia editing
    {'JuliaEditorSupport/julia-vim'},

    -- LSP 
    -- Coc setup
    {'neoclide/coc.nvim', branch = 'release'},

	-- LSP setup
	--{
	--  'VonHeikemen/lsp-zero.nvim',
	--  dependencies = {
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

    -- COSMETIC 
    
    -- Colorscheme
    'folke/tokyonight.nvim',

    -- Smooth scrolling
    'karb94/neoscroll.nvim',

    -- Status bar
    { 'nvim-lualine/lualine.nvim', dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }}
}

