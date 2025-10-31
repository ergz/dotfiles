autoload -U colors && colors

# Git branch support
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:*' enable git
setopt PROMPT_SUBST

# Updated prompt with Git branch
PROMPT='%F{green}%n@%m%f:%F{blue}%2~%f%F{yellow}${vcs_info_msg_0_}%f$ '

export PATH="$PATH:$HOME/nvim-macos-arm64/bin:$HOME/.local/bin:$HOME/tools/fd:$HOME/tools/rg:$HOME/tools/bat:$HOME/tools/lazygit/:$HOME/tools/fzf/"
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
alias lz='lazygit'

# opencode
export PATH=$HOME/.opencode/bin:$PATH
