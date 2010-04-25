# Source other files
. ~/.bash_aliases
. ~/.bash_functions

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

# cd
# export CDPATH=($HOME/Dropbox/school/S10:$HOME/Documents/src)

# History
export HISTCONTROL=ignoredups # Ignores dupes in the history
export HISTFILESIZE=3000
export HISTSIZE=100
export HISTIGNORE="&:[ ]*:ls:cd:[bf]g:exit:..:...:ll:lla"

# bash completion settings (actually, these are readline settings)
bind "set completion-ignore-case on"
bind "set bell-style none" # No bell
bind "set show-all-if-ambiguous On" # automatically show completion without double tab-ing

# Color Aliases
COLOR_NC="[0;40m"
COLOR_DEFAULT="[37;40m"
COLOR_BLUE="[36;40m"
COLOR_PINK="[35;40m"
COLOR_PURPLE="[34;40m"
COLOR_ORANGE="[33;40m"
COLOR_GREEN="[32;40m"
COLOR_RED="[31;40m"

# Global Vars
# SVN
export SVNSATCH='svn://satchmoproject.com/satchmo'
export SVNWF='https://svn.michaelychang.com'
export SVN1530='svn+ssh://mchang@svn.1530technologies.com/usr/local/svn/1530'
export SVN1530NEW='http://svn.1530technologies.com/1530'
export SVNDJANGOTRUNK='http://code.djangoproject.com/svn/django/trunk'
export SVNCODE='https://svn.rescomp.berkeley.edu/code'
export SVNTM='http://svn.textmate.org/trunk/Bundles'
export SVN162='https://isvn.eecs.berkeley.edu/cs162/group8'
export SVN188='http://cs188.unfuddle.com/svn/'
export WF='mcchang@mcchang.webfactional.com'

# CS164
export MYREPOS='svn+ssh://cs164-ta@torus.cs.berkeley.edu/cs164-cn'
export STAFFREPOS='svn+ssh://cs164-ta@torus.cs.berkeley.edu/staff'
export TEAMREPOS='svn+ssh://cs164-ta@torus.cs.berkeley.edu/Michaels'

# virtualenvwrapper
export WORKON_HOME=~/Documents/src/virtualenvs/
export PYTHONPACKAGES='/Library/Python/2.6/site-packages'
export PS1='\n\[\e${COLOR_RED}\][\u: \
\[\e${COLOR_ORANGE}\]\h: \
\[\e${COLOR_PURPLE}\]\w]\
\[\e${COLOR_BLUE}\]$(parse_git_branch) \
\[\e${COLOR_RED}\][\!] \
\[\e${COLOR_NC}\]\n$ ' 

# Editors
export EDITOR="vim"
export VisuAL="vim"
if [ "$OS" = "darwin" ]; then
    export EDITOR="mvim -f"
    export VISUAL="mvim -f"
fi
export PAGER="less"

# Settings for getting Textmate bundles
export LC_CTYPE=en_US.UTF-8


# Source virtualenvwrapper
if [ "$OS" = "darwin" ]; then
	. /usr/local/bin/virtualenvwrapper_bashrc
fi

# Misc
# facilitates inverting selections
shopt -s extglob
shopt -s checkwinsize # After each command, checks the windows size and changes lines and columns

# vi style cli
set -o vi

