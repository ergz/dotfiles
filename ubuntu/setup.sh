#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"
LOCAL_BIN="$HOME/.local/bin"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

info() { printf '\033[1;34m=> %s\033[0m\n' "$*"; }
ok()   { printf '\033[1;32m✔  %s\033[0m\n' "$*"; }
err()  { printf '\033[1;31m✘  %s\033[0m\n' "$*"; }

mkdir -p "$LOCAL_BIN"

gh_latest_tag() {
  curl -fsSL "https://api.github.com/repos/$1/releases/latest" \
    | grep '"tag_name"' | head -1 | cut -d'"' -f4
}

# ---------------------------------------------------------------------------
# 1. APT essentials
# ---------------------------------------------------------------------------
info "Installing apt packages..."
sudo apt-get update -qq
sudo apt-get install -y -qq \
  build-essential \
  git \
  curl \
  wget \
  unzip \
  zip \
  tar \
  stow \
  jq \
  htop \
  tree \
  make \
  cmake \
  software-properties-common
ok "apt packages"

# ---------------------------------------------------------------------------
# 2. Neovim (GitHub release)
# ---------------------------------------------------------------------------
info "Installing Neovim..."
NVIM_TAG=$(gh_latest_tag "neovim/neovim")
NVIM_VER="${NVIM_TAG#v}"
NVIM_URL="https://github.com/neovim/neovim/releases/download/${NVIM_TAG}/nvim-linux-x86_64.tar.gz"
curl -fsSL "$NVIM_URL" -o "$TMP_DIR/nvim.tar.gz"
mkdir -p "$HOME/nvim"
tar xzf "$TMP_DIR/nvim.tar.gz" -C "$HOME/nvim" --strip-components=1
ln -sf "$HOME/nvim/bin/nvim" "$LOCAL_BIN/nvim"
ok "Neovim $NVIM_TAG"

# ---------------------------------------------------------------------------
# 3. fzf (GitHub release)
# ---------------------------------------------------------------------------
info "Installing fzf..."
FZF_TAG=$(gh_latest_tag "junegunn/fzf")
FZF_VER="${FZF_TAG#v}"
FZF_URL="https://github.com/junegunn/fzf/releases/download/${FZF_TAG}/fzf-${FZF_VER}-linux_amd64.tar.gz"
curl -fsSL "$FZF_URL" -o "$TMP_DIR/fzf.tar.gz"
tar xzf "$TMP_DIR/fzf.tar.gz" -C "$TMP_DIR"
install -m 755 "$TMP_DIR/fzf" "$LOCAL_BIN/fzf"
ok "fzf $FZF_TAG"

# ---------------------------------------------------------------------------
# 4. fd (GitHub release .deb)
# ---------------------------------------------------------------------------
info "Installing fd..."
FD_TAG=$(gh_latest_tag "sharkdp/fd")
FD_VER="${FD_TAG#v}"
FD_URL="https://github.com/sharkdp/fd/releases/download/${FD_TAG}/fd_${FD_VER}_amd64.deb"
curl -fsSL "$FD_URL" -o "$TMP_DIR/fd.deb"
sudo dpkg -i "$TMP_DIR/fd.deb"
ok "fd $FD_TAG"

# ---------------------------------------------------------------------------
# 5. ripgrep (GitHub release .deb)
# ---------------------------------------------------------------------------
info "Installing ripgrep..."
RG_TAG=$(gh_latest_tag "BurntSushi/ripgrep")
RG_VER="${RG_TAG}"
RG_URL="https://github.com/BurntSushi/ripgrep/releases/download/${RG_TAG}/ripgrep_${RG_VER}-1_amd64.deb"
curl -fsSL "$RG_URL" -o "$TMP_DIR/rg.deb"
sudo dpkg -i "$TMP_DIR/rg.deb"
ok "ripgrep $RG_TAG"

# ---------------------------------------------------------------------------
# 6. bat (GitHub release .deb)
# ---------------------------------------------------------------------------
info "Installing bat..."
BAT_TAG=$(gh_latest_tag "sharkdp/bat")
BAT_VER="${BAT_TAG#v}"
BAT_URL="https://github.com/sharkdp/bat/releases/download/${BAT_TAG}/bat_${BAT_VER}_amd64.deb"
curl -fsSL "$BAT_URL" -o "$TMP_DIR/bat.deb"
sudo dpkg -i "$TMP_DIR/bat.deb"
ok "bat $BAT_TAG"

# ---------------------------------------------------------------------------
# 7. lazygit (GitHub release)
# ---------------------------------------------------------------------------
info "Installing lazygit..."
LG_TAG=$(gh_latest_tag "jesseduffield/lazygit")
LG_VER="${LG_TAG#v}"
LG_URL="https://github.com/jesseduffield/lazygit/releases/download/${LG_TAG}/lazygit_${LG_VER}_linux_x86_64.tar.gz"
curl -fsSL "$LG_URL" -o "$TMP_DIR/lazygit.tar.gz"
tar xzf "$TMP_DIR/lazygit.tar.gz" -C "$TMP_DIR"
install -m 755 "$TMP_DIR/lazygit" "$LOCAL_BIN/lazygit"
ok "lazygit $LG_TAG"

# ---------------------------------------------------------------------------
# 8. nvm + Node.js
# ---------------------------------------------------------------------------
info "Installing nvm..."
export NVM_DIR="$HOME/.nvm"
if [ ! -d "$NVM_DIR" ]; then
  curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
fi
# shellcheck source=/dev/null
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install --lts
ok "nvm + Node $(node --version)"

# ---------------------------------------------------------------------------
# 9. uv (Python)
# ---------------------------------------------------------------------------
info "Installing uv..."
curl -fsSL https://astral.sh/uv/install.sh | sh
ok "uv"

# ---------------------------------------------------------------------------
# 10. R (latest from CRAN)
# ---------------------------------------------------------------------------
info "Installing R..."
sudo apt-get install -y -qq dirmngr gnupg apt-transport-https ca-certificates
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 2>/dev/null || true
UBUNTU_CODENAME=$(lsb_release -cs)
sudo add-apt-repository -y "deb https://cloud.r-project.org/bin/linux/ubuntu ${UBUNTU_CODENAME}-cran40/"
sudo apt-get update -qq
sudo apt-get install -y -qq r-base r-base-dev
ok "R $(R --version | head -1 | awk '{print $3}')"

# ---------------------------------------------------------------------------
# 11. Stow dotfiles
# ---------------------------------------------------------------------------
info "Stowing nvim config..."
stow -d "$DOTFILES_DIR" -t "$HOME" nvim
ok "nvim config stowed"

# ---------------------------------------------------------------------------
# Done
# ---------------------------------------------------------------------------
echo ""
ok "Setup complete!"
echo ""
echo "Installed to ~/.local/bin:"
ls -1 "$LOCAL_BIN"
echo ""
echo "Make sure ~/.local/bin is in your PATH."
