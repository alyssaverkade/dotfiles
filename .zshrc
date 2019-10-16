bindkey -e
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
autoload -U edit-command-line
setopt histignorealldups
setopt histreduceblanks
setopt incappendhistory
setopt sharehistory
setopt autocd
setopt autolist
setopt automenu
setopt alwaystoend
setopt extendedglob
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
autoload -Uz compinit
compinit
unsetopt beep # ANNOYING
source ~/.aliases
source ~/.profile

zplug 'cbrock/sugar-free', as:theme

globalias() {
   if [[ $LBUFFER =~ ' [A-Z0-9]+$' ]]; then
     zle _expand_alias
     zle expand-word
   fi
   zle self-insert
}

zle -N globalias

bindkey " " globalias
bindkey "^ " magic-space
bindkey -M isearch " " magic-space
eval "$(rbenv init -)"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

fpath=(/usr/local/share/zsh-completions $fpath)
