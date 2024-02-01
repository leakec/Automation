return {
    -- NAVIGATION
    -- Store last position when closing a file
    'farmergreg/vim-lastplace',

	-- For code traversal
	'ggandor/leap.nvim',

	-- For line numbering
	{"sitiom/nvim-numbertoggle"},

    -- Navigating the undo tree
    {
        "jiaoshijie/undotree",
        dependencies = "nvim-lua/plenary.nvim",
        config = true,
        keys = { -- load the plugin only when using it's keybinding:
          { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
        },
    },

    -- Copy-paste into osc52
    {'ojroques/nvim-osc52'},

    -- CODE VISUALIZATION

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
    
    -- Smooth scrolling
    {'karb94/neoscroll.nvim'},

    -- Status bar
    { 'nvim-lualine/lualine.nvim', dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }},

    -- NVIM IN BROWSER
    {
        'glacambre/firenvim',

        -- Lazy load firenvim
        -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
        lazy = not vim.g.started_by_firenvim,
        build = function()
            vim.fn["firenvim#install"](0)
        end
    }


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

