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

alias dr18="docker run -ti -u $(stat -c "%u:%g" $(pwd)) -v $(pwd):/home/docker mi-git.evs.tv:4567/docker/docker-linux/buildroot:18.04.3"
alias dr20="docker run -ti -u $(stat -c "%u:%g" $(pwd)) -v $(pwd):/home/docker mi-git.evs.tv:4567/docker/docker-linux/buildroot:20.04"
alias dr22="docker run -ti -u $(stat -c "%u:%g" $(pwd)) -v $(pwd):/home/docker mi-git.evs.tv:4567/docker/docker-linux/buildroot:22.04"
alias dr24="docker run -ti -u $(stat -c "%u:%g" $(pwd)) -v $(pwd):/home/docker mi-git.evs.tv:4567/docker/docker-linux/buildroot:24.04"
alias dr_xt_neuron="docker run -ti --cpus=12 --memory="20g" --memory-swap="-1" --name xt_server_neuron_sdk -v $(pwd):/workspace:rw --cap-add=SYS_PTRACE --security-opt seccomp=unconfined evs-xt-release-docker.artifactory.evs.tv/neuron-sdk:latest"
alias e="nvim"

alias hm="cd $HOME"

alias ll="ls -la"
alias reboot="echo \"no I don't think I will.\""

alias gsub="git submodule update --init --recursive"
alias gs="git status"
alias gc="git commit -m"
alias gp="git push"
alias gpu="git pull"
alias gall="git add *"
alias gclean="git_delete_unused_branches"
alias venv="source .venv/bin/activate"

alias sly1="~/.screenlayout/layout.sh"
alias sly2="~/.screenlayout/layout2.sh"


export PATH="$PATH"
export PATH="$PATH:/usr/local/go/bin:/home/patrick/bin:"
export PATH="$PATH:/home/patrick/.local/bin:"
export PATH="$PATH:/home/patrick/bin/tracy/profiler/build/unix:"
export PATH="$PATH:/home/patrick/bin/vcpkg/:/home/patrick/.cargo/bin:/home/patrick/go/bin"
export PATH="$PATH:/home/patrick/.spicetify"
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:/home/patrick/bin/odin"

fpath+=${ZDOTDIR:-~}/.zsh_functions

unsetopt nomatch
export TERM=xterm-256color
function git_delete_unused_branches() {
    git fetch -p;
    for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}');
    do 
        git branch -D $branch; 
    done
}

fpath+=${ZDOTDIR:-~}/.zsh_functions
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
