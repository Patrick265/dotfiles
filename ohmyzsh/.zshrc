# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export VISUAL="nvim"

ZSH_THEME="edvardm"

zstyle ':omz:update' mode auto      # update automatically without asking

COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="yyyy/mm/dd"

plugins=(git 
	colorize
	docker
	compleat
	colored-man-pages
	history
	zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias e="nvim"
alias hm="cd $HOME"

alias ls="eza"
alias ll="eza -la"

alias reboot="echo \"no I don't think I will.\""
alias gsub="git submodule update --init --recursive"
alias gs="git status"
alias gc="git commit -m"
alias gp="git push"
alias gpu="git pull"
alias gall="git add *"
alias gclean="git_delete_unused_branches"
alias venv="source .venv/bin/activate"

export PATH="$PATH"
export PATH="$PATH:/usr/local/go/bin:/home/patrick/bin:"
export PATH="$PATH:/home/patrick/.local/bin:"
export PATH="$PATH:/home/patrick/bin/tracy/profiler/build/unix:"
export PATH="$PATH:/home/patrick/.cargo/bin"
export PATH="$PATH:/home/patrick/.spicetify"

fpath+=${ZDOTDIR:-~}/.zsh_functions

unsetopt nomatch
# export TERM=xterm-256color
export TERM=screen-256color
export SSH_AUTH_SOCK="/run/user/$(id -u)/keyring/ssh"


function git_delete_unused_branches() {
    git fetch -p;
    for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}');
    do 
        git branch -D $branch; 
    done
}

fpath+=${ZDOTDIR:-~}/.zsh_functions
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


