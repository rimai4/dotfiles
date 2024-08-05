function gdb
git br | rg -v '(master|main)' | fzf --header 'Select branches to delete' | xargs git br -D
end
