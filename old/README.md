Steps to follow
===============

## Terminal Configuration

### iTerm2 (macOS)

1. Import gruvbox-dark colorscheme

### Terminal App (Windows 10)

1. Install Terminal App (enable WSL2 and install any *nix distro)

## Shell Configuration

1. Install Zsh (https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
2. Install Oh My Zsh for Zsh configuration management (https://github.com/ohmyzsh/ohmyzsh)
3. Optionally, install the powerline10K Zsh theme (https://github.com/romkatv/powerlevel10k)
```sh
p10k configure
```
4. Copy tmux.conf 
```sh
cp tmux.conf to ~/.tmux.conf
```
5. Install Ranger (Unix)
```sh
sudo apt update
sudo apt install ranger
```
6. Install Ranger Dev Icons and update rc.confg
```sh
git clone git@github.com:alexanderjeurissen/ranger_devicons.git ~/.config/ranger/plugins/ranger_devicons

# Add the following to rc.conf

default_linemode devicons
```
7. If devicon glyphs are not available, patch the system font or install a new font (https://github.com/ryanoasis/nerd-fonts).
```sh
" If using Terminal under Windows 10, CascadiaCode is the default font. It's a beautiful font! Just download the font source files and patch it.
" In the cloned repo, execute the following

./font-patcher /mnt/c/Users/USERPROFILE/Downloads/CascadiaCode-2009.14/ttf/static/CascadiaCode-Regular.ttf

" Create a symlink for python3, if required

sudo ln -s /usr/bin/pythonX.X /usr/bin/python
```
8. Install Ranger support for Image Previews with w3m (https://github.com/ranger/ranger/wiki/Image-Previews)
```sh
sudo apt update
sudo apt install e2m
```
9. Ensure Ranger config (rc.conf) is updated to enable image previews

## Code Editor Configuration

### Vim Configuration

1. Copy vimrc to $HOME
2. Copy BufOnly.vim to $HOME
3. Install Vundle manually 
```sh
git clone git@github.com:VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 
```
4. Comment colorscheme so that vimrc loads correctly
```sh
" colorscheme gruvbox
```
5. Install Plugins
```sh
:PluginInstall
```
6. Complete YouCompleteMe installation (https://github.com/Valloric/YouCompleteMe)

### Neovim

1. Install Neovim - https://github.com/neovim/neovim/wiki/Installing-Neovim
2. Create init.vim under ~/.config/nvim 
3. Add the following to init.vim to source vimrc into nvim
```sh
set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc
```
4. In nvim, check health of the installation and resolve any dependencies
```sh
:CheckHealth
```

## Other Configuration

### WSL2 Config

1. Copy wslconfig to C:\Users\<profilename>\.wslconfig

### WSL2 GUI Support (XRDP) - X Windows is the preferred options. See below.

1. As of September 2020, WSL2 does not support a GUI OOTB, please refer to [this](https://github.com/brewinvaz/dotfiles/blob/master/ubuntu_gui_config.md) guide to install XRDP.

### [OR] WSL2 GUI Support (X Server)

1. Refer to [this](https://wiki.ubuntu.com/WSL#Running_Graphical_Applications) guide. YouTube [Video](https://www.youtube.com/watch?v=ymV7j003ETA&ab_channel=GaryExplains).
2. Use VcXsrv as the X Server on Windows 10.

### Setting up a Linux Dev Environment on Windows with WSL2, etc.
1. See [this](https://www.youtube.com/watch?v=idW-an99TAM&t=1s&ab_channel=NickJanetakis) video.

### Ubuntu Clipboard (Optional)

1. :checkhealth shows a warning if clipboard is not present. Ubuntu headless does not have system clipboard. Ignore this warning for Ubuntu headless.
```sh
sudo apt install xsel
```

### Flake8 Config (Python Projects)

1. Copy flake8 to the user's home directory
```sh
cp flake8 $HOME/.config/flake8
```

### Dash (macOS)

1. Install Dash for documentation (Vim integration only works on Mac)
2. Go to https://kapeli.com/dash and download Dash
3. Vim plugin - https://github.com/rizzatti/dash.vim

### MacOS

1. Install ack to support ack.vim
```sh
brew install ack
```
