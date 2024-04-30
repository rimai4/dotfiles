if status is-interactive
    # Commands to run in interactive sessions can go here
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

set --export PYTHONBREAKPOINT "ipdb.set_trace"

source /opt/homebrew/opt/asdf/libexec/asdf.fish
