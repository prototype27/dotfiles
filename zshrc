# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kketcham/kketcham"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(osx terminalapp brew pip git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/texbin
fpath=(/usr/local/share/zsh-completions $fpath)

export EDITOR=vim
export PAGER=less
bindkey -e 

setopt appendhistory
setopt incappendhistory

alias cd="builtin cd"
alias man='nocorrect man'
alias mv='nocorrect mv'
alias mysql='nocorrect mysql'
alias mkdir='nocorrect mkdir'
alias gist='nocorrect gist'
alias heroku='nocorrect heroku'
alias ebuild='nocorrect ebuild'
alias hpodder='nocorrect hpodder'
alias sudo='nocorrect sudo'
setopt correct

# Warn if ssh-agent is running but doesn't have primary key added.
if [[ ! -z $SSH_AGENT_PID ]] &&
   [[ -f "$HOME/.ssh/id_rsa" ]] &&
   [[ -z `ssh-add -l | grep "$HOME/.ssh/id_rsa"` ]]; then
       echo "SSH agent detected, but key is not loaded. Run ssh-add to fix."
fi
