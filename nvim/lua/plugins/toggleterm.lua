return {
	"akinsho/toggleterm.nvim",
	opts = {
		open_mapping = [[<C-t>]],
		direction = "tab",
		shade_terminals = false,
		persist_mode = false,
		size = function(term)
			if term.direction == "horizontal" then
				return 20
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.4
			end
		end,
	},
}
