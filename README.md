# Neovim Dotfiles

This repository contains my personal Neovim configuration using `lazy.nvim` as the plugin manager. The setup is modular and organized for easy customization and scalability.

---

## **Installation Instructions**

### 1. Clone the Repository

```bash
git clone git@github.com:yourusername/dots.nvim.git ~/.config/nvim
```

### 2. Install `lazy.nvim`

`lazy.nvim` is the plugin manager used in this setup. Install it by running:

```bash
git clone https://github.com/folke/lazy.nvim ~/.local/share/nvim/lazy/lazy.nvim
```

### 3. Launch Neovim

Start Neovim:

```bash
nvim
```

### 4. Install Plugins

Run the following command in Neovim to install all defined plugins:

```vim
:Lazy sync
```
