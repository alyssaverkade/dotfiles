source ~/antigen.zsh
source ~/.aliases
antigen bundle rimraf/k
antigen theme candy
antigen apply

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
