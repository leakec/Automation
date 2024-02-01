return {
    -- NAVIGATION
    -- Store last position when closing a file
    'farmergreg/vim-lastplace',

	-- For code traversal

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

}

