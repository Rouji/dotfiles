autoload colors
colors
autoload -Uz vcs_info
zstyle ":vcs_info:*" enable git

precmd() {
    vcs_info
}

setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:*:*' unstagedstr ' %F{172}%K{172}%F{black} unstaged '
zstyle ':vcs_info:*:*' stagedstr ' %F{154}%K{154}%F{black} staged '
zstyle ':vcs_info:*:*' stashedstr ' %F{93}%K{93}%F{white} stashed '
zstyle ':vcs_info:*'    formats "%m%u%c%F{237}%K{237}%F{white} %r [%b] %f%%b%k"
#zstyle ':vcs_info:*'    nvcsformats   "%f[%n@%m %1~]$ " ""
zstyle ':vcs_info:*'    actionformats "%F{93}%K{93}%F{white} %m%u%c %F{red}%K{red}%F{white} %a %F{27}%K{27}%F{white} %r [%b] %f%%b%k"

if [[ $UID == 0 || $EUID == 0 ]]; then
    HOSTPROMPT='%K{red}%F{white} %m %F{red}'
    DIRPROMPT='%K{235}%F{white} %~ %F{235}'
    PROMPT='$HOSTPROMPT$DIRPROMPT%k %f%b'
else
    HOSTPROMPT='%K{237}%F{white} %m %F{237}'
    DIRPROMPT='%K{235}%F{white} %(4~|.../%3~|%~) %F{235}'
    PROMPT='$HOSTPROMPT$DIRPROMPT%k %f%b'
fi
RPROMPT='${vcs_info_msg_0_}'
