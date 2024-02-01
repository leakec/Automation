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

    -- COSMETIC 
    

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

