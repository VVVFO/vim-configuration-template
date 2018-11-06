# Vim Configuration Template

> {Portable, Maintainable, Easy-to-use} - Choose Three

This is a Vim configuration template that achieves:

1. Easy deployment on new machines (`./setup.sh` and voila)
2. Easy plugin management (powered by [Vundle](https://github.com/VundleVim/Vundle.vim))
3. Easy syncing and version control (with `git`)

See more information here: [vvvfo.com/2018/11/06/vim-configuration.html](https://vvvfo.com/2018/11/06/vim-configuration.html)

## Usage

Fork or clone this repo, then fill in the places marked as `TODO` in `vimrc`.

Note: as this solution involves a git submodule, therefore just copying out the files (without `.git/`) may not work.

## Workflows

For reference and a demonstration of how easy everything is.

### Setting up on a New Machine

As mentioned earlier, setting up is as easy as `./setup.sh` because it does all the work for you.

```bash
git clone your_repo
cd your_repo
./setup.sh
```

You will need to hit Enter once in the process.

### Installing/Removing a Plugin

1. Add/remove a line like `Plugin "vim-airline/vim-airline"` in your `vimrc` (standard Vundle configuration)
2. Run `:PluginInstall` or `:PluginClean`
3. Commit and push (and do step 2 on other machines after pulling in the changes)

### Updating a Plugin

Just run `:PluginUpdate`.


