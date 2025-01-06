-- This plugin only makes sure that comments work in tsx files
-- For commenting/uncommenting the built-in functionality is used
return {
	"folke/ts-comments.nvim",
	event = "BufReadPre",
	config = true,
}
