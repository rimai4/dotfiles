return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = function()
		local function cwd()
			return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
		end

		return {
			options = {
				theme = "catppuccin",
				section_separators = "",
				component_separators = "",
			},
			sections = {
				lualine_a = { "branch" },
				lualine_b = {
					{
						"filename",
						path = 1,
					},
				},
				lualine_c = {
					{
						require("grapple").statusline,
						cond = require("grapple").exists,
					},
					"diagnostics",
				},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { cwd },
			},
		}
	end,
}
