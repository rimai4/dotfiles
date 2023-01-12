require("toggleterm").setup({
	open_mapping = "<C-CR>",
	direction = "horizontal",
	insert_mappings = false,
	float_opts = {
		width = function()
			return vim.o.columns
		end,
		height = function()
			return vim.o.lines
		end,
	},
})

local Terminal = require("toggleterm.terminal").Terminal
local gitui = Terminal:new({ cmd = "gitui", hidden = true, direction = "float" })

function gitui_toggle()
	gitui:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua gitui_toggle()<CR>", { noremap = true, silent = true })
