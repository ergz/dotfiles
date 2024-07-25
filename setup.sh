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
    local dest="$DOTFILES_DIR/$(basename "$1")"
    if [ ! -e "$dest" ]; then
        mv "$source" "$dest"
        echo "Moved $1 to dotfiles directory"
    else
        echo "$1 already in dotfiles directory"
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
move_config ".config/kitty"
create_symlink "kitty" ".config/kitty"

move_config ".config/lazygit"
create_symlink "lazygit" ".config/lazygit"

# mv ~/.gitconfig "$DOTFILES_DIR/gitconfig"
# create_symlink "gitconfig" ".gitconfig"

echo "Dotfiles setup complete!"
