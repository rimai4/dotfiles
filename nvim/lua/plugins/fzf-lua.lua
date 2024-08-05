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
		local utils = require("fzf-lua").utils
		local actions = require("fzf-lua").actions

		local function hl_validate(hl)
			return not utils.is_hl_cleared(hl) and hl or nil
		end

		return {
			winopts = {
				width = 0.8,
				height = 0.9,
				preview = {
					hidden = "nohidden",
					vertical = "up:45%",
					horizontal = "right:50%",
					layout = "flex",
					flip_columns = 120,
					delay = 10,
					winopts = {
						number = false,
					},
				},
			},
			keymap = {
				builtin = {
					["<C-d>"] = "preview-page-down",
					["<C-u>"] = "preview-page-up",
				},
				fzf = {
					["ctrl-t"] = "toggle-all",
				},
			},
			fzf_colors = {
				["fg"] = { "fg", "TelescopeNormal" },
				["bg"] = { "bg", "TelescopeNormal" },
				["hl"] = { "fg", "TelescopeMatching" },
				["fg+"] = { "fg", "TelescopeSelection" },
				["bg+"] = { "bg", "TelescopeSelection" },
				["hl+"] = { "fg", "TelescopeMatching" },
				["info"] = { "fg", "TelescopeMultiSelection" },
				["border"] = { "fg", "TelescopeBorder" },
				["gutter"] = { "bg", "TelescopeNormal" },
				["query"] = { "fg", "TelescopePromptNormal" },
				["prompt"] = { "fg", "TelescopePromptPrefix" },
				["pointer"] = { "fg", "TelescopeSelectionCaret" },
				["marker"] = { "fg", "TelescopeSelectionCaret" },
				["header"] = { "fg", "TelescopeTitle" },
			},
			hls = {
				normal = hl_validate("TelescopeNormal"),
				border = hl_validate("TelescopeBorder"),
				title = hl_validate("TelescopePromptTitle"),
				help_normal = hl_validate("TelescopeNormal"),
				help_border = hl_validate("TelescopeBorder"),
				preview_normal = hl_validate("TelescopeNormal"),
				preview_border = hl_validate("TelescopeBorder"),
				preview_title = hl_validate("TelescopePreviewTitle"),
				-- builtin preview only
				cursor = hl_validate("Cursor"),
				cursorline = hl_validate("TelescopeSelection"),
				cursorlinenr = hl_validate("TelescopeSelection"),
				search = hl_validate("IncSearch"),
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
			defaults = {
				git_icons = false,
				file_icons = false,
			},
		}
	end,
}
