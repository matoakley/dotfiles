#!/bin/bash
echo "📦 Installing Ubuntu packages..."

# Update package list
sudo apt update

# Remove Snap
echo "Removing Snap..."
# Remove all snap packages first
snap list 2>/dev/null | awk 'NR>1 {print $1}' | while read snapname; do
    sudo snap remove --purge "$snapname"
done

# Remove snapd
sudo apt remove --purge -y snapd

# Prevent snapd from being reinstalled
sudo apt-mark hold snapd

echo "✅ Snap removed"
echo ""

# Install packages from list
echo "Installing packages..."
while read -r package; do
    if [ -n "$package" ] && [ "${package:0:1}" != "#" ]; then
        if ! dpkg -l | grep -q "^ii  $package "; then
            echo "Installing $package..."
            sudo apt install -y "$package"
        else
            echo "$package already installed ✅"
        fi
    fi
done < packages.txt

# Set zsh as default shell (if not already set)
current_shell=$(getent passwd "$USER" | cut -d: -f7)
if [[ "$current_shell" != *"zsh"* ]]; then
    echo "Setting zsh as default shell..."
    chsh -s $(which zsh)
    echo "✅ Shell changed to zsh"
else
    echo "zsh is already the default shell ✅"
fi

# Install mise (not in apt repos)
if ! command -v mise &> /dev/null; then
    echo "Installing mise..."
    curl https://mise.run | sh
    echo "✅ mise installed"
else
    echo "mise already installed ✅"
fi

# Install lazygit (not in apt repos)
if ! command -v lazygit &> /dev/null; then
    echo "Installing lazygit..."
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit /usr/local/bin
    rm lazygit lazygit.tar.gz
    echo "✅ lazygit installed"
else
    echo "lazygit already installed ✅"
fi

# Install Oh My Zsh if not present
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install Powerlevel10k theme
if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
    echo "Installing Powerlevel10k theme..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
fi

# Install zsh plugins
echo "Installing zsh plugins..."

# zsh-autosuggestions
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi

# zsh-syntax-highlighting
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

echo ""
echo "✅ Setup complete!"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "⚠️  IMPORTANT: RESTART YOUR COMPUTER NOW"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "The shell change requires a full system restart to take effect."
echo "(Simply restarting the terminal is NOT sufficient)"
echo ""
echo "After restarting, open a new terminal to see your configured prompt."
echo ""
echo "Your old configs have been backed up to ~/.dotfiles-backup-*"
echo ""
