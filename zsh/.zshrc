autoload -U colors && colors

PROMPT='%F{green}%n@%m%f:%F{blue}%2~%f$ '

export PATH="$PATH:$HOME/nvim-macos-arm64/bin:$HOME/.local/bin:$HOME/tools/fd:$HOME/tools/rg:$HOME/tools/bat"
alias ls='ls -G'
source <(fzf --zsh)


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/Users/erodriguez/.bun/_bun" ] && source "/Users/erodriguez/.bun/_bun"

CONDA_ROOT="$HOME/miniconda3"
alias conda-start='eval "$(${CONDA_ROOT}/bin/conda shell.zsh hook)"'

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


alias nz='nvim ~/.zshrc'
alias sz='source ~/.zshrc'
