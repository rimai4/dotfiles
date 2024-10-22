function l --wraps='ls -la' --wraps='ls -l' --wraps='eza -1 --icons' --description 'alias l eza -1 --icons'
  eza -1 --icons $argv
        
end
