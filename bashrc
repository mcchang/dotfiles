# Tellapart
export TC_DIR='/Volumes/tc'
export TC_KEY_DIR=$TC_DIR/keys
export USER=`whoami`
export TELLAPART_ROOT='/Users/mike/src/tellapart'
export TELLAPART_HOME=$TELLAPART_ROOT
export TAHOME=$TELLAPART_ROOT
export TA_ROOT=$TELLAPART_HOME
export TAPY=`which ipython`
export SSH_CACHE_AGE=21600

# AWS
export AWS_CONFIG_FILE=$TC_DIR/aws_config
export AWS_ELB_HOME='/Users/mike/tools/aws_elb'
export AWS_AUTO_SCALING_HOME='/Users/mike/tools/aws_autoscaling'
export AWS_CLOUDWATCH_HOME='/Users/mike/tools/aws_cloudwatch'
export EC2_API_TOOLS_HOME='/Users/mike/tools/ec2_api'
export EC2_AMITOOL_HOME='/Users/mike/tools/ec2_ami'
export EC2_HOME='/Users/mike/tools/ec2_api'
export EC2_PRIVATE_KEY=$TC_KEY_DIR/prod/x509_private_cert
export EC2_CERT=$TC_KEY_DIR/prod/x509_public_cert
export PATH=$AWS_ELB_HOME/bin:$AWS_AUTO_SCALING_HOME/bin:$PATH
export PATH=$AWS_CLOUDWATCH_HOME/bin:$EC2_API_TOOLS_HOME/bin:$PATH
export PATH=$EC2_AMITOOL_HOME/bin:$PATH

# Java
export JAVA_HOME='/System/Library/Frameworks/JavaVM.framework/Home'
export ECLIPSE_HOME='/Applications/eclipse'

# Inputrc
export INPUTRC=~/.inputrc

# Colors
export TERM=xterm-color
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'
export CLICOLOR=1

if [ "$OS" = "linux" ]; then
    alias ls='ls --color=auto'
else
    alias ls='ls -G'
fi

export HADOOP_MASTER="ec2-23-23-238-60.compute-1.amazonaws.com"
export HADOOP_MASTER_NIGHTLY="ec2-54-243-234-161.compute-1.amazonaws.com"
export RO_CONTROLLER="ec2-184-73-193-191.compute-1.amazonaws.com"

# History
export HISTCONTROL=ignoreboth:erasedups # Ignores dupes in the history.
export HISTFILESIZE=100000
export HISTSIZE=100000
export HISTIGNORE="&:[ ]*:ls:cd:[bf]g:exit:..:...:ll:lla"

# export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# bash completion settings (actually, these are readline settings)
bind "set completion-ignore-case on"
bind "set bell-style none" # No bell
bind "set show-all-if-ambiguous On" # automatically show completion without double tab-ing

# Color Aliases
COLOR_NC="[0m"
COLOR_BLUE="[0;36m"
COLOR_PURPLE="[0;34m"
COLOR_ORANGE="[0;33m"
COLOR_GREEN="[0;32m"
COLOR_RED="[0;31m"

# Global Vars.

# virtualenvwrapper
export WORKON_HOME=~/src/venvs
export PYTHONPACKAGES='/Library/Python/2.6/site-packages'
export PS1='\n\[\e${COLOR_RED}\][\u: \
\[\e${COLOR_ORANGE}\]\h: \
\[\e${COLOR_PURPLE}\]\w]\
\[\e${COLOR_BLUE}\]$(parse_git_branch) \
\[\e${COLOR_RED}\][\!] \
\[\e${COLOR_NC}\]\n$ '

# Editors
alias vim=/Applications/MacVim.app/Contents/MacOS/Vim
export EDITOR="vim"
export VISUAL="vim"
export PAGER="less"

# Settings for getting Textmate bundles
export LC_CTYPE=en_US.UTF-8

# Source virtualenvwrapper
if [ "$OS" = "darwin" ]; then
   source /opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin/virtualenvwrapper.sh
fi

# Misc
# facilitates inverting selections
shopt -s cdspell
# append to history, don't overwrite it.
shopt -s histappend
shopt -s extglob
shopt -s checkwinsize # After each command, checks the windows size and changes lines and columns
# Don't blindly execute history commands?
shopt -s histverify

# vi style cli
set -o vi

# Do not check mail.
unset MAILCHECK

# Free up ctrl-s and ctrl-q in vim.
stty -ixon -ixoff

# fasd setup.
eval "$(fasd --init auto)"

# set -e
# Source other files
source $TELLAPART_HOME/tools/scripts/tellapart_bash_functions
source $TELLAPART_HOME/tools/scripts/bash_completion/run_tests
# My dotfiles should override.
source ~/.bash_aliases
source ~/.bash_functions

function preexec () {
  if [ ! -d "/Volumes/tc" ]; then
    tc_keys
  fi
}

# Special autocompletion for complex git functions.
_git_cof() {
  _git_branch
}

# Autocomplete for 'g' alias for git.
complete -o default -o nospace -F _git g
# Autocomplete ssh config completions.
complete -W "$(grep '^Host' ~/.ssh/config | sort -u | sed s/Host\ //)" ssh scp sftp sshvi sshsc

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Add my bin path.
PATH=$PATH:$HOME/bin

# Start in Tellapart home directory.
cd $TELLAPART_HOME

preexec_invoke_exec () {
    [ -n "$COMP_LINE" ] && return  # do nothing if completing
    preexec
}
trap 'preexec_invoke_exec' DEBUG
