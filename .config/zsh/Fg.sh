#!/bin/zsh

rg --color=always --line-number --hidden --no-heading --smart-case "${*:-}" |
    fzf --ansi \
        --delimiter : \
        --preview "bat --color=always {1} --highlight-line {2} --style=numbers" \
        --preview-window "down,60%,border-top,+{2}+3/3" \
        --bind "enter:become(nvim {1} +{2})"
