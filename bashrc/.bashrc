source /usr/local/bin/virtualenvwrapper.sh
export WORKON_HOME=~/.envs
export GITLAB_TOKEN=5iLPGyztYxDwKtnx7NWk

alias sde='workon sdelements && cd ~/development/sdelements/sigma'
alias up='fab lint && npm run lint'
alias add='git add'
alias commitAll='git commit -am'
alias dev='git checkout develop'
alias back='git checkout -'
alias status='git status'
alias commitA='git commit -a'
alias addA='git add .'
alias amendNE='git commit --amend --no-edit'
alias shell_plus='./manage.py shell_plus'
alias mrs='./manage.py runserver'
alias nrs='node devServer.js'
alias phead='git push origin HEAD'
alias pfhead='git push -f origin HEAD'
alias rebasedev='git rebase develop'
alias stash='git stash'

sdTest() {
    # runs the tests of the given directory
    ./manage.py test $1 --settings=test_local_settings --nomigrations 
}
