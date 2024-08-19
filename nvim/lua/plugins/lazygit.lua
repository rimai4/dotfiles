return {
	{
		"kdheepak/lazygit.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>" },
			{ "<leader>fh", "<cmd>LazyGitFilterCurrentFile<cr>" },
		},
	},
}
