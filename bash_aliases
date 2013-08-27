# System
alias rlbash='. ~/.bash_profile'
alias cpu='top -o cpu'
function ds {
  echo $1: `du -ch $1 | tail -n 1 | cut -f1`
}

# Shortcuts for applications.
alias v='vim'
alias g='git'
alias h='history'
alias hf='history | grep'
alias chrome='open -a "/Applications/Google Chrome.app" --args --force-renderer-accessibility'

# cd
alias ..='cd ..'
alias ...='cd ..; cd ..;'

# rm
alias rm='rm -i'

# ls
alias ll='ls -lh'
alias la='ls -a'
alias lla='ls -lah'

# search
alias grep="grep --color=auto --exclude='*.swp' --exclude='*.pyc' --exclude='*.swo'"

alias creds_appengine='cat /Volumes/tc/keys/prod/meta | grep email | cut -d, -f3 | pbcopy'
alias creds_ftp='cat /Volumes/tc/keys/ro/meta | grep feed_ftp | cut -d',' -f3 | pbcopy'
alias creds_aws_prod='cat /Volumes/tc/keys/prod/meta | grep aws_pass | cut -d"," -f3 | pbcopy'
alias creds_aws_ro='cat /Volumes/tc/keys/ro/meta | grep aws_pass | cut -d"," -f3 | pbcopy'

alias tc_keys='tc -t -k "" --protect-hidden=no --background-task --mount /Users/mike/tc_mac /Volumes/tc'

alias lu='lookup-user-properties-tid'

function lus {
  cd $TELLAPART_HOME && PYTHONPATH=pytest:py:build/gen-py:py/tellapart/third_party python py/tellapart/scripts/lookup.py lookup_user_properties --uid_list=$1 --stats_only && cd -
}

function gmid {
  grep -i "const string merchant_id_$1" $TELLAPART_HOME/thrift/ids.thrift | cut -d'"' -f 2 | tr -d "\n" | pbcopy && pbpaste
}

function proxy {
  cd ~/src/tellapart/tools/scripts/ && ./proxy.sh -h ec2-23-23-238-60.compute-1.amazonaws.com -c ro -u hadoop &
}

function sshvi {
  ssh -t "$1" 'exec bash -o vi'
}
function sshsc {
  ssh -t "$1" 'screen -R -D mike'
}

function sshscie {
  sshsc $(ip2hosteast "$1")
}

function sshsciw {
  sshsc $(ip2hostwest "$1")
}

function lm {
  cat /Volumes/tc/keys/{prod,devel,ro}/meta | grep $1
}
function gen_thrift {
  cd ~/src/tellapart && PYTHONPATH=$(pwd)/pytest:$(pwd)/py python pytest/tellapart/testutil/thrift_generate_script.py && cd -
}

# Change the background color of iTerm2.
alias light='echo -e "\033]50;SetProfile=Mike Solarized Light Ubuntu\a"'
alias dark='echo -e "\033]50;SetProfile=Mike Solarized Dark Ubuntu\a"'

alias testtapy='PYTHONPATH=$TAHOME/pytest tapy'
alias sshh='sshvi hadoop_master'
alias sshr='sshvi ro_controller'

function scphr {
  scp -i /Volumes/tc/keys/ro/key_pair_us-east-1 -o StrictHostKeyChecking=no hadoop@$HADOOP_MASTER:"$1" "$2"
}

function scpto {
  scp $1 $2:`basename $1`
}

function scpfrom {
  scp $2:$1 ~/Desktop/$1
}

function host2ip {
  python -c "print '.'.join('$1'.split('.')[0].split('-')[1:])" | tr -d "\n" | pbcopy && pbpaste
}

function ip2hosteast {
  python -c "print 'ec2-%s.compute-1.amazonaws.com' % '-'.join('$1'.split('.'))" | tr -d "\n" | pbcopy && pbpaste
}

function ip2hostwest {
  python -c "print 'ec2-%s.us-west-1.compute.amazonaws.com' % '-'.join('$1'.split('.'))" | tr -d "\n" | pbcopy && pbpaste
}

function pullfile {
  sshh "mkdir -p /ebs1/tmp/mike; hadoop fs -getmerge s3n://tellapart-rye-dataz/tmp/output/$2/reports/$1 /ebs1/tmp/mike/$2_$1; gzip -f /ebs1/tmp/mike/$2_$1"
  scph /ebs1/tmp/mike/$2_$1.gz /Users/mike/reports/$2_$1.gz
  gunzip /Users/mike/reports/$2_$1.gz
}

function fbget {
  cd ~/src/tellapart && PYTHONPATH=pytest/:py:py/tellapart/third_party/:build/gen-py/ python py/tellapart/scripts/fb/fb_ads_api_manager.py get -p "$1" && cd - > /dev/null
}
function locks {
  s3cmd-prod ls s3://tellapart-locks
}
function rmlock {
  s3cmd-prod del s3://tellapart-locks/${1}
}
function rmfeedlock {
  s3cmd-prod del s3://tellapart-locks/feed_importer_$(gmid $1)
}
function fetch_skus {
  s3cmd-prod get --force s3://tellapart-creative-skus/$(gmid $1) ~/Desktop/$1_skus
}

alias sshi=ssh_into

# Convenience
alias dirs='dirs -v'
alias delpyc='find ./ -type f -name "*.pyc" -exec rm -f {} \;'
alias iip="ifconfig | grep '192.168' | cut -d' ' -f2 | head -n 1"

# Apple-specific aliases
alias showhidden='defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder'
alias hidehidden='defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder'
alias md5='md5 -r'
alias md5sum='md5 -r'
