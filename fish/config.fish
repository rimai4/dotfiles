if status is-interactive
    # Commands to run in interactive sessions can go here
end

source /opt/homebrew/opt/asdf/libexec/asdf.fish
source ~/.config/fish/functions/lfcd.fish
ssh-add ~/.ssh/id_ed25519 &> /dev/null

