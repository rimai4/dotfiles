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
				lualine_a = { "mode" },
				lualine_b = {
					{
						"filename",
						path = 1,
					},
				},
				lualine_c = {
					{
						require("grapple").key,
						cond = require("grapple").exists,
					},
				},
				lualine_x = { "diagnostics" },
				lualine_y = { cwd },
				lualine_z = { "branch" },
			},
		}
	end,
}
