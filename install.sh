#!/bin/bash
set -e

echo "🚀 Setting up dotfiles..."
echo "================================"

# Detect OS
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "📱 Detected Linux (Ubuntu)"
    ./scripts/setup-ubuntu.sh
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "🍎 Detected macOS" 
    ./scripts/setup-macos.sh
else
    echo "❌ Unsupported OS: $OSTYPE"
    exit 1
fi

echo ""
echo "Creating symlinks..."
./scripts/symlink.sh

echo ""
echo "✅ Dotfiles setup complete!"
echo ""
echo "Next steps:"
echo "1. Restart your terminal or run: source ~/.zshrc"
echo "2. If this is your first time with Powerlevel10k, run: p10k configure"
echo "3. Your old configs have been backed up to ~/.dotfiles-backup-*"
