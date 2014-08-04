# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

source ~/.profile
 
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

bindkey -v
 
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ll="ls -lta"
alias llh="ls -lt | head"
alias chrome_no_extensions="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --disable-extensions"
alias grh='grep --include="*.html" --include="*.haml"'


# GIT STUFF
function git_st_each {
  for d in $(ls -d */)
  do
      echo "DIRECTORY: $d"; git -C $d status; echo "\n"
  done
}

function git_each_version() {
  for d in $(ls -d */); do
    (
      cd "$d" &> /dev/null
      sha=$(git rev-parse HEAD)
      repo_name=$(basename `git rev-parse --show-toplevel`)
      echo "$sha - $repo_name"
    )
  done
}

function gchsh {
  gc=$(echo $(git rev-parse HEAD))
  printf ${gc:0:7} | pbcopy
}

function get_changed {
  for d in $(ls -d */)
  do
    CHANGED=$(git -C "$d" diff-index --name-only HEAD --) 
    if [ -n "$CHANGED"  ]; then
      echo "$d"
    fi
  done
}

# RAILS STUFF
function gt {
  ripper-tags -R
  CoffeeTags -Ra
}

function bundle_update_all {
  for d in $(ls -d */)
  do
    echo "DIRECTORY: $d"; $(cd $d; bundle update); echo "UPDATED\n"
  done
}

function set_test_db {
  RAILS_ENV=test bundle exec rake db:nuke_schema;
  RAILS_ENV=test bundle exec rake db:setup;
}

function yml_link {
  if [ -f "./database.yml" ]; then
    echo "database.yml already exists"
  else
    ln -s /Users/kardosa/Documents/workspace/database.yml ./
  fi

  if [ -f "online.yml" ]; then
    echo "online.yml already exists"
  else
    ln -s /Users/kardosa/Documents/workspace/online.yml ./
  fi
}

function set_yml {
  if [ -d "./config" ]; then
    (
      cd config &> /dev/null
      yml_link
    )
    if [ -d "spec/dummy/config" ]; then
      (
        cd spec/dummy/config &> /dev/null
        yml_link
      )
    fi
  else
    echo "you don't appear to be in a rails app";
  fi
}

function set_gemset {
  echo "$1" >> ./.rbenv_gemsets
  echo '.rbenv_gemsets' >> ./.git/info/exclude
}

#TMUX
function tms {
  if [ $# -lt 1 ]; then
      echo "ERROR: not enough arguments" 1>&2
      echo "usage: $(basename $0) <directory>" 1>&2
      exit 1
  fi

  directory=$1
  session_name=$(basename $directory)
  test -d $directory || { echo "ERROR: no directory: $directory" 1>&2; return 1; }

  (
      cd $directory
      unset TMUX
      tmux new-session -ds $session_name
  )
}

# BASH STUFF
function td {
  (
    if [ -d "spec/dummy" ]; then
      cd spec/dummy > /dev/null
    else
      echo "Spec dummy doesn't exist"
      return 0
    fi
    exec "$@"
  )
}

function get_using_port {
  cols=( $(sudo lsof -i -P | grep "*:$1")  )
  printf "${cols[2]}"
}

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"
 
# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"
 
# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13
 
# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"
 
# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"
 
# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"
 
# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"
 
# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
 
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails gitfast lol macports nyan vagrant bundler cap catimg cp)
 
source $ZSH/oh-my-zsh.sh

path=(
    /Users/kardosa/toolbox/bin
    $HOME/.rbenv/shims
    $HOME/.rbenv/bin
    /usr/local/instantclient_11_2
    /opt/local/bin
    /opt/local/sbin
    /usr/local/sbin
    $HOME/Qt5.1.0/5.1.0/clang_64/bin
    /opt/local/lib
    $path
)
 
cdpath=(
    $HOME 
    $HOME/Documents
    $HOME/Documents/workspace
    /Users/kardosa/Documents/workspace/apps_env
    $cdpath
)
 
eval "$(rbenv init -)"
 
export EC2_HOME="/opt/local/ec2-api-tools-1.6.12.0"
 
export JAVA_HOME="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home"
export PATH=${JAVA_HOME}/bin:$PATH
# Customize to your needs...
#export PATH=$EC2_HOME/bin:$PATH:/Users/alex/Qt5.1.0/5.1.0/clang_64/bin/:/opt/local/bin:/opt/local/sbin:/Users/alex/bin:/Applications/Postgres.app/Contents/MacOS/bin:/Users/alex/.rvm/gems/ruby-2.0.0-tv2_0_0_247/bin:/Users/alex/.rvm/gems/ruby-2.0.0-tv2_0_0_247@global/bin:/Users/alex/.rvm/rubies/ruby-2.0.0-tv2_0_0_247/bin:/Users/alex/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/MacGPG2/bin:/Library/Frameworks/Firebird.framework/Resources/bin:/opt/local/lib/mysql5/bin/:/Users/alex/.rvm/rubies/default/bin/:/Users/alex/.rvm/bin:/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin/:/Users/alexanderkardos/bin
 
 
alias vim="mvim -v"
alias v-"vim"
alias vimdiff="mvimdiff -v"
export JAVA_HOME=$(/usr/libexec/java_home)
 
export REDIS_ENV="development"
export GOPATH=$HOME/go

export PAGER=/usr/local/bin/vimpager
alias less=$PAGER 
alias zless=$PAGER 
bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

function zle-line-init zle-keymap-select {
  VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

if [ "$WORKING_ENV" = "work" ]; then
  source "$HOME/.environment/local/.$WORKING_ENV"
fi
