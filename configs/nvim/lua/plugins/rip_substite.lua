return {
    -- lazy.nvim
	"chrisgrieser/nvim-rip-substitute",
	cmd = "RipSubstitute",
	keys = {
		{
			"<leader>fs",
			function() require("rip-substitute").sub() end,
			mode = { "n", "x" },
			desc = " rip substitute",
		},
	},
    config = function()
        require("rip-substitute").setup({
            prefill = {
            normal = "", -- "cursorWord"|false
            visual = "selectionFirstLine", -- "selectionFirstLine"|false
            startInReplaceLineIfPrefill = false,
        }})
    end
}
