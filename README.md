## ZSH Plugins

*  Install zsh plugins

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## Tools Setup

### fzf and bat (for syntax highlighting)

* Install [fzf](https://github.com/junegunn/fzf) for fuzzy search capabilities

```sh
brew install fzf
```

* Install bat for syntax highlighting in `fzf` results

```sh
brew install bat
```

* Add open with `nvim` alias to `.zshrc`

```sh
alias fzfnv='nvim  $(fzf -m --preview="bat --color=always {}")'
```
