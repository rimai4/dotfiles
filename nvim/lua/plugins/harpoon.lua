return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = function()
		local harpoon = require("harpoon")
    -- stylua: ignore
		return {
			{ "<leader>ha", function() harpoon:list():append() end },
			{ "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end },
			{ "<leader>h1", function() harpoon:list():select(1) end },
			{ "<leader>h2", function() harpoon:list():select(2) end },
			{ "<leader>h3", function() harpoon:list():select(3) end },
			{ "<leader>h4", function() harpoon:list():select(4) end },
		}
	end,
}
