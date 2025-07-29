# Development Tools Cheatsheet

Quick reference for keyboard shortcuts and commands in our development setup.

## Alacritty Terminal

### Font & Display
| Shortcut | Action |
|----------|--------|
| `Ctrl + =` | Increase font size |
| `Ctrl + -` | Decrease font size |
| `Ctrl + 0` | Reset font size |
| `Ctrl+Shift+Return` | Toggle fullscreen |

### Text Selection & Copying
| Action | Method |
|--------|--------|
| **Copy** | `Ctrl+Shift+C` |
| **Paste** | `Ctrl+Shift+V` |
| **Select text** | Click + drag |
| **Select word** | Double-click |
| **Select line** | Triple-click |
| **Block selection** | `Ctrl + click + drag` |

### Scrolling & History
| Shortcut | Action |
|----------|--------|
| `Ctrl+Shift+K` | **Clear scrollback history** |
| `Shift + Page Up/Down` | Scroll up/down |
| Mouse wheel | Scroll |

### Window Management
| Shortcut | Action |
|----------|--------|
| `Ctrl+Shift+N` | New Alacritty window |
| `Ctrl+Shift+Q` | Quit Alacritty |

---

## Zsh & Oh My Zsh

### Autocompletion & Suggestions
| Key/Action | Description |
|------------|-------------|
| `→` (Right arrow) | **Accept autosuggestion** ⭐ |
| `Ctrl + →` | Accept one word of suggestion |
| `End` | Accept entire suggestion |
| `Tab` | Show completions menu |
| `Tab Tab` | Navigate completion options with arrows |

### History & Navigation
| Shortcut | Action |
|----------|--------|
| `↑` | Previous command (or search if partial typed) |
| `↓` | Next command |
| `!!` | Run last command |
| `!n` | Run command number n from history |
| `!string` | Run last command starting with "string" |

### Directory Navigation
| Command | Action |
|---------|--------|
| `..` | Go up one directory (no cd needed) |
| `...` | Go up two directories |
| `....` | Go up three directories |

### Zsh Power Features
| Feature | Example |
|---------|---------|
| **Glob patterns** | `ls **/*.js` (find all .js files recursively) |
| **Spelling correction** | Suggests corrections for mistyped commands |
| **Smart case completion** | Tab completion ignores case differences |

---

## fzf (Fuzzy Finder) ⭐

### Essential Shortcuts
| Shortcut | Action |
|----------|--------|
| `Ctrl+R` | **Fuzzy search command history** ⭐ |
| `Ctrl+T` | **Fuzzy find files** ⭐ |
| `Alt+C` | **Fuzzy find directories and cd** |

### Tab Completion
| Usage | Action |
|-------|--------|
| `vim **<Tab>` | Fuzzy find files for vim |
| `cd **<Tab>` | Fuzzy find directories for cd |
| `kill <Tab>` | Fuzzy select process to kill |

### fzf Interface
| Key | Action |
|-----|--------|
| `↑↓` or `Ctrl+J/K` | Navigate results |
| `Enter` | Select |
| `Esc` or `Ctrl+C` | Cancel |
| `Tab` | Multi-select |
| `Ctrl+A` | Select all |

---

## ripgrep (rg) - Fast Text Search

### Basic Commands
| Command | Action |
|---------|--------|
| `rg "pattern"` | Search for pattern in current directory |
| `rg "pattern" -i` | Case-insensitive search |
| `rg "pattern" -C 3` | Show 3 lines of context |
| `rg -w "word"` | Search for whole word only |
| `rg --files` | List all files that would be searched |

### Custom Aliases (we added these)
| Alias | Command | Description |
|-------|---------|-------------|
| `search "text"` | `rg -i "text"` | Case-insensitive search |
| `searchjs "text"` | `rg --type js "text"` | Search only JavaScript files |
| `searchall "text"` | `rg -uuu "text"` | Search everything (including ignored files) |

### File Type Filters
| Command | Action |
|---------|--------|
| `rg "pattern" --type js` | Search JavaScript files |
| `rg "pattern" --type py` | Search Python files |
| `rg "pattern" --type md` | Search Markdown files |
| `rg "pattern" -g "*.toml"` | Search specific file pattern |

### Useful Patterns
| Command | Use Case |
|---------|----------|
| `rg "TODO\|FIXME\|HACK"` | Find all todos and fixmes |
| `rg "^function\|^const.*="` | Find function definitions |
| `rg "^import.*from"` | Find import statements |
| `rg -l "pattern"` | Show only filenames (not content) |

---

## Powerlevel10k Prompt

### Prompt Information
| Element | Shows |
|---------|--------|
| **Directory** | Current directory (truncated smartly) |
| **Git branch** | Current git branch with  icon |
| **Git status** | Changes, commits ahead/behind |
| **Exit codes** | When commands fail |
| **Execution time** | For commands taking >3 seconds |
| **Timestamp** | When command completed |

### Configuration
| Command | Action |
|---------|--------|
| `p10k configure` | **Reconfigure prompt** |
| `p10k reload` | Reload configuration |

---

## Oh My Zsh Git Plugin

### Essential Git Aliases
| Alias | Command | Description |
|-------|---------|-------------|
| `g` | `git` | Short git command |
| `ga` | `git add` | Add files to staging |
| `gaa` | `git add --all` | Add all files |
| `gc` | `git commit -v` | Commit with verbose output |
| `gc!` | `git commit -v --amend` | Amend last commit |
| `gcm` | `git commit -m` | Commit with message |
| `gco` | `git checkout` | Checkout branch/file |
| `gcb` | `git checkout -b` | Create and checkout new branch |

### Status & Information
| Alias | Command | Description |
|-------|---------|-------------|
| `gst` | `git status` | Show working tree status |
| `gl` | `git pull` | Pull from remote |
| `gp` | `git push` | Push to remote |
| `gd` | `git diff` | Show changes |
| `gds` | `git diff --staged` | Show staged changes |
| `glog` | `git log --oneline --decorate --graph` | Pretty log |

### Branch Management
| Alias | Command | Description |
|-------|---------|-------------|
| `gb` | `git branch` | List branches |
| `gba` | `git branch -a` | List all branches (including remote) |
| `gbd` | `git branch -d` | Delete branch |
| `gbda` | `git branch --no-color --merged \| command grep -vE "^(\+\|\*\|\s*(master\|develop\|dev)\s*$)" \| command xargs -n 1 git branch -d` | Delete merged branches |

### Remote Operations
| Alias | Command | Description |
|-------|---------|-------------|
| `gf` | `git fetch` | Fetch from remote |
| `gfa` | `git fetch --all --prune` | Fetch all remotes |
| `gpsup` | `git push --set-upstream origin $(git_current_branch)` | Push and set upstream |
| `grb` | `git rebase` | Rebase current branch |
| `grbi` | `git rebase -i` | Interactive rebase |

### Stash Operations
| Alias | Command | Description |
|-------|---------|-------------|
| `gsta` | `git stash push` | Stash changes |
| `gstaa` | `git stash apply` | Apply stash |
| `gstd` | `git stash drop` | Drop stash |
| `gstl` | `git stash list` | List stashes |
| `gstp` | `git stash pop` | Pop stash |

### Common Workflows
| Workflow | Commands |
|----------|----------|
| **Quick commit** | `gaa` → `gcm "message"` → `gp` |
| **New feature branch** | `gco main` → `gl` → `gcb feature-name` |
| **Check status** | `gst` → `gd` (see changes) |
| **Amend last commit** | `gaa` → `gc!` |
| **Clean merged branches** | `gco main` → `gl` → `gbda` |

---

## Git Integration

### Command-not-found
When you mistype a command, it suggests the package to install:
```bash
$ batcat
Command 'batcat' not found, but can be installed with:
sudo apt install bat
```

---

## Pro Tips

### Workflow Combinations
| Workflow | Commands |
|----------|----------|
| **Find and edit file** | `Ctrl+T` → select file → `vim filename` |
| **Search in code** | `rg "pattern"` → note file → `vim filename` |
| **Recent command** | `Ctrl+R` → type partial → select |
| **Navigate project** | `..` or `...` → `ls` → `cd dirname` |

### Muscle Memory Priority
Learn these first (most impactful):
1. **`→` (right arrow)** - Accept zsh suggestions
2. **`Ctrl+R`** - Fuzzy history search  
3. **`Ctrl+T`** - Fuzzy file finder
4. **`search "text"`** - Quick ripgrep search

### Efficiency Boosters
- **Stop typing full paths** - Use `Ctrl+T` and autosuggestions
- **Stop typing long commands** - Use `Ctrl+R` to find previous ones
- **Stop using `grep`** - Use `rg` or `search` alias instead
- **Use glob patterns** - `ls **/*.js` instead of `find`

---

## Troubleshooting

### Common Issues
| Problem | Solution |
|---------|----------|
| Autosuggestions not working | Check `→` key, reload with `source ~/.zshrc` |
| fzf not found | Check plugins in `.zshrc`, reinstall with `sudo apt install fzf` |
| ripgrep aliases missing | Check `~/.config/zsh/aliases.zsh` is sourced |
| Config changes not applying | Check symlinks: `ls -la ~/.zshrc ~/.config/alacritty/` |

### Reload Configurations
| Component | Command |
|-----------|---------|
| **Zsh config** | `source ~/.zshrc` |
| **Alacritty config** | Automatic (live_config_reload = true) |
| **New terminal** | Open new Alacritty window |

---

*This cheatsheet lives in your dotfiles repo and syncs across all machines!*  
*Last updated: [Current Session]*
