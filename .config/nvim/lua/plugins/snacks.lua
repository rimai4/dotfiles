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
			layout = {
				preview = false, -- disable all previewers by default. can be enabled per previewer
			},
			sources = { explorer = { layout = { layout = { position = "right" } } } },
			win = {
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
			"<leader>sn",
			function()
				Snacks.picker.files({
					hidden = true,
					dirs = { "~/dotfiles/.config/nvim" },
				})
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
				Snacks.picker.lsp_references({
					layout = {
						preview = true,
					},
				})
			end,
		},
		{
			"<leader>gs",
			function()
				Snacks.picker.git_status({
					layout = {
						preview = true,
					},
				})
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
				Snacks.picker.undo({
					layout = {
						preview = true,
					},
				})
			end,
		},
		{
			"<leader>fe",
			function()
				Snacks.picker.explorer()
			end,
		},
	},
}
