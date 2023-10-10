if vim.g.started_by_firenvim == true then
    vim.g.firenvim_config = {
        globalSettings = { takeover = "never" },
        localSettings = {
            [".*"] = { takeover = "never" }
        }
    }

    vim.api.nvim_create_autocmd('BufEnter', {
        pattern = "github*.txt",
        callback = function()
            local buf = vim.api.nvim_get_current_buf()
            vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
        end
    })

    vim.api.nvim_create_autocmd('BufEnter', {
        pattern = "*gitlab*.txt",
        callback = function()
            local buf = vim.api.nvim_get_current_buf()
            vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
        end
    })
end
