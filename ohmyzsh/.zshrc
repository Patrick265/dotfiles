# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export VISUAL="nvim"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="awesomepanda"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="yyyy/mm/dd"

plugins=(git 
	colorize
	docker
	compleat
	colored-man-pages
	history
	zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias dr18="docker run -ti -u $(stat -c "%u:%g" $(pwd)) -v $(pwd):/home/docker mi-git.evs.tv:4567/docker/docker-linux/buildroot:18.04.3"
alias dr22="docker run -ti -u $(stat -c "%u:%g" $(pwd)) -v $(pwd):/home/docker mi-git.evs.tv:4567/docker/docker-linux/buildroot:22.04"

alias hm="cd $HOME"
alias dev="cd $HOME/dev"

alias ll="ls -la"

alias moxa="telnet 10.4.218.25 4001"
alias reboot="echo \"no I don't think I will.\""

alias e="nvim"
alias gsub="git submodule update --init --recursive"
alias gs="git status"
alias gc="git commit -m"
alias gp="git push"
alias gpu="git pull"
alias gall="git add *"
alias gclean="git_delete_unused_branches"
alias venv="source .venv/bin/activate"
alias cat="batcat"
# Tired of going to dir config
alias cvim="cd ~/.config/nvim/"
# alias c2 = "client2 -i 10.4.218.30 -s 0 -c u -f"

export PATH="/usr/local/go/bin:/home/patrick/bin:/home/patrick/.cargo/bin:/home/patrick/.local/bin:/home/patrick/go/bin:$PATH"


fpath+=${ZDOTDIR:-~}/.zsh_functions

unsetopt nomatch

function git_delete_unused_branches() {
    git fetch -p;
    for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}');
    do 
        git branch -D $branch; 
    done
}
