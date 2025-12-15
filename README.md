# dotfiles

---

````markdown
# 🔧 My Dotfiles

A comprehensive collection of my personal configuration files for **Neovim (LazyVim)**, **Tmux**, and other developer tools. This repository is structured as a monorepo to make syncing my environment across Windows, Mac, and Linux seamless.

## 📂 Repository Structure

```text
~/dotfiles/
├── nvim/             # Neovim configuration (LazyVim, LSP, Themes)
├── tmux/             # Tmux configuration
└── README.md         # This file
```
````

---

## ⚡ Quick Start

### 1\. Install Dependencies

Before cloning this repo, you must install **Neovim** and its required build tools (**The "Big 3"**: GCC, Ripgrep, FD).

#### 🪟 Windows (via Scoop)

_Highly recommended to use [Scoop](https://scoop.sh/) to avoid PATH/Permission errors._

```powershell
# 1. Install Scoop (if not installed)
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex

# 2. Install Neovim & Required Tools
scoop bucket add extras
scoop install neovim gcc ripgrep fd git nodejs 7zip
```

#### 🍎 MacOS (via Homebrew)

```bash
brew install neovim ripgrep fd node gcc
```

#### 🐧 Linux (Ubuntu/Debian)

```bash
sudo apt update
sudo apt install neovim ripgrep fd-find build-essential nodejs npm
```

---

### 2\. Clone the Repository

Clone this repo to your home directory.

```bash
# Windows / Mac / Linux
git clone [https://github.com/YOUR_USERNAME/dotfiles.git](https://github.com/YOUR_USERNAME/dotfiles.git) ~/dotfiles
```

---

### 3\. Link Configuration (Symlinks)

Neovim expects config files in a specific system folder. We create a "Symbolic Link" so the system reads files directly from your `~/dotfiles` folder.

#### 🪟 Windows (PowerShell)

_Run as a regular user._

```powershell
# 1. Back up/Remove any existing default config
Remove-Item "$env:LOCALAPPDATA\nvim" -Recurse -Force -ErrorAction SilentlyContinue

# 2. Create the Symlink (Links AppData -> dotfiles)
New-Item -ItemType SymbolicLink -Path "$env:LOCALAPPDATA\nvim" -Target "$HOME\dotfiles\nvim"

# 3. (Optional) Link Tmux config if using Git Bash/WSL
New-Item -ItemType SymbolicLink -Path "$HOME\.tmux.conf" -Target "$HOME\dotfiles\tmux\.tmux.conf"
```

#### 🍎 MacOS / 🐧 Linux (Stow or Manual)

**Option A: Using GNU Stow (Recommended)**
_Requires `brew install stow` or `apt install stow`_

```bash
cd ~/dotfiles
stow nvim
stow tmux
```

**Option B: Manual Linking**

```bash
rm -rf ~/.config/nvim
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
```

---

### 4\. Final Setup (LazyVim)

Now that everything is linked, just run Neovim.

1.  Open your terminal and type:

    ```bash
    nvim
    ```

2.  **Wait**: You will see a blue screen. LazyVim will automatically download:
    - The Plugin Manager (`lazy.nvim`)
    - Plugins (Theme, Dashboard, etc.)
    - Language Servers (TypeScript, Lua, etc. via `Mason`)
    - Treesitter Parsers (Syntax Highlighting)

3.  **Verify**:
    Run this command inside Neovim to ensure all tools are detected:

    ```vim
    :checkhealth
    ```

---

## 🛠️ Tech Stack & Tools

- **Editor:** [Neovim](https://neovim.io/) (v0.10+)
- **Framework:** [LazyVim](https://www.lazyvim.org/)
- **Theme:** Solarized Osaka
- **Font:** JetBrains Mono Nerd Font (Required for icons)
- **Search Tools:** `ripgrep` (Grep), `fd` (Files), `fzf` (Fuzzy Finder)

## 📝 Cheatsheet

**Updating Config:**
Make changes in `~/dotfiles/nvim`, then push to sync across machines:

```bash
cd ~/dotfiles
git add .
git commit -m "feat: added new keymap"
git push
```

**Pulling on New Machine:**

```bash
cd ~/dotfiles
git pull
```

```

```
