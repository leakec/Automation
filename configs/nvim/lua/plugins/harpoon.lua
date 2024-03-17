-- Harpoon 
return 
{
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        settings = {
            key = function()
                -- Try to use yamroot if it exists.
                local plenary_path = require("plenary.path")
                local handle = io.popen("yamroot")
                local output = handle:read()
                handle:close()
                local path = plenary_path:new(output)
                if path:exists() then
                    return path.path
                else
                    local handle_git = io.popen("git rev-parse --show-toplevel")
                    local output_git = handle:read()
                    handle_git:close()
                    local path_git = plenary_path:new(output_git)
                    if path_git:exists() then
                        -- Use the git root if it exists
                        return path_git.path
                    else
                        -- Fallback to vim.loop.cwd() otherwise
                        return vim.loop.cwd()
                    end
                end
            end,
        }
        local harpoon = require("harpoon")
        harpoon.setup({settings=settings})

        -- basic telescope configuration
        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
            }):find()
        end

        -- Creating keymaps
        vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
        vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        vim.keymap.set("n", "<leader>fh", function() toggle_telescope(harpoon:list()) end,
        { desc = "Open harpoon window" })

        -- Adding keymaps in the UI
        harpoon:extend({
            UI_CREATE = function(cx)
                vim.keymap.set("n", "1", function() harpoon:list():select(1) end)
                vim.keymap.set("n", "2", function() harpoon:list():select(2) end)
                vim.keymap.set("n", "3", function() harpoon:list():select(3) end)
                vim.keymap.set("n", "4", function() harpoon:list():select(4) end)

                vim.keymap.set("n", "<C-v>", function()
                    harpoon.ui:select_menu_item({ vsplit = true })
                end, { buffer = cx.bufnr })
            end,
})
    end
}
