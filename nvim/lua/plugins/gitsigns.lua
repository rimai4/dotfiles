return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map("n", "]h", function()
				if vim.wo.diff then
					return "]h"
				end
				vim.schedule(function()
					gs.next_hunk()
				end)
				return "<Ignore>"
			end, { expr = true })

			map("n", "[h", function()
				if vim.wo.diff then
					return "[h"
				end
				vim.schedule(function()
					gs.prev_hunk()
				end)
				return "<Ignore>"
			end, { expr = true })

			-- Actions
			map("n", "<leader>gb", gs.toggle_current_line_blame, { desc = "Toggle [G]it [B]lame" })
			map("n", "<leader>gr", gs.reset_hunk, { desc = "[G]it [r]eset hunk" })
			map("n", "<leader>gR", gs.reset_buffer, { desc = "[G]it [Reset] buffer" })
		end,
	},
}
