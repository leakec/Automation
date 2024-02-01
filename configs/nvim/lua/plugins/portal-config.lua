-- Navigating the jump list
--
return {
    "cbochs/portal.nvim",
    dependencies = {
        "cbochs/grapple.nvim",  -- Optional: provides the "grapple" query item
        "ThePrimeagen/harpoon", -- Optional: provides the "harpoon" query item
    },

    config = function()
        vim.keymap.set("n", "<leader>o", "<cmd>Portal jumplist backward<cr>")
        vim.keymap.set("n", "<leader>i", "<cmd>Portal jumplist forward<cr>")
    end
}
