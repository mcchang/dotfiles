# Tellapart
export TC_DIR='/Volumes/tc'
export TC_KEY_DIR=$TC_DIR/keys
export USER=`whoami`
export TELLAPART_ROOT='/Users/mike/src/tellapart'
export TELLAPART_HOME=$TELLAPART_ROOT
export TAHOME=$TELLAPART_ROOT
export TA_ROOT=$TELLAPART_HOME
export TAPY=`which ipython`

# AWS
export AWS_CONFIG_FILE=$TC_DIR/aws_config
export AWS_ELB_HOME='/Users/mike/tools/aws_elb'
export AWS_AUTO_SCALING_HOME='/Users/mike/tools/aws_autoscaling'
export AWS_CLOUDWATCH_HOME='/Users/mike/tools/aws_cloudwatch'
export EC2_API_TOOLS_HOME='/Users/mike/tools/ec2_api'
export EC2_AMITOOL_HOME='/Users/mike/tools/ec2_ami'
export EC2_HOME='/Users/mike/tools/ec2_api'
export PATH=$AWS_ELB_HOME/bin:$AWS_AUTO_SCALING_HOME/bin:$PATH
export PATH=$AWS_CLOUDWATCH_HOME/bin:$EC2_API_TOOLS_HOME/bin:$PATH
export PATH=$EC2_AMITOOL_HOME/bin:$PATH

export EC2_PRIVATE_KEY=$TC_KEY_DIR/prod/x509_private_cert
export EC2_CERT=$TC_KEY_DIR/prod/x509_public_cert

export JAVA_HOME='/System/Library/Frameworks/JavaVM.framework/Home'
export ECLIPSE_HOME='/Applications/eclipse'

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

# PYTHONPATH
# PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
# PYTHONPATH=/opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin/pyflakes:$PYTHONPATH
# PYTHONPATH=$TELLAPART_HOME/py:$TELLAPART_HOME/build/gen-py:$TELLAPART_HOME/py/tellapart/third_party:$PYTHONPATH

# Load Bashrc
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Start in Tellapart home directory.
cd $TELLAPART_HOME

