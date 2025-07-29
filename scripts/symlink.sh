#!/bin/bash
echo "🔗 Creating symlinks..."

# Create backup directory
backup_dir="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$backup_dir"

# Function to create symlink with backup
create_symlink() {
    local source="$1"
    local target="$2"
    
    if [ -e "$target" ]; then
        echo "Backing up existing $(basename "$target")"
        mv "$target" "$backup_dir/"
    fi
    
    # Create parent directory if it doesn't exist
    mkdir -p "$(dirname "$target")"
    
    # Create the symlink
    ln -sf "$source" "$target"
    echo "✅ Linked $(basename "$source") -> $target"
}

# Get the absolute path to dotfiles directory
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Create symlinks
create_symlink "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
create_symlink "$DOTFILES_DIR/zsh/.p10k.zsh" "$HOME/.p10k.zsh"
create_symlink "$DOTFILES_DIR/alacritty/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"

# Create config directory and symlink aliases if it exists
if [ -f "$DOTFILES_DIR/zsh/aliases.zsh" ]; then
    mkdir -p "$HOME/.config/zsh"
    create_symlink "$DOTFILES_DIR/zsh/aliases.zsh" "$HOME/.config/zsh/aliases.zsh"
fi

echo "🎉 Symlinks created! Backup saved to: $backup_dir"
