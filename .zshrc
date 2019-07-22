source ~/.aliases
source ~/antigen.zsh
antigen use oh-my-zsh
antigen bundle cargo
antigen bundle rust
antigen theme clean
antigen apply

eval "$(ssh-agent -s)"
eval "$(rbenv init -)"
