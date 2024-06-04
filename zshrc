# show_logos=("colorscript -r" "pokemon-colorscripts -r")
show_logos=("fastfetch" "pokemon-colorscripts -r")
$(shuf -n1 -e "${show_logos[@]}")
echo "\n"

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

zinit snippet PZT::modules/fasd/init.zsh
zinit snippet PZT::modules/environment/init.zsh
zinit snippet PZT::modules/history/init.zsh
zinit snippet PZT::modules/utility/init.zsh
zinit snippet PZT::modules/completion/init.zsh
bindkey -v

zinit ice lucid wait"0" atclone"sed -ie 's/fc -rl 1/fc -rli 1/' shell/key-bindings.zsh" \
  atpull"%atclone" multisrc"shell/{completion,key-bindings}.zsh" id-as junegunn/fzf_completions \
  pick"/dev/null"
zinit light junegunn/fzf

zinit light Aloxaf/fzf-tab
zinit light wookayin/fzf-fasd
zinit light mafredri/zsh-async
zinit ice wait'0' blockf lucid; zinit light zsh-users/zsh-completions
zinit ice lucid wait"1" lucid atload"!_zsh_autosuggest_start"; zinit load zsh-users/zsh-autosuggestions
zinit ice from'gh-r' as'program'; zinit light sei40kr/fast-alias-tips-bin
zinit light sei40kr/zsh-fast-alias-tips
zinit light zdharma-continuum/fast-syntax-highlighting
zinit ice depth=1; zinit light romkatv/powerlevel10k

alias mkdir='mkdir -p'
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias tm='tmux'
alias ee='neovide'
alias f=ranger
alias ldr=lazydocker
alias g=lazygit
alias jy='convfmt -f json -t yaml'

aurhelper='paru'
alias pi='$aurhelper'       # install package
alias pu='$aurhelper -Rns'  # uninstall package
alias pup='$aurhelper -Syu' # update system/package/aur
alias pl='$aurhelper -Qs'   # list installed package
alias pa='$aurhelper -Ss'   # list availabe package
alias pc='$aurhelper -Sc'   # remove unused cache
alias po='$aurhelper -Qtdq | $aurhelper -Rns -' # remove unused packages

## Editor mode
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^v' edit-command-line
bindkey -M vicmd '^v' edit-command-line
bindkey jk vi-cmd-mode

## Vi mode
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]]  ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]]     ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
echo -ne '\e[5 q'
preexec() {
  echo -ne '\e[5 q'
}

eval "$(zoxide init zsh)"

## p10k, to customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
