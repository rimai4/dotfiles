vim.cmd([[ let g:sonokai_better_performance = 1 ]])

local status, _ = pcall(vim.cmd, "colorscheme sonokai")
if not status then
  print("Colorscheme not found!")
  return
end
