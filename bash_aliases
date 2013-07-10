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
alias chrome='open -a "/Applications/Google Chrome.app" --args --force-renderer-accessibility'

alias creds_appengine='cat /Volumes/tc/keys/prod/meta | grep email | cut -d, -f3 | pbcopy'
alias creds_ftp='cat /Volumes/tc/keys/ro/meta | grep feed_ftp | cut -d',' -f3 | pbcopy'
alias creds_aws_prod='cat /Volumes/tc/keys/prod/meta | grep aws_pass | cut -d"," -f3 | pbcopy'
alias creds_aws_ro='cat /Volumes/tc/keys/ro/meta | grep aws_pass | cut -d"," -f3 | pbcopy'

alias tc_keys='tc -t -k "" --protect-hidden=no --background-task --mount /Users/mike/tc_mac /Volumes/tc'

alias lu='lookup-user-properties'

function lus {
  cd $TELLAPART_HOME && PYTHONPATH=pytest:py:build/gen-py:py/tellapart/third_party python py/tellapart/scripts/lookup.py lookup_user_properties --uid_list=$1 --stats_only && cd -
}

function sshmount {
  ssh -o StrictHostKeyChecking=no "$@"
}

function irc {
  ssh -i /Volumes/tc/keys/devel/key_pair_us-east-1 -f ubuntu@ec2-50-19-80-99.compute-1.amazonaws.com -L 6667:localhost:6667 -N
  irssi
}

function gmid {
  grep -i "const string merchant_id_$1" $TELLAPART_HOME/thrift/ids.thrift | cut -d'"' -f 2 | tr -d "\n" | pbcopy && pbpaste
}

function proxy {
  cd ~/src/tellapart/tools/scripts/ && ./proxy.sh -h ec2-23-23-238-60.compute-1.amazonaws.com -c ro -u hadoop &
}

function sshe {
  sshmount ubuntu@$1 -i /Volumes/tc/keys/prod/key_pair_us-east-1
}

function sshw {
  sshmount ubuntu@$1 -i /Volumes/tc/keys/prod/key_pair_us-west-1
}

function varze {
  ssh -i /Volumes/tc/keys/prod/key_pair_us-east-1 ubuntu@ec2-23-21-251-6.compute-1.amazonaws.com "curl localhost:8279/varz?varz=$1"
}

function varzw {
  ssh -i /Volumes/tc/keys/prod/key_pair_us-west-1 ubuntu@ec2-184-169-150-113.us-west-1.compute.amazonaws.com "curl localhost:8279/varz?varz=$1"
}

function sshe_root {
  sshmount root@$1  -i /Volumes/tc/keys/prod/key_pair_us-east-1
}

function sshw_root {
  sshmount root@$1  -i /Volumes/tc/keys/prod/key_pair_us-west-1
}

function lookup_product_east {
  cd ~/src/tellapart/py && PYTHONPATH=. python tellapart/scripts/lookup_product.py --sku=$1 --merchant=$2  -i /Volumes/tc/keys/prod/key_pair_us-east-1
}

function lookup_product_west {
  cd ~/src/tellapart/py && PYTHONPATH=. python tellapart/scripts/lookup.py --sku=$1 --merchant=$2 -i /Volumes/tc/keys/prod/key_pair_us-west-1
}

function lookup_user_properties {
  cd ~/src/tellapart/py && PYTHONPATH=. python tellapart/scripts/lookup_user_properties.py --uid=$1 -i /Volumes/tc/keys/prod/key_pair_us-west-1 && cd -
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
alias sshc='sshe ec2-174-129-53-193.compute-1.amazonaws.com'
alias sshh='sshmount hadoop@ec2-23-23-238-60.compute-1.amazonaws.com -i /Volumes/tc/keys/ro/key_pair_us-east-1 -o StrictHostKeyChecking=no'
alias sshr='sshmount reporting@ec2-184-73-193-191.compute-1.amazonaws.com -i /Volumes/tc/keys/ro/key_pair_us-east-1 -o StrictHostKeyChecking=no'
alias allryejavatests='cd ~/src/tellapart/rye && ant runtests && cd -'
alias allryejobtests='gen_thrift && cd ~/src/tellapart && PYTHONPATH=pytest:build/gen-py:rye/scripts:py/tellapart/third_party python rye/scripts/tests/all_tests.py && cd -'
alias pylintall='cd ~/src/tellapart/pytest && python -m tellapart.pylint_all && cd -'
alias allpythontests='gen_thrift && cd ~/src/tellapart/pytest && python -m "tellapart.all_tests" && cd -'
alias alltests='allryejobtests && allpythontests && pylintall'
alias restart_server='PYTHONPATH=. fab -f tellapart/deploy/fabfile.py deploy_config:prod restart_specific_prod_server'

function scphr {
  scp -i /Volumes/tc/keys/ro/key_pair_us-east-1 -o StrictHostKeyChecking=no hadoop@$HADOOP_MASTER:"$1" "$2"
}

function scpeast {
  scp -i /Volumes/tc/keys/prod/key_pair_us-east-1 -o StrictHostKeyChecking=no $1 ubuntu@$2:`basename $1`
}

function scpwest {
  scp -i /Volumes/tc/keys/prod/key_pair_us-west-1 -o StrictHostKeyChecking=no $1 ubuntu@$2:`basename $1`
}

function scpeastr {
  scp -i /Volumes/tc/keys/prod/key_pair_us-east-1 -o StrictHostKeyChecking=no ubuntu@$2:$1 ~/Desktop/$1
}

function scpwestr {
  scp -i /Volumes/tc/keys/prod/key_pair_us-west-1 -o StrictHostKeyChecking=no ubuntu@$2:$1 ~/Desktop/$1
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

function deregw {
  elb-deregister-instances-from-lb FrontendElb --instances $1 --region=us-west-1
}
function derege {
  elb-deregister-instances-from-lb FrontendElb3 --instances $1
}
function deregd {
  elb-deregister-instances-from-lb DclkElb --instances $1
}
function regw {
  elb-register-instances-with-lb FrontendElb --instances $1 --region=us-west-1
}
function rege {
  elb-register-instances-with-lb FrontendElb3 --instances $1
}
function deregd {
  elb-register-instances-with-lb DclkElb --instances $1
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
alias pushprod='cd ~/src/tellapart/py && PYTHONPATH=. fab -f tellapart/deploy/fabfile.py deploy_config:prod auto_prod_push && cd -'
alias pushcanary='cd ~/src/tellapart/py && PYTHONPATH=. fab -f tellapart/deploy/fabfile.py -i /Volumes/tc/keys/prod/key_pair_us-east-1 deploy_config:prod bundle canary && cd -'
alias runcoverage='cd ~/src/tellapart && PYTHONPATH=. coverage run pytest/tellapart/all_tests.py && coverage report -m python_files_list && cd -'
alias sshi=ssh_into

# cd
alias ..='cd ..'
alias ...='cd ..; cd ..;'
function cdb {
  boom $1 &> /dev/null && cd $(pbpaste)
}

# rm
alias rm='rm -i'

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
alias grep="grep --color=auto --exclude='*.swp' --exclude='*.pyc' --exclude='*.swo'"
function allgrep {
  'grep -iREn "$1" /Users/mike/src/tellapart/py*'
}

# mysql
alias startmysqld='cd /usr/local/Cellar/mysql/5.1.44 ; /usr/local/Cellar/mysql/5.1.44/bin/mysqld_safe &'

# Convenience
alias dirs='dirs -v'
alias delpyc='find ./ -type f -name "*.pyc" -exec rm -f {} \;'
alias router='ssh root@192.168.1.1'
alias ej='hdiutil eject /Volumes/Files'
alias iip="ifconfig | grep '192.168' | cut -d' ' -f2 | head -n 1"

# Apple-specific aliases
alias showhidden='defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder'
alias hidehidden='defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder'
alias md5='md5 -r'
alias md5sum='md5 -r'
