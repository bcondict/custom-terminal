# custom-terminal

This is the config files for my terminal, here you'll find my config file

## Source Links

- [zshrc](./.zshrc)
- [p10k](https://github.com/romkatv/powerlevel10k)
- [tmux](https://github.com/gpakosz/.tmux)
- [nvim](https://github.com/craftzdog/dotfiles-public)
- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)

## zshrc

Source code from [s4vitar](https://s4vitar.github.io/bspwm-configuration-files/)

### Puglins and Extension needed

To install all dependencies and puglins run the next command (Ubuntu)

```sh
sudo apt-get install zsh-autosuggestions zsh-syntax-highlighting
```

## Tmux

Other resources used in the tmux config

- There are two config files for tmux, you shouldn't edit `.tmux`, but you have `.tmux.local`, still be carefull with the commands you use.
- Those files must be on the home directory
- Vim-tmux-navigator: to navigate throught tmux consoles using vim controle

## Nvim

Principal configuration for productivity and usage, source code from [Takuya Matsuyama](https://www.craftz.dog/)

- The nvim config file must be in `{home}/.config/nvim`

You can also need `Powerlevel10k` for complete the instalation, you'll find my [.p10k.zsh](./.p10k.zsh), you should probably install it using the link provided in [source link](#source_link) due is will install all the dependencies and configure your zsh as well

- Jesus Junco
