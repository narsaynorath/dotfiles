# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/nsaynorath/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git lol vi-mode)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# ====================================
#export WORKON_HOME=~/.envs
#export VIRUALENVWRAPPER_PYTHON=/usr/local/bin/python

# sets vi ability in command line
set -o vi

# directories
alias .='cd .'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias mk='mkdir -p'

# sde
alias mrs='python manage.py runserver'
alias sde='workon sde && cd ~/sde/sdelements/sigma/'
alias yd='yarn dev'
alias celery='celery -A . worker --app=celery_mod -l debug'

# misc
alias c='clear'

reflect() {
    REFLECT_DIR="/Users/nsaynorath/Documents/work-notes/reflections/"
    DATE=`date "+%y.%m.%d"`
    if [[ -e "${REFLECT_DIR}${DATE}.md" ]]; then
        echo "Reflection already exists"
        open "${REFLECT_DIR}${DATE}.md"
    else
        cp "${REFLECT_DIR}template.md" "${REFLECT_DIR}${DATE}.md" && open "${REFLECT_DIR}${DATE}.md"
        echo "Reflection created"
    fi
}

sdtest() {
    # runs the tests of the given directory
    # ./manage.py test $1 --settings=test_local_settings --nomigrations -v 2
    if [ -z $1 ]; then
        echo "This function takes a file_path, [test class], [test function]"
    elif [ -z $2 ]; then
        pytest --no-migrations --ds=test_local_settings --ignore=node_modules $1
    elif [ -z $3 ]; then
        pytest --no-migrations --ds=test_local_settings --ignore=node_modules $1::$2
    elif [ -z $4 ]; then
        pytest --no-migrations --ds=test_local_settings --ignore=node_modules $1::$2::$3
    fi
    # pytest --no-migrations --ds=test_local_settings --ignore=node_modules $1::$2
}

oldtest() {
    ./manage.py test $1 --settings=test_local_settings --nomigrations -v 2
}

commitDiff() {
    git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative $1..$2
}

lookup() {
    find . -name "$1"
}

mkcdir() {
    mkdir "$1" && cd "$1"
}

# zlib stuff
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"

if [ -f ~/.powerlevelrc ]; then
  source ~/.powerlevelrc
fi

export CPPFLAGS="-I/usr/local/opt/openssl/include"
export LDFLAGS="-L/usr/local/opt/openssl/lib"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# This needs to be last for some reason
source $ZSH/oh-my-zsh.sh

# alias fixPostgres="rm /usr/local/var/postgres/postmaster.pid"

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh" --no-use # This loads nvm