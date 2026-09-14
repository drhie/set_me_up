# Set Me Up
A humble local set up with personalized dotfiles and scripts

## zsh
Installed with:
- [oh-my-zsh](https://ohmyz.sh/)
- [powerlevel10k](https://github.com/romkatv/powerlevel10k)

## tmux
Installed with:
```
brew install tmux
```

## vim
Installed with:
- [vim-plug](https://github.com/junegunn/vim-plug)
- [NERDTree](https://github.com/scrooloose/nerdtree)

Fuzzy finding with:
- [fzf](https://github.com/junegunn/fzf#using-homebrew)
- [silver-searcher](https://github.com/ggreer/the_silver_searcher#macos)

## colour themes
Preferred iTerm2 colour themes imported with:
```
iTerm2 → Preferences → Profiles → Colors → Color Presets... → Import...
```
<sup>*.itermcolors files credited to [iterm2colorschemes.com](https://iterm2colorschemes.com).</sup>

## dotfile management
The `dotfile` shell function (defined in `.zshrc`) syncs dotfiles between this repo and `~`.

```
dotfile <operation> <name>
```

**Operations**
- `import` — copy from the repo into `~`, overwriting the local file
- `export` — copy from `~` into the repo, overwriting the repo file

**Supported names:** `vim`, `zsh`, `tmux`

Both operations prompt for confirmation before copying.

**Examples**
```
dotfile import zsh   # pull .zshrc from the repo to ~/.zshrc
dotfile export vim   # push ~/.vimrc back to the repo
```
