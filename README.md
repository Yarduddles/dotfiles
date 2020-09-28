# Initialize

Before setting this, install the following software:

- vim8 
- oh-my-zsh
- tmux

### Linux specific initialization

- zsh

Clone this repository into the home directory:

```bash
cd ~ && git clone https://github.com/stvdr/dotfiles.git
```

After this repository is cloned, make sure to pull all submodules:

```bash
git submodule update --init --recursive
```

To copy dotfiles to their necessary locations:

```bash
bash setup.sh
```

# Vim Settings

## Adding packages

From the root directory (`~/dotfiles`):

```bash
git submodule add https://github.com/vim-airline/vim-airline.git vim/pack/stvdr/start/vim-airline
git add .gitmodules vim/pack/stvdr/start/vim-airline
git commit
```

## Manual steps

1. Verify that all necessary executables exist for vim-go to function: `:GoInstallBinaries`
