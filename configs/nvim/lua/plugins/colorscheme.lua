-- Colorscheme
return {
    {
        'zaldih/themery.nvim',
        priority=100,
        config = function()
            require("themery").setup({
                themes = {"tokyonight-night", "tokyonight-storm", "catppuccin-mocha", "catppuccin-frappe", "catppuccin-macchiato", "cyberdream", "eldritch", "rose-pine", "dracula"},
                globalAfter = [[require("user.functions").ExportColors(true)]]
            })
        end
    },
    {
        'folke/tokyonight.nvim',

        config = function()
            require("tokyonight").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
                light_style = "day", -- The theme is used when the background is set to light
                transparent = true, -- Enable this to disable setting the background color
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = true },
                    keywords = { italic = true },
                    functions = {},
                    variables = {},
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "dark", -- style for sidebars, see below
                    floats = "dark", -- style for floating windows
                },
                sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
                day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
                hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
                dim_inactive = false, -- dims inactive windows
                lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

                --- You can override specific color groups to use other groups or a hex color
                --- function will be called with a ColorScheme table
                ---@param colors ColorScheme
                on_colors = function(colors) end,

                --- You can override specific highlights to use other groups or a hex color
                --- function will be called with a Highlights and ColorScheme table
                ---@param highlights Highlights
                ---@param colors ColorScheme
                on_highlights = function(highlights, colors) end,
            })

            --require('lualine').setup {
                --  options = {
                    --    -- ... your lualine config
                    --    theme = 'tokyonight-night'
                    --    -- ... your lualine config
                    --  }
                    --}

                    vim.cmd[[colorscheme tokyonight-night]]
                end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- latte, frappe, macchiato, mocha
                background = { -- :h background
                    light = "latte",
                    dark = "mocha",
                },
                transparent_background = true, -- disables setting the background color.
                show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
                term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
                dim_inactive = {
                    enabled = false, -- dims the background color of inactive window
                    shade = "dark",
                    percentage = 0.15, -- percentage of the shade to apply to the inactive window
                },
                no_italic = false, -- Force no italic
                no_bold = false, -- Force no bold
                no_underline = false, -- Force no underline
                styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
                    comments = { "italic" }, -- Change the style of comments
                    conditionals = { "italic" },
                    loops = {},
                    functions = {},
                    keywords = {},
                    strings = {},
                    variables = {},
                    numbers = {},
                    booleans = {},
                    properties = {},
                    types = {},
                    operators = {},
                    -- miscs = {}, -- Uncomment to turn off hard-coded styles
                },
                color_overrides = {},
                custom_highlights = {},
                default_integrations = true,
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    treesitter = true,
                    notify = false,
                    mini = {
                        enabled = true,
                        indentscope_color = "",
                    },
                    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
                },
            })
        end
    },
    {
        "scottmckendry/cyberdream.nvim",
        config = function()
            require("cyberdream").setup({
                -- Enable transparent background
                transparent = true,

                -- Enable italics comments
                italic_comments = true,

                -- Replace all fillchars with ' ' for the ultimate clean look
                hide_fillchars = false,

                -- Modern borderless telescope theme - also applies to fzf-lua
                borderless_telescope = true,

                -- Set terminal colors used in `:terminal`
                terminal_colors = true,

                -- Use caching to improve performance - WARNING: experimental feature - expect the unexpected!
                -- Early testing shows a 60-70% improvement in startup time. YMMV. Disables dynamic light/dark theme switching.
                cache = false, -- generate cache with :CyberdreamBuildCache and clear with :CyberdreamClearCache

                theme = {
                    variant = "default", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`
                    -- highlights = {
                    --     -- Highlight groups to override, adding new groups is also possible
                    --     -- See `:h highlight-groups` for a list of highlight groups or run `:hi` to see all groups and their current values

                    --     -- Example:
                    --     Comment = { fg = "#696969", bg = "NONE", italic = true },

                    --     -- Complete list can be found in `lua/cyberdream/theme.lua`
                    -- },

                    -- Override a highlight group entirely using the color palette
                    -- overrides = function(colors) -- NOTE: This function nullifies the `highlights` option
                    --     -- Example:
                    --     return {
                    --         Comment = { fg = colors.green, bg = "NONE", italic = true },
                    --         ["@property"] = { fg = colors.magenta, bold = true },
                    --     }
                    -- end,

                    -- Override a color entirely
                    --colors = {
                    --    For a list of colors see `lua/cyberdream/colours.lua`
                    --    Example:
                    --    bg = "#000000",
                    --    green = "#00ff00",
                    --    magenta = "#ff00ff",
                    --},
                },

                -- Disable or enable colorscheme extensions
                extensions = {
                    telescope = true,
                    notify = true,
                    mini = true,
                },
            })
        end
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                variant = "auto", -- auto, main, moon, or dawn
                dark_variant = "main", -- main, moon, or dawn
                dim_inactive_windows = false,
                extend_background_behind_borders = true,

                enable = {
                    terminal = true,
                    legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
                    migrations = true, -- Handle deprecated options automatically
                },

                styles = {
                    bold = true,
                    italic = true,
                    transparency = true,
                },

                groups = {
                    border = "muted",
                    link = "iris",
                    panel = "surface",

                    error = "love",
                    hint = "iris",
                    info = "foam",
                    note = "pine",
                    todo = "rose",
                    warn = "gold",

                    git_add = "foam",
                    git_change = "rose",
                    git_delete = "love",
                    git_dirty = "rose",
                    git_ignore = "muted",
                    git_merge = "iris",
                    git_rename = "pine",
                    git_stage = "iris",
                    git_text = "rose",
                    git_untracked = "subtle",

                    h1 = "iris",
                    h2 = "foam",
                    h3 = "rose",
                    h4 = "gold",
                    h5 = "pine",
                    h6 = "foam",
                },

                -- palette = {
                --     -- Override the builtin palette per variant
                --     -- moon = {
                --         --     base = '#18191a',
                --         --     overlay = '#363738',
                --         -- },
                --     },

                --     highlight_groups = {
                --         -- Comment = { fg = "foam" },
                --         -- VertSplit = { fg = "muted", bg = "muted" },
                --     },

                --     before_highlight = function(group, highlight, palette)
                --         -- Disable all undercurls
                --         -- if highlight.undercurl then
                --         --     highlight.undercurl = false
                --         -- end
                --         --
                --         -- Change palette colour
                --         -- if highlight.fg == palette.pine then
                --         --     highlight.fg = palette.foam
                --         -- end
                --     end,
            })

        end
    },
    {
        "eldritch-theme/eldritch.nvim",
        config = function()
            require("eldritch").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                transparent = true, -- Enable this to disable setting the background color
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = true },
                    keywords = { italic = true },
                    functions = {},
                    variables = {},
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "dark", -- style for sidebars, see below
                    floats = "dark", -- style for floating windows
                },
                sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
                hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
                dim_inactive = false, -- dims inactive windows, transparent must be false for this to work
                lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

                --- You can override specific color groups to use other groups or a hex color
                --- function will be called with a ColorScheme table
                ---@param colors ColorScheme
                on_colors = function(colors) end,

                --- You can override specific highlights to use other groups or a hex color
                --- function will be called with a Highlights and ColorScheme table
                ---@param highlights Highlights
                ---@param colors ColorScheme
                on_highlights = function(highlights, colors) end,
            })

        end
    },
    {
        'Mofiqul/dracula.nvim',
        config = function()
            require("dracula").setup({
                -- show the '~' characters after the end of buffers
                show_end_of_buffer = true, -- default false
                -- use transparent background
                transparent_bg = true, -- default false
                -- set custom lualine background color
                lualine_bg_color = "#44475a", -- default nil
                -- set italic comment
                italic_comment = true, -- default false
                -- overrides the default highlights with table see `:h synIDattr`
                overrides = {},
                -- You can use overrides as table like this
                -- overrides = {
                    --   NonText = { fg = "white" }, -- set NonText fg to white
                    --   NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
                    --   Nothing = {} -- clear highlight of Nothing
                    -- },
                    -- Or you can also use it like a function to get color from theme
                    -- overrides = function (colors)
                        --   return {
                            --     NonText = { fg = colors.white }, -- set NonText fg to white of theme
                            --   }
                            -- end,
            })

        end
    },
}
