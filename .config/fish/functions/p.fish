function p --wraps=cd\ \(fd\ -t\ d\ -d\ 3\ .\ \~/projects\ \|\ fzf\ --reverse\ --header=\'Select\ project\'\) --description alias\ p\ cd\ \(fd\ -t\ d\ -d\ 3\ .\ \~/projects\ \|\ fzf\ --reverse\ --header=\'Select\ project\'\)
  cd (fd -t d -d 3 . ~/projects | fzf --reverse --header='Select project') $argv
        
end
