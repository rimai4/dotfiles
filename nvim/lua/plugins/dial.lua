return {
	"monaqa/dial.nvim",
	config = function()
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
	keys = function()
		local map = require("dial.map")

		return {
			{ "+", map.inc_normal() },
			{ "-", map.dec_normal() },
		}
	end,
}
