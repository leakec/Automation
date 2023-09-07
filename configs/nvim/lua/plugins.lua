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

    -- Copy-paste into osc52
    {'ojroques/nvim-osc52'},

    -- Sync regular register with system clipboard
    {'EtiamNullam/deferred-clipboard.nvim'},

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

    -- Working with git
    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

    {"lewis6991/gitsigns.nvim"},

    {"dinhhuy258/git.nvim"},

    -- LSP 
    { 
        "danymat/neogen", 
        dependencies = "nvim-treesitter/nvim-treesitter", 
        config = true,
        -- Uncomment next line if you want to follow only stable versions
        -- version = "*" 
    },

	-- LSP zero
    {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {                                      -- Optional
          'williamboman/mason.nvim',
          build = function()
            pcall(vim.cmd, 'MasonUpdate')
          end,
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'hrsh7th/cmp-path'},     -- Optional, for path autocomplete
        {'hrsh7th/cmp-nvim-lsp-signature-help'}, -- Optional, used for completion inside function signatures
        {'L3MON4D3/LuaSnip'},     -- Required
      }
    },

    -- COSMETIC 
    
    -- Colorscheme
    {'folke/tokyonight.nvim'},

    -- Smooth scrolling
    {'karb94/neoscroll.nvim'},

    -- Status bar
    { 'nvim-lualine/lualine.nvim', dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }},

    -- test
    -- {
    --   'deifyed/naVi',
    --   dependencies = { 
    --     {
    --       "jcdickinson/http.nvim", build = "cargo build --workspace --release",
    --     },
    --   },
    --   config = function()
    --     require("navi").setup({ })
    --   end,
    --   keys = {
    --     { "<C-PageDown>", "<cmd>lua require('navi').open()<cr>", mode = "i", desc = "NaVI prompt" },
    --     { "<C-PageDown>", "<cmd>lua require('navi').openRange()<cr>", mode = "v", desc = "NaVI prompt with context" },
    --     { "<C-PageUp>", "<cmd>lua require('navi').requestReview()<cr>", mode = "v", desc = "NaVI request review" },
    --   },
    -- },
}

