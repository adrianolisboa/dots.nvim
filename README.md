# Neovim Configuration

A clean, modular Neovim setup using `lazy.nvim` for plugin management.

## Quick Start

```bash
# 1. Clone this repository
git clone git@github.com:adrianolisboa/dots.nvim.git ~/.config/nvim

# 2. Install lazy.nvim plugin manager
git clone https://github.com/folke/lazy.nvim ~/.local/share/nvim/lazy/lazy.nvim

# 3. Launch Neovim and install plugins
nvim
# Then run inside Neovim:
# :Lazy sync
```

## Required Font

This configuration works best with FiraCode Nerd Font:

### macOS
```bash
brew tap homebrew/cask-fonts
brew install --cask font-fira-code-nerd-font
```

### Linux
```bash
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -fLo "FiraCode Nerd Font.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/FiraCodeNerdFontMono-Regular.ttf
fc-cache -fv
```

### Windows
1. Download from [Nerd Fonts](https://www.nerdfonts.com/font-downloads) (FiraCode)
2. Extract and install the font files

After installation, set your terminal to use "FiraCode Nerd Font" or "FiraCode Nerd Font Mono".
