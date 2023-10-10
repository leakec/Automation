if vim.g.started_by_firenvim == true then
    vim.g.firenvim_config = {
        globalSettings = { takeover = "never" },
        localSettings = {
            [".*"] = { takeover = "never" }
        }
    }

    vim.api.nvim_create_autocmd({'BufEnter'}, {
        pattern = "github*.txt",
        cmd = "set filetype=markdown"
    })

    vim.api.nvim_create_autocmd({'BufEnter'}, {
        pattern = "gitlab*.txt",
        cmd = "set filetype=markdown"
    })
end
