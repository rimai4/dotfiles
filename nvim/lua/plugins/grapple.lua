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
			{ "<leader>m1", function() grapple.select({ key = 1 }) end },
			{ "<leader>m2", function() grapple.select({ key = 2 }) end },
			{ "<leader>m3", function() grapple.select({ key = 3 }) end },
			{ "<leader>m4", function() grapple.select({ key = 4 }) end },
		}
	end,
}
