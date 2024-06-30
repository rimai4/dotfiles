return {
	"NeogitOrg/neogit",
	keys = {
		{ "<A-g>", "<cmd>Neogit<CR>" },
	},
	config = true,
	opts = {
		mappings = {
			status = {
				["K"] = false, -- disable untracking, allow navigation with K
			},
		},
	},
}
