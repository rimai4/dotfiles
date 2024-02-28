return {
	"cbochs/grapple.nvim",
	keys = function()
		local grapple = require("grapple")

    -- stylua: ignore
		return {
			{
        "<leader>ma",
        function()
          grapple.tag()
          print("file marked")
        end
      },
			{ "<leader>mm", function() grapple.popup_tags() end },
			{ "<leader>1", function() grapple.select({ key = 1 }) end },
			{ "<leader>2", function() grapple.select({ key = 2 }) end },
			{ "<leader>3", function() grapple.select({ key = 3 }) end },
			{ "<leader>4", function() grapple.select({ key = 4 }) end },
		}
	end,
	opts = {
		scope = "git_branch",
	},
}
