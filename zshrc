# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle :compinstall filename '/Users/barrett/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

key=(
    BackSpace "${terminfo[kbs]}"
    Home "${terminfo[khome]}"
    End "${terminfo[kend]}"
    Insert "${terminfo[kich1]}"
    Delete "${terminfo[kdch1]}"
    Up "${terminfo[kcuu1]}"
    Down "${terminfo[kcud1]}"
    Left "${terminfo[kcub1]}"
    Right "${terminfo[kcuf1]}"
    PageUp "${terminfo[kpp]}"
    PageDown "${terminfo[knp]}"
)

if [ -z $HISTFILE ]; then
    HISTFILE=~/.zsh_history
fi

HISTSIZE=10000000
SAVEHIST=10000000
setopt sharehistory
setopt histignoredups
setopt autocd
setopt ignoreeof
unsetopt beep

bindkey -e

bindkey "^[[3~" delete-char
# END what do these do?

# Easily scroll up and down through matches when searching history
bindkey "$key[Up]" history-beginning-search-backward
bindkey "$key[Down]" history-beginning-search-forward

# Skip forward/back a word with opt-arrow
bindkey '[C' forward-word
bindkey '[D' backward-word

# Easily scroll up and down through matches when searching history
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

bindkey "^L" forward-word
bindkey "^H" backward-word

# bindkey "^W" forward-word
# bindkey "^B" backward-word

# Set theme e.g. redhat: "[barrett@barrett-mbp dotfiles]$ command arg1 arg2 ... argn"
# autoload -Uz promptinit
# promptinit
# prompt redhat
if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="white"; fi
PROMPT="%F{037}%B%n%b%{$reset_color%}@%m:%F{254}%B%c%b%{$reset_color%} %(!.#.$) "
RPROMPT="[%*]"

export EDITOR=vim
export TERM="screen-256color"
if [[ $IN_DEVCONTAINER != true ]]; then
    export LANG=en_US.UTF-8
fi

if [[ $ITERM_PROFILE == "Light" ]]; then
    export LIGHT_COLORS=1
fi

# Have LS always display colors
if ls --color -d ~ >/dev/null 2>&1; then
    alias ls="ls --color=auto" # GNU ls
elif ls -G -d ~ >/dev/null 2>&1; then
    export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
    alias ls="ls -G" # BSD ls
fi

# Edit current command in vim with C-e C-e
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^e^e" edit-command-line

# Added fzf (fuzzy finder) https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Run and/or attach to tmux if it's installed and we're not already in it.
# (disabled for now because is messes with some testing framework stuff)
# if [ "$TMUX" = "" ] && (( $+commands[tmux] )); then
# 	tmux attach || tmux new;
# fi
