if [ -f ~/.zshrc ]; then
  . ~/.zshrc
fi

parse_git_branch() {
      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export WORKON_HOME=~/.virtualenvs
export LDFLAGS=-L/usr/local/opt/openssl/lib
export CPPFLAGS=-I/usr/local/opt/openssl/include
# export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
# export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"# It is assumed that pyenv is installed via Brew, so this is all we need to do.
eval "$(pyenv init --path)"
