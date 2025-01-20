-- 	This comment is needed to load the types
-- 	require("snacks")
return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = {
			enabled = true,
			notify = false,
		},
		lazygit = {
			enabled = true,
			configure = false,
		},
		quickfile = { enabled = true },
		bufdelete = { enabled = true },
	},
	keys = {
		{
			"<leader>lg",
			function()
				Snacks.lazygit()
			end,
		},
		{
			"<leader>fh",
			function()
				Snacks.lazygit.log_file()
			end,
		},
		{
			"<leader>bd",
			function()
				Snacks.bufdelete()
			end,
		},
	},
}
