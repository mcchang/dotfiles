# System
alias rlbash='. ~/.bash_profile'
alias cpu='top -o cpu'
function ds {
  echo $1: `du -ch $1 | tail -n 1 | cut -f1`
}

# Classes
alias cd188='cd ~/Dropbox/F09/CS188'
alias 161='ssh cs161-iw@cory.eecs.berkeley.edu'
alias 164='ssh cs164-cn@cory.eecs.berkeley.edu'
alias hkn='ssh mcchang@hkn.eecs.berkeley.edu'

# cd
alias ..='cd ..'
alias ...='cd ..; cd ..;'

# ls
alias ll='ls -lh'
alias la='ls -a'
alias lla='ls -lah'

# history
alias h='history'
alias hf='history | grep'

# search
alias grep='grep --color=auto'
alias g='grep -i'
alias f='find . -iname'

# mysql
alias startmysqld='cd /usr/local/Cellar/mysql/5.1.44 ; /usr/local/Cellar/mysql/5.1.44/bin/mysqld_safe & ; cd -'

# research
alias res='workon research; cd ~/Documents/src/virtualenvs/research/'


# SSH
alias 188='ssh cs188-az@cory.eecs.berkeley.edu'
alias 162='ssh cs162-cc@cory.eecs.berkeley.edu'
alias mb='ssh mcchang@xtrahotsauce.redirectme.net'
alias irc='ssh mcchang@irc.housing.berkeley.edu'

# SSH Port Forward
alias devtunnel='ssh -fND localhost:10000 mcchang@hal.rescomp.berkeley.edu'
alias hppgsqltunnel='ssh -fNL 5433:web84.webfaction.com:5432 mcchang@web84.webfaction.com'
alias hpmysqltunnel='ssh -fNL 3306:web84.webfaction.com:3306 mcchang@web84.webfaction.com'

# Convenience
alias dirs='dirs -v'
alias delpyc='find ./ -type f -name "*.pyc" -exec rm -f {} \;'
alias ghsync='git push origin master'
alias gc='git commit -a'
alias ta='trac-admin'
alias wf='ssh mcchang@mcchang.webfactional.com'
alias router='ssh root@192.168.1.1'
alias ej='hdiutil eject /Volumes/Files'
alias hppostgres='psql -h localhost -p 5433 -U mcchang_test_postgres' 
alias compb='ruby /Users/mcchang/Documents/src/blueprint-css/lib/compress.rb -p homepage'
alias iip="ifconfig | grep '192.168' | cut -d' ' -f2 | head -n 1" 
alias synstart='/usr/bin/synergys -f --config /etc/synergy.conf > /dev/null 2>&1 &' 
alias sc='synergyc -f shawshank > /dev/null 2>&1 &'

# Apple-specific aliases
alias showhidden='defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder'
alias hidehidden='defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder'

# Programs
alias p='python' 
if [ "$OS" = "linux" ]; then 
	alias v='vim' 
else
	alias v='/Applications/MacVim.app/Contents/MacOS/Vim -g'
fi
