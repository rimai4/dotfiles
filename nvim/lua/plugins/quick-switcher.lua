return {
	"Everduin94/nvim-quick-switcher",
	keys = {
		{
			"<leader>op",
			function()
				require("nvim-quick-switcher").find(".component.ts")
			end,
			desc = "Other component",
		},
		{
			"<leader>oo",
			function()
				require("nvim-quick-switcher").find(".component.html")
			end,
			desc = "Other HTML",
		},
		{
			"<leader>oi",
			function()
				require("nvim-quick-switcher").find(".+css|.+scss|.+sass", { regex = true, prefix = "full" })
			end,
			desc = "Other styles",
		},
		{
			"<leader>ot",
			function()
				require("nvim-quick-switcher").find(".+test|.+spec", { regex = true, prefix = "full" })
			end,
			desc = "Other tests",
		},
	},
}
