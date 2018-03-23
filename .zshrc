# start tmux
if command -v tmux>/dev/null; then
    if [[ ! $TERM =~ screen ]] && [ -z $TMUX ]; then
        if tmux ls | grep -qv attached; then
            exec tmux attach
        else
            exec tmux new
        fi
    fi
fi

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=0
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' #make tab completion case-insensitive
zstyle :compinstall filename '$HOME/andi/.zshrc'

autoload -Uz compinit
compinit
setopt completeinword


autoload select-word-style
select-word-style shell

#auto-correct
setopt correctall

HISTFILE=~/.zshhist
HISTSIZE=5000
SAVEHIST=50000
setopt appendhistory sharehistory

#cd by typing only dirname, without "cd"
setopt auto_cd

#automatically use pushd
setopt auto_pushd
setopt pushd_ignore_dups

#extended globbing
setopt extendedglob
unsetopt caseglob

#vi-mode
bindkey -v
bindkey -v '^?' backward-delete-char

#colour prompt
autoload -U colors
colors
#PROMPT="%B%F{green}%n@%m%f%b:%B%F{blue}%~%f%b> "
PROMPT="%B%F{green}%B%F{blue}%~%f%b> "


#display cpu stats for commands taking longer than 5sec
REPORTTIME=5

#timeout for ESC etc.
KEYTIMEOUT=10

#prevent useless 'no matches found' error
setopt nonomatch

#colors for ls
if [[ -x "`whence -p dircolors`" ]]; then
    eval `dircolors`
    alias ls='ls -F --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#ls alias
alias lll='ls -alhF'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


#zypper alias
alias zi='sudo zypper in'
alias zs='zypper se'
alias zu='sudo zypper dup'
alias zr='sudo zypper rm'

#git alias
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'

#googler alias
alias g='googler -n 5 -l ja'

#(n)vim alias
export EDITOR=vi
if type "vim" >/dev/null; then
    alias vi='vim'
    export EDITOR=vim
fi
if type "nvim" >/dev/null; then
    alias vim='nvim'
    export EDITOR=nvim
fi

#LANG=C shortcut
alias lc='LANG=C'

#dotfiles git repo stuff
alias dot='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

source ~/.zsh/powerline-prompt.zsh
source ~/.zsh/git-hub/.rc
