# System
alias rlbash='. ~/.bash_profile'
alias cpu='top -o cpu'
function ds {
  echo $1: `du -ch $1 | tail -n 1 | cut -f1`
}

# version control
alias git=hub

# cd
alias ..='cd ..'
alias ...='cd ..; cd ..;'
function cdb {
  boom $1 &> /dev/null && cd $(pbpaste)
}

# ls
alias ll='ls -lh'
alias la='ls -a'
alias lla='ls -lah'

# mkdir
alias mkdir='mkdir -p'

# history
alias h='history'
alias hf='history | grep'

# search
alias grep='grep --color=auto'
alias g='grep -i'
alias f='find . -iname'

# mysql
alias startmysqld='cd /usr/local/Cellar/mysql/5.1.44 ; /usr/local/Cellar/mysql/5.1.44/bin/mysqld_safe &'

# SSH
alias irc='ssh mcchang@irc.housing.berkeley.edu'

# Convenience
alias dirs='dirs -v'
alias delpyc='find ./ -type f -name "*.pyc" -exec rm -f {} \;'
alias router='ssh root@192.168.1.1'
alias ej='hdiutil eject /Volumes/Files'
alias iip="ifconfig | grep '192.168' | cut -d' ' -f2 | head -n 1" 

# Apple-specific aliases
alias showhidden='defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder'
alias hidehidden='defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder'

# Misc
alias tcdropbox='tc -t -k "" --protect-hidden=no --mount /Users/mcchang/Dropbox/tc /Volumes/tc'
