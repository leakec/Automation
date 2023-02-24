function getColor( group, color_type, default_color)
    local hl = vim.api.nvim_get_hl_by_name(group, true)[color_type]
    if hl ~= nil then
        return "#"..string.format("%06x", hl)
    else
        return "#"..string.format("%06x", vim.api.nvim_get_color_by_name(default_color))
    end
end

local colors = {
	red = getColor("Error","background","Red"),
	grey = getColor("CursorLine","background","Grey"),
    black = getColor("Normal","background","Black"),
	white = getColor("Normal","foreground","White"),
	orange = getColor("Number", "foreground", "Orange"),
	green = getColor("String", "foreground", "Green"),
	light_green = getColor("Type", "foreground", "LightGreen"),
	blue = getColor("Comment", "foreground", "Blue"),
	bright_blue = getColor("Function", "foreground", "Blue"),
    cyan = getColor("Tag", "foreground", "Cyan"),
    purple = getColor("Identifier", "foreground", "Purple"),
    none = "NONE",
    fg = getColor("CurSearch","foreground","White"),
}

local theme = {
	normal = {
		a = { fg = colors.black, bg = colors.none},
		b = { fg = colors.blue, bg = colors.none },
		c = { fg = colors.white, bg = colors.none },
		z = { fg = colors.white, bg = colors.none },
	},
	insert = { a = { fg = colors.black, bg = colors.orange } },
	visual = { a = { fg = colors.black, bg = colors.green } },
	replace = { a = { fg = colors.black, bg = colors.green } },
}

local vim_icons = {
	function()
		return " "
	end,
	separator = { left = "", right = "" },
	color = { bg = colors.grey, fg = colors.blue },
}

local space = {
	function()
		return " "
	end,
	color = { bg = colors.none, fg = colors.none },
}

local filename = {
	'filename',
	color = { bg = colors.blue, fg = colors.black },
	separator = { left = "", right = "" },
}

local filetype = {
	"filetype",
	icon_only = true,
	colored = true,
	color = { bg = colors.grey },
	separator = { left = "", right = "" },
}

local filetype_tab = {
	"filetype",
	icon_only = true,
	colored = true,
	color = { bg = colors.black },
}

-- local buffer = {
-- 	require 'tabline'.tabline_buffers,
-- 	separator = { left = "", right = "" },
-- }
-- 
-- local tabs = {
-- 	require 'tabline'.tabline_tabs,
-- 	separator = { left = "", right = "" },
-- }

local fileformat = {
	'fileformat',
	color = { bg = colors.purple, fg = colors.black},
	separator = { left = "", right = "" },
}

local encoding = {
	'encoding',
	color = { bg = colors.black, fg = colors.blue },
	separator = { left = "", right = "" },
}

local branch = {
	'branch',
	color = { bg = colors.green, fg = colors.black },
	separator = { left = "", right = "" },
}

local diff = {
	"diff",
	color = { bg = colors.green, fg = colors.black },
	separator = { left = "", right = "" },
}

local modes = {
	'mode', fmt = function(str) return str:sub(1, 1) end,
	color = { bg = colors.cyan, fg = colors.black },
	separator = { left = "", right = "" },
}

-- TODO Update this to work with CoC
local function getLspName()
	local msg = 'No Active Lsp'
	local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
	local clients = vim.lsp.get_active_clients()
	if next(clients) == nil then
		return msg
	end
	for _, client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
			return "  " .. client.name
		end
	end
	return "  " .. msg
end

local dia = {
	'diagnostics',
	color = { bg = colors.black, fg = colors.white },
	separator = { left = "", right = "" },
}

local lsp = {
	function()
		return getLspName()
	end,
	separator = { left = "", right = "" },
	color = { bg = colors.red, fg = colors.black },
}

require('lualine').setup {

	options = {
		icons_enabled = true,
		theme = theme,
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},

	sections = {
		lualine_a = {
			--{ 'mode', fmt = function(str) return str:gsub(str, "  ") end },
			modes,
			--vim_icons,
			--{ 'mode', fmt = function(str) return str:sub(1, 1) end },
		},
		lualine_b = {
			space,

		},
		lualine_c = {

			filename,
			filetype,
			space,
			branch,
			diff,
		},
		lualine_x = {
			space,
		},
		lualine_y = {
			encoding,
			fileformat,
			space,
		},
		lualine_z = {
			dia,
			--lsp,
		}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {
		--lualine_a = {
		--	buffer,
		--},
		--lualine_b = {
		--},
		--lualine_c = {},
		--lualine_x = {
		--	tabs,
		--},
		--lualine_y = {
		--	space,
		--},
		--lualine_z = {
		--},
	},
	winbar = {},
	inactive_winbar = {},

}
