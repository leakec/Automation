function ExportColorsKitty()
    local fn = vim.fn
    local filename = os.getenv("HOME") .. "/.config/kitty/nvim_export.conf"
    local file = io.open(filename, "w")
    io.output(file)
    io.write("# vim:ft=kitty" .. "\n\n")
    io.write("# exported from " .. vim.g.colors_name .. "\n\n")
    local fg = fn.synIDattr(fn.hlID("Normal"), "fg")
    local bg = fn.synIDattr(fn.hlID("Normal"), "bg")
    io.write("foreground " .. fg .. "\n")
    io.write("background " .. bg .. "\n")
    io.write("selection_foreground " .. bg .. "\n")
    io.write("selection_background " .. fg .. "\n")
    for i = 0,15 do
        local var = "g:terminal_color_" .. tostring(i)
        if fn.exists(var) == 1 then
            local tc = fn.eval(var)
            io.write("color" .. tostring(i) .. " " .. tc .. "\n")
            if i == 2 then
                io.write("cursor " .. tc .. "\n")
            end
        end
    end
    io.close(file)
    print("Colors exported to " .. filename)
end

function ExportColorsTmux()
    local fn = vim.fn
    local filename = os.getenv("HOME") .. "/.tmux/plugins/tmux/catppuccin-nvim.tmuxtheme"
    -- local filename = os.getenv("HOME") .. "/.tmux/plugins/tmux/test.tmuxtheme"
    local file = io.open(filename, "w")
    io.output(file)
    local fg = fn.synIDattr(fn.hlID("Normal"), "fg")
    local bg = fn.synIDattr(fn.hlID("Normal"), "bg")
    if bg == "" then
        bg = "#000000"
    end
    io.write("thm_fg=\"" .. fg .. "\"\n")
    io.write("thm_bg=\"" .. bg .. "\"\n")

    local colors = {}
    colors["cyan"] = 14
    colors["black"] = 0
    colors["gray"] = 8
    colors["magenta"] = 5
    colors["pink"] = 13
    colors["red"] = 9
    colors["green"] = 10
    colors["yellow"] = 11
    colors["blue"] = 4
    colors["orange"] = 3
    colors["black4"] = 8

    for my_color,i in pairs(colors) do
        local var = "g:terminal_color_" .. tostring(i)
        if fn.exists(var) == 1 then
            local tc = fn.eval(var)
            io.write("thm_" .. tostring(my_color) .. "=\"" .. tc .. "\"\n")
        end
    end
    io.close(file)
    print("Colors exported to " .. filename)
end
