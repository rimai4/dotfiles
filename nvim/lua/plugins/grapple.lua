return {
	"cbochs/grapple.nvim",
	keys = function()
		local grapple = require("grapple")

    -- stylua: ignore
		return {
			{ "<leader>ma", grapple.tag },
			{ "<leader>mm", grapple.toggle_tags },
			{ "<leader>1", function() grapple.select({ index = 1 }) end },
			{ "<leader>2", function() grapple.select({ index = 2 }) end },
			{ "<leader>3", function() grapple.select({ index = 3 }) end },
			{ "<leader>4", function() grapple.select({ index = 4 }) end },
		}
	end,
	opts = {
		scope = "git_branch",
	},
}
