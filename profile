# MacPorts Installer addition on 2011-06-13_at_10:59:54: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# Adding Python 2.6 Library Path
export PATH=/opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin:$PATH
# Git tab-autocompletion
source /usr/local/git/contrib/completion/git-completion.bash

# Identify OS and Machine
export OS=`uname -s | sed -e 's/  */-/g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
export OSVERSION=`uname -r`; OSVERSION=`expr "$OSVERSION" : '[^0-9]*\([0-9]*\.[0-9]*\)'`
export MACHINE=`uname -m | sed -e 's/  */-/g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
export PLATFORM="$MACHINE-$OS-$OSVERSION"
export ARCHFLAGS="-arch x86_64"

# Homebrew
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# Python utils.
PATH=/opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin:$PATH

# Load Bashrc
if [ -f ~/.bashrc ]; then
source ~/.bashrc
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
