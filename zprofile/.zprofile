# if [ -f ~/.zshrc ]; then
#   . ~/.zshrc
# fi

parse_git_branch() {
      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

export WORKON_HOME=~/.virtualenvs
export LDFLAGS=-L/usr/local/opt/openssl/lib
export CPPFLAGS=-I/usr/local/opt/openssl/include
# export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
# export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"

#export NVM_DIR="${XDG_CONFIG_HOME/:-$HOME/.}nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use # This loads nvm

source /usr/local/bin/virtualenvwrapper.sh
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh" --no-use  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# https://github.com/creationix/nvm/issues/539
nvm use default


# For Argo hackathon
export ARGO_SERVER=workflowhackathon.dev.sdelements.com:443
export ARGO_INSECURE_SKIP_VERIFY=true
export ARGO_NAMESPACE=hackathon
