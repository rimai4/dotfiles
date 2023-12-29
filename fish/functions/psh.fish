function psh --wraps='source /bin/activate.fish' --wraps='source (poetry env info --path)/bin/activate.fish' --description 'alias psh source (poetry env info --path)/bin/activate.fish'
  source (poetry env info --path)/bin/activate.fish $argv
        
end
