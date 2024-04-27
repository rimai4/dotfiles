return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"debugloop/telescope-undo.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	keys = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		return {
			{ "<leader>sf", builtin.find_files, { desc = "[S]earch [f]iles" } },
			{ "<leader>sb", builtin.buffers, { desc = "[S]earch [b]uffers" } },
			{ "gb", builtin.buffers, { desc = "[g]o to [b]uffers" } },
			{ "<leader>sw", builtin.grep_string, { desc = "[S]earch by [w]ord" } },
			{ "<leader>sg", builtin.live_grep, { desc = "[S]earch by [g]rep" } },
			{ "<leader>sh", builtin.help_tags, { desc = "[S]earch [h]elp" } },
			{ "<leader>sd", builtin.diagnostics, { desc = "[S]earch [d]iagnostics" } },
			{ "<leader>sc", builtin.command_history, { desc = "[S]earch [c]ommand history" } },
			{ "<leader>ss", builtin.lsp_document_symbols, { desc = "[S]earch [s]ymbols" } },
			{
				"<leader>sS",
				builtin.lsp_dynamic_workspace_symbols,
				{ desc = "[S]earch workspace [S]ymbols" },
			},
			{
				"<leader>sr",
				builtin.resume,
				{ desc = "[S]earch [r]esume" },
			},
			{
				"<leader>sR",
				builtin.registers,
				{ desc = "[S]earch [R]egisters" },
			},
			{ "<leader>gs", builtin.git_status, desc = "[G]it [S]tatus" },
			{
				"<leader>/",
				function()
					builtin.current_buffer_fuzzy_find({
						previewer = false,
					})
				end,
				desc = "Current buffer fuzzy find",
			},
			{
				"<leader>sn",
				function()
					builtin.find_files({ cwd = vim.fn.stdpath("config") })
				end,
				{ desc = "[S]earch [n]eovim config" },
			},
			{
				"<leader>fb",
				function()
					telescope.extensions.file_browser.file_browser(require("telescope.themes").get_ivy({
						layout_config = {
							height = 0.7,
						},
					}))
				end,
				{ desc = "[F]ile [b]rowser" },
			},
			{
				"<leader>su",
				"<cmd>Telescope undo<cr>",
				{ desc = "[S]earch [u]ndo" },
			},
		}
	end,
	opts = function()
		local actions = require("telescope.actions")
		local layout = require("telescope.actions.layout")
		local fb_actions = require("telescope").extensions.file_browser.actions

		return {
			defaults = {
				file_ignore_patterns = { "yarn.lock", ".git", "node_modules" },
				prompt_prefix = "   ",
				selection_caret = "  ",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
						width = 0.85,
					},
				},
				sorting_strategy = "ascending",
				mappings = {
					i = {
						["<C-t>"] = layout.toggle_preview,
						["<C-s>"] = actions.file_split,
						["<Esc>"] = actions.close,
					},
				},
			},
			pickers = {
				oldfiles = {
					cwd_only = true,
				},
				buffers = {
					mappings = {
						i = {
							["<C-d>"] = "delete_buffer",
						},
					},
					path_display = { "tail" },
				},
			},
			extensions = {
				file_browser = {
					path = "%:p:h",
					select_buffer = true,
					hidden = true,
					mappings = {
						["i"] = {
							["<S-CR>"] = fb_actions.create,
							["<S-BS>"] = fb_actions.remove,
							["<C-h>"] = fb_actions.toggle_respect_gitignore,
						},
					},
				},
			},
		}
	end,
	config = function(_, opts)
		require("telescope").setup(opts)
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("undo")
		require("telescope").load_extension("file_browser")
	end,
}
