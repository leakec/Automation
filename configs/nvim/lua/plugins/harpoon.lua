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

                local function getPath(cmd)
                    -- Run the command
                    local handle = io.popen(cmd)
                    if handle == nil then
                        -- If the command fails then return an empty string
                        return nil
                    else
                        -- Get the result of the command. Trim it so we don't have extra whitespace.
                        local output = handle:read("*all"):gsub("^%s*(.-)%s*$", "%1")
                        handle:close()
                        local path = plenary_path:new(output)
                        -- If the command passed, make sure it is a real file
                        if path:exists() then
                            return path.filename
                        else
                            -- Otherwise, return an empty string
                            return nil
                        end
                    end
                end

                local yam_path = getPath("yamroot")
                if yam_path ~= nil then
                    -- Use the yamroot if it exists
                    return yam_path
                end

                local git_path = getPath("git rev-parse --show-toplevel")
                --print("git_path: "..git_path)
                if git_path ~= nil then
                    -- Use the git root if it exists
                    print("Using git path "..git_path)
                    return git_path
                end

                -- Fallback to vim.loop.cwd() otherwise
                return vim.loop.cwd()
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
