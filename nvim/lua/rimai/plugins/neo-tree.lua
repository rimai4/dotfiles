vim.cmd("let g:neo_tree_remove_legacy_commands = 1")

return {
  close_if_last_window = false,
  filesystem = {
    follow_current_file = true,
    use_libuv_file_watcher = true,
  },
}
