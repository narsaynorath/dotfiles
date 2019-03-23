#export WORKON_HOME=~/.envs
#source ./Library/Python/2.7/bin/virtualenvwrapper.sh
#export VIRUALENVWRAPPER_PYTHON=/usr/local/bin/python

# sets vi ability in command line
set -o vi

# git aliases
alias back='git checkout -'
alias dev='git checkout develop'
alias ga='git add'
alias gaA='git add .'
alias gaNE='git commit --amend --no-edit'
alias gb='git branch'
alias gcA='git commit -a'
alias gcAM='git commit -am'
alias gd='git diff'
alias gl='git log'
alias gp='git pull'
alias greset='git reset --hard HEAD'
alias gs='git status'
alias gss='git stash save'
alias ok='git rebase --continue'
alias pfhead='git push -f origin HEAD'
alias phead='git push origin HEAD'
alias pushall='git push all'
alias rebasedev='git rebase develop'
alias stash='git stash'
alias stashes='git stash list'
alias tasks='git co feature/tasks'

# other aliases
alias aliases='cat ~/.bashrc | grep alias'
alias csdetools='pip freeze | grep sdetools'
alias editBashrc='vim ~/.bashrc'
alias editVimrc='vim ~/.vimrc'
alias hoPLS='sudo killall coreaudiod'
alias readBashrc='less ~/.bashrc'
alias reloadBashrc='. ~/.bashrc'
alias cdf='ssh saynorat@teach.cs.utoronto.ca'

commitDiff() {
    git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative $1..$2
}

mkcdir() {
    mkdir "$1" && cd "$1"
}

cdup() {
    LIMIT=$1
    P=$PWD
    for ((i=1; i <= LIMIT; i++))
    do
        P=$P/..
    done
    cd $P
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
