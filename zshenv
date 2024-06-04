export EDITOR=nvim
export VISUAL=nvim
export PAGER=bat
export TERMINAL=kitty
export BROWSER=firefox

# FZF
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*" 2> /dev/null'
export FZF_DEFAULT_OPTS='--color'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d ."
export FZF_ALT_C_OPTS="--color"
export FZF_CTRL_T_OPTS="--color --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_CTRL_R_OPTS="--color --preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
