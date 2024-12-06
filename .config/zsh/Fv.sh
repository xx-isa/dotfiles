#!/usr/bin/env zsh

fd --hidden --color=always --type f "${*:-}" |
    fzf \
    --ansi \
    --preview="bat -p --color=always {}" \
    --bind "enter:become(nvim {})"
