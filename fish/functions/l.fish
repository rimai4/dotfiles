function l --wraps='ls -la' --wraps='ls -l' --wraps='exa -1 --icons' --description 'alias l exa -1 --icons'
  exa -1 --icons $argv
        
end
