return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.0",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"debugloop/telescope-undo.nvim",
	},
	keys = {
		{ "<leader>sf", "<cmd>Telescope find_files<CR>", { desc = "[S]earch [f]iles" } },
		{ "\\", "<cmd>Telescope find_files hidden=true<CR>", { desc = "[\\] - Search files" } },
		{ "<leader>sb", "<cmd>Telescope buffers<CR>", { desc = "[S]earch [b]uffers" } },
		{ "<leader><space>", "<cmd>Telescope buffers<CR>" },
		{ "<leader>sw", "<cmd>Telescope grep_string<CR>", { desc = "[S]earch by [w]ord" } },
		{ "<leader>sg", "<cmd>Telescope live_grep<CR>", { desc = "[S]earch by [g]rep" } },
		{ "<leader>sh", "<cmd>Telescope help_tags<CR>", { desc = "[S]earch [h]elp" } },
		{ "<leader>sd", "<cmd>Telescope diagnostics<CR>", { desc = "[S]earch [d]iagnostics" } },
		{ "<leader>sc", "<cmd>Telescope command_history<CR>", { desc = "[S]earch [c]ommand history" } },
		{ "<leader>ss", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "[S]earch [s]ymbols" } },
		{
			"<leader>sS",
			"<cmd>Telescope lsp_dynamic_workspace_symbols<CR>",
			{ desc = "[S]earch workspace [S]ymbols" },
		},
		{ "<leader>sr", "<cmd>Telescope resume<CR>", { desc = "[S]earch [r]esume" } },
		{ "<leader>sR", "<cmd>Telescope lsp_references<CR>", { desc = "[S]earch workspace [R]eferences" } },
		{ "<leader>su", "<cmd>Telescope undo<CR>", { desc = "[S]earch [U]ndo" } },
		{ "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "[G]it [S]tatus" },
	},
	opts = function()
		local actions = require("telescope.actions")
		local layout = require("telescope.actions.layout")

		return {
			defaults = {
				file_ignore_patterns = { "yarn.lock", ".git", "node_modules" },
				prompt_prefix = "   ",
				selection_caret = "  ",
				layout_config = {
					horizontal = {
						prompt_position = "top",
					},
				},
				sorting_strategy = "ascending",
				mappings = {
					i = {
						["<C-t>"] = layout.toggle_preview,
						["<Esc>"] = actions.close,
					},
				},
			},
			pickers = {
				buffers = {
					sort_lastused = false,
					mappings = {
						i = {
							["<C-d>"] = "delete_buffer",
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
	end,
}
