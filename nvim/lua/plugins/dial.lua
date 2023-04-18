return {
	"monaqa/dial.nvim",
	config = function()
		vim.keymap.set("n", "+", require("dial.map").inc_normal(), { noremap = true })
		vim.keymap.set("n", "-", require("dial.map").dec_normal(), { noremap = true })

		local augend = require("dial.augend")
		require("dial.config").augends:register_group({
			default = {
				augend.integer.alias.decimal,
				augend.constant.alias.bool,
        augend.semver.alias.semver,
				augend.constant.new({ elements = { "True", "False" } }),
			},
		})
	end,
	keys = { "+", "-" },
}
