# run graphical session stuff if login on tty1
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec ~/bin/sway_session
fi
# start tmux
tty | grep -qE '/dev/tty[0-9]+'; IS_TTY=$?
command -v tmux>/dev/null; HAS_TMUX=$?
if [[ $HAS_TMUX -eq 0 ]] && [[ $IS_TTY -ne 0 ]] && [[ ! $TERM =~ screen ]]; then
    if tmux ls | grep -qv attached; then
        exec tmux attach
    else
        exec tmux new
    fi
fi

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=0
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' #make tab completion case-insensitive
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
setopt completeinword

autoload zmv

autoload select-word-style
select-word-style shell

# ctrl-v in normal mode to edit cmd in editor
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd '^v' edit-command-line

#auto-correct
setopt correctall

HISTFILE=~/.zshhist
HISTSIZE=5000
SAVEHIST=500000
setopt appendhistory sharehistory histignorespace

#cd by typing only dirname, without "cd"
setopt auto_cd

#automatically use pushd
setopt auto_pushd
setopt pushd_ignore_dups

#extended globbing
setopt extendedglob
unsetopt caseglob
setopt glob_dots

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

#colors for ls/grep
if [[ -x "`whence -p dircolors`" ]]; then
    eval `dircolors`
    alias ls='ls -F --color=auto'
    alias grep='grep --color=auto'
fi

#grep alias
alias i='grep -i'

#find case-insensitively
function findi() { find $1 -iname "$2" };
alias f="noglob findi"

#ps grep alias
alias psg='ps aux | grep -i'

#zmv alias
alias mmv='noglob zmv -W'

#ls alias
alias lll='ls -alhF'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#zypper alias
alias zi='sudo zypper in'
alias zs='zypper se'
alias zu='sudo zypper ref && sudo zypper dup --auto-agree-with-licenses --auto-agree-with-product-licenses'
alias zr='sudo zypper rm'

#git alias
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gr='git rm'
alias gg='git grep'
alias gd='git difftool -y'
alias gmv='git mv'

# copypaste
alias c='xclip -selection clipboard'
alias cx='xclip'
alias p='xclip -selection clipboard -o'
alias px='xclip -o'

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

alias s='noglob sentences -s'
alias j='noglob jm'

alias t='date -Im'

#check for updates to dotfiles daily and auto-(kinda)-update
DOTUPDFILE="${TMPDIR:-/tmp}/dotfiles_upd_$UID"
LASTUPD=$(stat -c '%Y' $DOTUPDFILE 2>/dev/null)
NEXTUPD=((LASTUPD + (24 * 60 * 60)))
if [[ $? -ne 0 ]] || [[ $(date '+%s') -gt $NEXTUPD ]]; then
    echo "Checking for dotfiles updates."
    dot remote update > /dev/null
    if [[ $? -eq 0 ]]; then
        dot status | grep -q "branch is up to date"
        if [[ $? -ne 0 ]]; then
            dot pull
        else
            clear
        fi
    fi
    touch $DOTUPDFILE
fi

if [[ $IS_TTY -ne 0 ]]; then
    source ~/.zsh/powerline-prompt.zsh
fi

HIGH=~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
if [[ -f "$HIGH" ]]; then
    typeset -A ZSH_HIGHLIGHT_STYLES
    ZSH_HIGHLIGHT_STYLES[path]='none'
    source "$HIGH"
fi
