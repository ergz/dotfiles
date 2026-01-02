autoload -U colors && colors

# --- PATH setup ---
typeset -U path PATH

# append all path items here
path=(
  "$HOME/.amp/bin"
  "$HOME/.opencode/bin"
  "$HOME/.bun/bin"
  "$HOME/nvim-macos-arm64/bin"
  "$HOME/.local/bin"
  "$HOME/helix-25.07.1-aarch64-macos"
  $path
)

# Git branch support
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:*' enable git
setopt PROMPT_SUBST

# Updated prompt with Git branch
PROMPT='%F{green}%n@%m%f:%F{blue}%2~%f%F{yellow}${vcs_info_msg_0_}%f$ '

alias ls='ls -G'
source <(fzf --zsh)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
CONDA_ROOT="$HOME/miniconda3"
alias conda-start='eval "$(${CONDA_ROOT}/bin/conda shell.zsh hook)"'
alias nz='nvim ~/.zshrc'
alias sz='source ~/.zshrc'
alias lz='lazygit'
