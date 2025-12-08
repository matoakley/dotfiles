#!/bin/bash
set -e

echo "🚀 Setting up development environment..."
echo "========================================"
echo ""

echo "Creating symlinks..."
./scripts/symlink.sh

echo ""

# Detect OS and run setup
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "📱 Detected Linux (Ubuntu)"
    echo ""
    ./scripts/setup-ubuntu.sh
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "🍎 Detected macOS"
    echo ""
    ./scripts/setup-macos.sh
else
    echo "❌ Unsupported OS: $OSTYPE"
    exit 1
fi