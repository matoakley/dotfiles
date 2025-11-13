# My Dotfiles

Personal development environment configuration for Ubuntu and macOS.

## What's Included

- **Zsh** with Oh My Zsh and Powerlevel10k theme
- **Alacritty** terminal emulator configuration
- **Essential tools**: fzf, ripgrep, mise, and useful aliases
- **Cross-platform**: Works on Ubuntu and macOS

## Quick Start

```bash
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

## Tools Installed

### Ubuntu
- zsh, fzf, ripgrep, git, curl, wget, build-essential

### macOS  
- Same tools via Homebrew + Alacritty app

## Customization

- Edit configs in `~/dotfiles/` directory
- Create `~/.zshrc.local` for machine-specific settings (not tracked)
- Commit and push changes to sync across machines

## Structure

```
dotfiles/
├── install.sh              # Main installer
├── Brewfile                # macOS packages  
├── packages.txt            # Ubuntu packages
├── alacritty/
│   └── alacritty.toml      # Terminal config
├── zsh/
│   ├── .zshrc              # Zsh configuration
│   ├── .p10k.zsh           # Powerlevel10k config
│   └── aliases.zsh         # Custom aliases
└── scripts/
    ├── setup-ubuntu.sh     # Ubuntu setup
    ├── setup-macos.sh      # macOS setup  
    └── symlink.sh          # Create symlinks
```

## Manual Steps After Installation

1. Restart your terminal or run: `source ~/.zshrc`
2. If this is your first time with Powerlevel10k, run: `p10k configure`
3. Your old configs have been backed up to `~/.dotfiles-backup-*`

## Updating Dotfiles

When you make changes to your configuration:

```bash
cd ~/dotfiles
git add -A
git commit -m "Update configuration"
git push
```

To update on other machines:

```bash
cd ~/dotfiles
git pull
./install.sh  # Re-run if needed
```
