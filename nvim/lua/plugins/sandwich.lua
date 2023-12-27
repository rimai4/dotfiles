return {
	"machakann/vim-sandwich",
	keys = {
		{ "sa", mode = { "n", "v" } },
		{ "sr" },
		{ "sd" },
	},
	config = function()
		vim.cmd([[ call operator#sandwich#set('all', 'all', 'highlight', 0) ]])
	end,
}
