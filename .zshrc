bindkey -e
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
