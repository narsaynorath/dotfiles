if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

parse_git_branch() {
      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\e[0;93m\]\u@\[\e[m\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\]\n> "

if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

export LDFLAGS=-L/usr/local/opt/openssl/lib
export CPPFLAGS=-I/usr/local/opt/openssl/include

#export NVM_DIR="${XDG_CONFIG_HOME/:-$HOME/.}nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use # This loads nvm

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# https://github.com/creationix/nvm/issues/539


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/narsaynorath/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/narsaynorath/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/narsaynorath/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/narsaynorath/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

