# Commands to run in interactive sessions can go in the block below.
# Interactive session means a terminal window. Non-interactive sessions are run without user input, such as:
# Cron jobs, scripts, docker entrypoints etc.
# So put stuff here that is only required when running inside a terminal and not a script for example.
# aliases, keybinds, environment variables that only affect terminal usage & setup for tools only used in the terminal
if status is-interactive
  # atuin
  set -gx ATUIN_NOBIND "true"
  atuin init fish | source
  bind \cr _atuin_search
  bind -M insert \cr _atuin_search

  # zoxide
  zoxide init fish | source

  # python debugger
  set -x PYTHONBREAKPOINT "ipdb.set_trace"

  # asdf
  source ~/.asdf/asdf.fish

  # starship
  starship init fish | source
end

# bun
set -x BUN_INSTALL "$HOME/.bun"
set -x PATH $BUN_INSTALL/bin $PATH
