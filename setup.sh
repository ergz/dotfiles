#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
OVERWRITE=false

# Check for overwrite flag
if [ "$1" = "--overwrite" ]; then
  OVERWRITE=true
fi

# Create dotfiles directory if it doesn't exist
mkdir -p "$DOTFILES_DIR"

# Function to move configuration to dotfiles directory
move_config() {
  local source="$HOME/$1"
  local target_dir="$DOTFILES_DIR"

  if [ -n "$2" ]; then
    target_dir="$DOTFILES_DIR/$2"
  fi

  local dest="$target_dir/$(basename "$1")"

  mkdir -p "$target_dir"

  if [ ! -e "$dest" ]; then
    mv "$source" "$dest"
    echo "Moved $1 to $target_dir"
  else
    echo "$1 already in $target_dir"
  fi
}

# Function to create a symbolic link
create_symlink() {
  local source="$DOTFILES_DIR/$1"
  local target="$HOME/$2"

  if [ ! -e "$target" ] || [ "$OVERWRITE" = true ]; then
    ln -sf "$source" "$target"
    echo "Created symlink for $1"
  else
    echo "Symlink for $1 already exists (use --overwrite to replace)"
  fi
}

# Move and symlink configurations
#move_config ".config/kitty" "configs"
#create_symlink "kitty" ".config/kitty"
#
# move_config ".config/lazygit" "configs"
# create_symlink "configs/lazygit" ".config/lazygit"

# move_config ".bashrc" "shell"
# create_symlink "shell/.bashrc" ".bashrc"
# #
# move_config ".config/rofi" "configs"
# create_symlink "rofi" ".config/rofi"

#move_config ".config/dunst" "dunst"
#create_symlink "dunst" ".config/dunst"

#move_config ".config/rofi" "configs"
#create_symlink "dunst" ".config/dunst"

# mv ~/.gitconfig "$DOTFILES_DIR/gitconfig"
# create_symlink "gitconfig" ".gitconfig"
#
#
create_symlink "zellij" ".config/zellij"

echo "Dotfiles setup complete!"
