# My Dotfiles

Personal development environment configuration for Ubuntu and macOS.

## What's Included

- **Zsh** with Oh My Zsh and Powerlevel10k theme (pre-configured)
- **Neovim** with LazyVim configuration
- **Essential CLI tools**: fzf, ripgrep, mise, lazygit
- **Custom aliases** for common tasks
- **Cross-platform**: Works on Ubuntu and macOS

## Quick Start
```bash
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

**IMPORTANT:** After installation completes, **restart your computer** for the shell change to take effect.

## What Gets Installed

### Both Platforms
- zsh, fzf, ripgrep, git, curl, wget, neovim
- mise (version manager for Elixir, Node, etc.)
- lazygit (terminal UI for git)
- Oh My Zsh with plugins (autosuggestions, syntax highlighting)
- Powerlevel10k theme (pre-configured)

### Ubuntu Only
- build-essential, command-not-found
- Automatically removes Snap

### macOS Only  
- Homebrew packages via Brewfile
- Alacritty terminal app

## Structure
```
dotfiles/
├── install.sh              # Main installer
├── Brewfile                # macOS packages  
├── packages.txt            # Ubuntu apt packages
├── alacritty/
│   └── alacritty.toml      # Terminal config
├── nvim/                   # LazyVim configuration
├── zsh/
│   ├── .zshrc              # Zsh configuration
│   ├── .p10k.zsh           # Powerlevel10k config (pre-configured)
│   ├── aliases.zsh         # Custom aliases
│   └── path.zsh            # PATH management
└── scripts/
    ├── setup-ubuntu.sh     # Ubuntu-specific setup
    ├── setup-macos.sh      # macOS-specific setup  
    └── symlink.sh          # Create symlinks
```

## Post-Installation

1. **Restart your computer** (required for shell change)
2. Open a new terminal - you'll see your configured Powerlevel10k prompt
3. Old configs are backed up to `~/.dotfiles-backup-YYYYMMDD-HHMMSS`

Optional:
- Run `p10k configure` if you want to customize the prompt
- Create `~/.zshrc.local` for machine-specific settings (not tracked in git)

## Customization

- Edit configs in `~/dotfiles/` directory
- Changes sync across machines via git
- The installer is idempotent - safe to run multiple times

## Updating Dotfiles

**On this machine:**
```bash
cd ~/dotfiles
git add -A
git commit -m "Update configuration"
git push
```

**On other machines:**
```bash
cd ~/dotfiles
git pull
./install.sh  # Re-run installer to apply changes
```

## Tools & Shortcuts

See [CHEATSHEET.md](CHEATSHEET.md) for:
- Keyboard shortcuts
- Command aliases
- Common workflows