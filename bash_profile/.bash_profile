if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

parse_git_branch() {
      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
#export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
#export PS1="\e[0;93m\u@\e[m\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
export PS1="\[\e[0;93m\]\u@\[\e[m\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\]\n> "

if [ -f ~/.git-completion.bash ]; then
      . ~/.git-completion.bash
  fi

# Android SDK
#export ANDROID_HOME=~/Library/Android/sdk
#export PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
#export PATH="/usr/local/opt/openssl/bin:$PATH"
#export PATH="$PATH:/Users/narsaynorath/Library/Python/2.7/bin"

# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"


source /usr/local/opt/nvm/nvm.sh

# added by Miniconda3 4.5.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/narsaynorath/miniconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/narsaynorath/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/narsaynorath/miniconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/narsaynorath/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
