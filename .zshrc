# Load Antigen
source ~/.antigen/antigen.zsh

# Load Antigen configurations
antigen init ~/.antigenrc

# Setup alias for rmtrash
alias rm='rmtrash'
alias rmdir='rmdirtrash'
alias sudo='sudo '

# Kitty SSH compatibility
[[ "$TERM" == "xterm-kitty" ]] && alias ssh="kitty +kitten ssh"

# Exa ls aliases
# general use
alias ls='exa --icons'                                                          # ls
alias l='exa -lbF --git --icons'                                                # list, size, type, git
alias ll='exa -lbGF --git --icons'                                             # long list
alias llm='exa -lbGd --git --sort=modifie --icons'                            # long list, modified date sort
alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale --icons'  # all list
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale --icons' # all + extended list

# specialty views
alias lS='exa -1 --icons'                                                              # one column, just names
alias lt='exa --tree --level=2 --icons'                                         # tree

