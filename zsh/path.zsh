#!/usr/bin/env zsh

# PATH Management
# This file manages all PATH additions in one place

# Function to safely add to PATH (avoids duplicates)
add_to_path() {
    if [[ -d "$1" ]] && [[ ":$PATH:" != *":$1:"* ]]; then export PATH="$1:$PATH"
    fi
}

# System paths
add_to_path "/usr/local/bin"
add_to_path "/usr/bin"
add_to_path "/bin"

# User-specific paths
add_to_path "$HOME/.local/bin"
add_to_path "$HOME/bin"

# Development tools
add_to_path "$HOME/.cargo/bin"
add_to_path "$PNPM_HOME"

# Mac-specific paths
if [[ "$OSTYPE" == "darwin"* ]]; then
    add_to_path "/opt/homebrew/bin"
    add_to_path "/opt/homebrew/sbin"
fi
    
# Ubuntu-specific paths
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
fi

# Clean up the function
unset -f add_to_path

eval "$(mise activate zsh --shims)"
