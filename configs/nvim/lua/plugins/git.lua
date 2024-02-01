return {
    {
        "dinhhuy258/git.nvim",

        config = function()
            require('git').setup({
                default_mappings = true, -- NOTE: `quit_blame` and `blame_commit` are still merged to the keymaps even if `default_mappings = false`

                keymaps = {
                    -- Open blame window
                    blame = "<Leader>gb",
                    -- Close blame window
                    quit_blame = "q",
                    -- Open blame commit
                    blame_commit = "<CR>",
                    -- Open file/folder in git repository
                    browse = "<Leader>go",
                    -- Open pull request of the current branch
                    open_pull_request = "<Leader>gp",
                    -- Create a pull request with the target branch is set in the `target_branch` option
                    create_pull_request = "<Leader>gn",
                    -- Opens a new diff that compares against the current index
                    diff = "<Leader>gd",
                    -- Close git diff
                    diff_close = "<Leader>gD",
                    -- Revert to the specific commit
                    revert = "<Leader>gr",
                    -- Revert the current file to the specific commit
                    revert_file = "<Leader>gR",
                },
                -- Default target branch when create a pull request
                target_branch = "master",
                -- Private gitlab hosts, if you use a private gitlab, put your private gitlab host here
                private_gitlabs = { "https://xxx.git.com" }
            })
        end
    },

    {
        "lewis6991/gitsigns.nvim",
        config =  function()
            require('gitsigns').setup({
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map('n', ']c', function()
                        if vim.wo.diff then return ']c' end
                        vim.schedule(function() gs.next_hunk() end)
                        return '<Ignore>'
                    end, {expr=true})

                    map('n', '[c', function()
                        if vim.wo.diff then return '[c' end
                        vim.schedule(function() gs.prev_hunk() end)
                        return '<Ignore>'
                    end, {expr=true})

                    -- Actions
                    map('n', '<leader>hs', gs.stage_hunk)
                    map('n', '<leader>hr', gs.reset_hunk)
                    map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
                    map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
                    map('n', '<leader>hS', gs.stage_buffer)
                    map('n', '<leader>hu', gs.undo_stage_hunk)
                    map('n', '<leader>hR', gs.reset_buffer)
                    map('n', '<leader>hp', gs.preview_hunk)
                    map('n', '<leader>hb', function() gs.blame_line{full=true} end)
                    map('n', '<leader>tb', gs.toggle_current_line_blame)
                    map('n', '<leader>hd', gs.diffthis)
                    map('n', '<leader>hD', function() gs.diffthis('~') end)
                    map('n', '<leader>td', gs.toggle_deleted)

                    -- Text object
                    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
                end
            })
        end
    },


    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    }
}
