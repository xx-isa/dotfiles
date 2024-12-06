if [ -n "${ZSH_DEBUGRC+1}" ]; then
    zmodload zsh/zprof
fi

source $ZDOTDIR/config.zsh

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" ||\
    printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

export FZF_DEFAULT_OPTS=" \
--color=spinner:#f2d5cf,hl:#e78284 \
--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
--color=marker:#babbf1,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284 \
--color=selected-bg:#51576d \
--layout reverse \
--multi"

source <(fzf --zsh)

autoload -U compinit
compinit -C

source "$ZDOTDIR/ensure-zinit.zsh"

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

zinit light Aloxaf/fzf-tab

zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

zinit ice has'eza' atinit'AUTOCD=1' silent
zinit light z-shell/zsh-eza

function zvm_after_init() {
  zvm_bindkey viins "^R" fzf-history-widget
}

unalias zi
eval "$(zoxide init zsh)"

alias nivm="nvim"
alias Fv="${ZDOTDIR}/Fv.sh"
alias Fg="${ZDOTDIR}/Fg.sh"
alias ngit='nvim -c "Neogit" -c "bd 1"'

[ -f "/home/irmel/.ghcup/env" ] && . "/home/irmel/.ghcup/env" # ghcup-env

if [ -n "${ZSH_DEBUGRC+1}" ]; then
    zprof
fi
