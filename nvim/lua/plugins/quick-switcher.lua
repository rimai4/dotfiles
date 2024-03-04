return {
	"Everduin94/nvim-quick-switcher",
	keys = function()
		local qs = require("nvim-quick-switcher")

		return {
			{
				"<leader>op",
				function()
					qs.find(".component.ts")
				end,
				desc = "Other component",
			},
			{
				"<leader>oo",
				function()
					qs.find(".component.html")
				end,
				desc = "Other HTML",
			},
			{
				"<leader>oi",
				function()
					qs.find(".+css|.+scss|.+sass", { regex = true, prefix = "full" })
				end,
				desc = "Other styles",
			},
			{
				"<leader>ot",
				function()
					qs.find(".+test|.+spec", { regex = true, prefix = "full" })
				end,
				desc = "Other tests",
			},
		}
	end,
}
