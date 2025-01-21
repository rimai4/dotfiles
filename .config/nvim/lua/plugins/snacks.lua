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
		picker = {
			win = {
				-- input window
				input = {
					keys = {
						["<Esc>"] = { "close", mode = { "n", "i" } },
					},
				},
				preview = {
					wo = {
						number = false,
					},
				},
			},
			formatters = {
				file = {
					filename_first = true,
				},
			},
		},
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
		{
			"<leader>sf",
			function()
				Snacks.picker.files({ hidden = true })
			end,
		},
		{
			"gb",
			function()
				Snacks.picker.buffers()
			end,
		},
		{
			"<leader>sg",
			function()
				Snacks.picker.grep()
			end,
		},
		{
			"<leader>sw",
			function()
				Snacks.picker.grep_word()
			end,
		},
		{
			"<leader>sh",
			function()
				Snacks.picker.help()
			end,
		},
		{
			"<leader>sr",
			function()
				Snacks.picker.resume()
			end,
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
		},
		{
			"<leader>gs",
			function()
				Snacks.picker.git_status()
			end,
		},
		{
			"<leader>ss",
			function()
				Snacks.picker.lsp_symbols()
			end,
		},
		{
			"<leader>sS",
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
		},
		{
			"<leader>sc",
			function()
				Snacks.picker.command_history()
			end,
		},
		{
			"<leader>/",
			function()
				Snacks.picker.lines()
			end,
		},
		{
			"<leader>su",
			function()
				Snacks.picker.undo()
			end,
		},
	},
}
