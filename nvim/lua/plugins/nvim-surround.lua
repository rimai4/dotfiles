return {
	"kylechui/nvim-surround",
	version = "*",
	keys = {
		{ "sa", mode = { "n", "v" } },
		{ "sr" },
		{ "sd" },
	},
	opts = {
		keymaps = {
			normal = "sa",
			visual = "sa",
			delete = "sd",
			change = "sr",
		},
		-- Don't add whitespace to bracket surrounds
		surrounds = {
			["("] = {
				add = { "(", ")" },
			},
			["{"] = {
				add = { "{", "}" },
			},
			["<"] = {
				add = { "<", ">" },
			},
			["["] = {
				add = { "[", "]" },
			},
		},
		highlight = {
			duration = 150,
		},
		-- Alias cheatsheet (no changes from default)
		aliases = {
			["a"] = ">",
			["b"] = ")",
			["B"] = "}",
			["r"] = "]",
			["q"] = { '"', "'", "`" },
			["s"] = { "}", "]", ")", ">", '"', "'", "`" },
		},
	},
}
