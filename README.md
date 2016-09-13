# wildignore.vim

wildignore.vim is a Vim plugin that reads wildignore patterns from a file.

## Installation

This plugin is compatible with several popular plugin managers:

### Pathogen

    git clone git://github.com/sstallion/vim-wildignore.git ~/.vim/bundle/vim-wildignore

### Vundle

Add the following to your `.vimrc` and execute the `:PluginInstall` command:

    Plugin 'sstallion/vim-wildignore'

### NeoBundle

Add the following to your `.vimrc` and execute the `:NeoBundleInstall` command:

    NeoBundle 'sstallion/vim-wildignore'

### vim-plug

Add the following to your `.vimrc` and execute the `:PlugInstall` command:

    Plug 'sstallion/vim-wildignore'

## Configuration

By default, patterns are read from `~/.vim/wildignore`.

The syntax for pattern files is straightforward:

    pattern1
    pattern2,pattern3

    " Empty lines and comments are permitted
    pattern4

## Acknowledgement

Inspiration for this plugin was taken from
[Adam Bellaire](http://www.vim.org/account/profile.php?user_id=16577)'s
excellent [gitignore](http://www.vim.org/scripts/script.php?script_id=2557)
plugin.
