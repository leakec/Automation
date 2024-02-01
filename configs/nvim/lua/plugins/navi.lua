return { {} }
--[[
return {
    'deifyed/naVi',
    dependencies = { 
        {
            "jcdickinson/http.nvim", build = "cargo build --workspace --release",
        },
    },
    keys = {
        { "<C-PageDown>", "<cmd>lua require('navi').open()<cr>", mode = "i", desc = "NaVI prompt" },
        { "<C-PageDown>", "<cmd>lua require('navi').openRange()<cr>", mode = "v", desc = "NaVI prompt with context" },
        { "<C-PageUp>", "<cmd>lua require('navi').requestReview()<cr>", mode = "v", desc = "NaVI request review" },
    },
    config = function()
        local navi = require('navi')

        navi.setup({
            -- OpenAI token. Required
            -- openai_token = "<token>", -- Alternatively, use environment variable OPENAI_TOKEN=<token>
            -- OpenAI model. Optional. Default is gpt-3.5-turbo
            openai_model = "gpt-3.5-turbo",
            -- OpenAI max tokens. Optional. Default is 512
            openai_max_tokens = 512,
            -- OpenAI temperature. Optional. Default is 0.6
            openai_temperature = 0.6,
            -- Debug mode. Optional. Default is false
            debug = false, -- Alternatively, use environment variable NAVI_DEBUG=true
            -- Setup for input window 
            prompt_window = {
                border = "single",
                style = "minimal",
                relative = "editor",
            },
            -- Setup for window showing various reports
            report_window = {
                -- Specifies if the report will be shown in a vertical window or in a floating window.
                window = "floating",
                border = "single",
                style = "minimal",
                relative = "editor",
            },
        })

        -- Set keybindings
        vim.api.nvim_set_keymap('v', '<C-PageDown>', '', { callback = navi.openRange })
        vim.api.nvim_set_keymap('i', '<C-PageDown>', '', { callback = navi.open })
        vim.api.nvim_set_keymap('v', '<C-PageUp>', '', { callback = navi.requestReview })
        vim.api.nvim_set_keymap('v', '<C-End>', '', { callback = navi.explainRange })
        vim.api.nvim_set_keymap('n', '<C-End>', '', { callback = navi.openChat })
    end
}
]]--
