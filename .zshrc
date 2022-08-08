# -------------------------------- #
# Path Manager
# -------------------------------- #

export PATH="$PNPM_HOME:$PATH"
export ZSH="$HOME/.oh-my-zsh"
export PNPM_HOME="/Users/vtrbo/Library/pnpm"

# -------------------------------- #
# Oh My Zsh Manager
# -------------------------------- #

# git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
# ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
ZSH_THEME="spaceship"

# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-z
)

ZSH_DISABLE_COMPFIX=true

# autoload -U promptinit; promptinit
# prompt pure

# -------------------------------- #
# Source Manager
# -------------------------------- #

# bash profile
source ~/.bash_profile

# https://ohmyz.sh/
source $ZSH/oh-my-zsh.sh

# -------------------------------- #
# Node Package Manager
# -------------------------------- #
# https://github.com/vtrbo/ni

alias nio="ni --prefer-offline"
alias s="nr start"
alias d="nr dev"
alias b="nr build"
alias bw="nr build --watch"
alias t="nr test"
alias tu="nr test -u"
alias tw="nr test --watch"
alias w="nr watch"
alias p="nr play"
alias c="nr typecheck"
alias lint="nr lint"
alias lintf="nr lint --fix"
alias release="nr release"
alias re="nr release"

# -------------------------------- #
# IDEA Manager
# -------------------------------- #

alias ws="webstorm"
alias vs="code"

# -------------------------------- #
# Git
# -------------------------------- #

# Go to project root
alias grt='cd "$(git rev-parse --show-toplevel)"'

alias gs='git status'
alias gp='git push'
alias gpf='git push --force'
alias gpft='git push --follow-tags'
alias gpl='git pull --rebase'
alias gcl='git clone'
alias gst='git stash'
alias grm='git rm'
alias gmv='git mv'

alias main='git checkout main'

alias gco='git checkout'
alias gcob='git checkout -b'

alias gb='git branch'
alias gbd='git branch -d'

alias grb='git rebase'
alias grbom='git rebase origin/main'
alias grbc='git rebase --continue'

alias gl='git log'
alias glo='git log --oneline --graph'

alias grh='git reset HEAD'
alias grh1='git reset HEAD~1'

alias ga='git add'
alias gA='git add -A'

alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit -a'
alias gcam='git add -A && git commit -m'
alias gfrb='git fetch origin && git rebase origin/main'

alias gxn='git clean -dn'
alias gx='git clean -df'

alias gsha='git rev-parse HEAD | pbcopy'

alias ghci='gh run list -L 1'

function glp() {
  git --no-pager log -$1
}

function gd() {
  if [[ -z $1 ]] then
    git diff --color | diff-so-fancy
  else
    git diff --color $1 | diff-so-fancy
  fi
}

function gdc() {
  if [[ -z $1 ]] then
    git diff --color --cached | diff-so-fancy
  else
    git diff --color --cached $1 | diff-so-fancy
  fi
}

# -------------------------------- #
# Directories
#
# C Put
# `cv` ~/Code/vtrbo => for my projects
# `cg` ~/Code/github => for my clones
# `cm` ~/Code/muyuan => for my companys
# -------------------------------- #

function cv() {
  cd ~/Code/vtrbo/$1
}

function cg() {
  cd ~/Code/github/$1
}

function cm() {
  cd ~/Code/muyuan/$1
}

function pr() {
  if [ $1 = "ls" ]; then
    gh pr list
  else
    gh pr checkout $1
  fi
}

function dir() {
  mkdir $1 && cd $1
}

function clone() {
  if [[ -z $2 ]] then
    git clone "$@" && cd "$(basename "$1" .git)"
  else
    git clone "$@" && cd "$2"
  fi
}

# Clone to ~/Code/vtrbo and cd to it
function clv() {
  cv && clone "$@" && vs .
}

function clg() {
  cg && clone "$@" && vs .
}

function vsv() {
  cv && vs "$@"
}

function vsg() {
  cg && vs "$@"
}

function wsm() {
  cm && ws "$@"
}

function serve() {
  if [[ -z $1 ]] then
    live-server dist
  else
    live-server $1
  fi
}
