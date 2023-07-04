function cp --wraps=cd\ \(fd\ -t\ d\ -d\ 3\ .\ \~/projects\ \|\ fzf\ --reverse\ --header=\'Select\ project\'\) --description alias\ cp\ cd\ \(fd\ -t\ d\ -d\ 3\ .\ \~/projects\ \|\ fzf\ --reverse\ --header=\'Select\ project\'\)
  cd (fd -t d -d 3 . ~/projects | fzf --reverse --header='Select project') $argv
        
end
