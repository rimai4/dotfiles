return {
	"NeogitOrg/neogit",
	keys = {
		{ "<A-g>", "<cmd>Neogit<CR>" },
	},
	config = true,
	opts = {
		integrations = {
			-- should be autodetected but isn't
			fzf_lua = true,
		},
		mappings = {
			status = {
				["K"] = false, -- disable untracking, allow navigation with K
			},
		},
	},
}
