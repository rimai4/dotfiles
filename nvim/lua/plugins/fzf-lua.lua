return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = function()
		local fzflua = require("fzf-lua")

		return {
			{ "gb", fzflua.buffers },
			{ "gr", fzflua.lsp_references },
			{ "<leader>sf", fzflua.files },
			{ "<leader>sw", fzflua.grep_cword },
			{ "<leader>sg", fzflua.live_grep },
			{ "<leader>sh", fzflua.helptags },
			{ "<leader>sc", fzflua.command_history },
			{ "<leader>ss", fzflua.lsp_document_symbols },
			{ "<leader>sS", fzflua.lsp_live_workspace_symbols },
			{ "<leader>sr", fzflua.resume },
			{ "<leader>gs", fzflua.git_status },
			{
				"<leader>/",
				function()
					fzflua.lgrep_curbuf({ previewer = false })
				end,
			},
			{
				"<leader>sn",
				function()
					fzflua.files({ cwd = "~/dotfiles/nvim" })
				end,
			},
		}
	end,
	opts = function()
		local actions = require("fzf-lua").actions

		return {
			defaults = {
				git_icons = false,
				file_icons = false,
			},
			keymap = {
				builtin = {
					["<C-d>"] = "preview-page-down",
					["<C-u>"] = "preview-page-up",
				},
			},
			actions = {
				files = {
					["default"] = actions.file_edit_or_qf,
					["ctrl-s"] = actions.file_split,
					["ctrl-v"] = actions.file_vsplit,
					["ctrl-q"] = actions.buf_sel_to_qf,
				},
				buffers = {
					["default"] = actions.buf_edit,
					["ctrl-s"] = actions.buf_split,
					["ctrl-v"] = actions.buf_vsplit,
				},
			},
			winopts = {
				width = 0.8,
				height = 0.9,
				preview = {
					horizontal = "right:50%",
					hidden = "nohidden",
					layout = "flex",
					flip_columns = 140,
					delay = 10,
					winopts = {
						number = false,
					},
				},
			},
			-- Removed all non-existing telescope highlights that were present in telescope profile
			-- See https://github.com/ibhagwan/fzf-lua/blob/main/lua/fzf-lua/profiles/telescope.lua
			fzf_colors = {
				["hl"] = { "fg", "TelescopeMatching" },
				["fg+"] = { "fg", "TelescopeSelection" },
				["bg+"] = { "bg", "TelescopeSelection" },
				["hl+"] = { "fg", "TelescopeMatching" },
				["border"] = { "fg", "TelescopeBorder" },
				["pointer"] = { "fg", "TelescopeSelectionCaret" },
				["marker"] = { "fg", "TelescopeSelectionCaret" },
			},
			lsp = {
				symbols = {
					-- false: disable,    1: icon+kind
					--     2: icon only,  3: kind only
					symbol_style = 1,
					child_prefix = false,
				},
			},
		}
	end,
}
