# wildignore.vim

wildignore.vim is a Vim plugin that reads suffixes and wildignore patterns from
a file. Inspiration for this plugin was taken from [Adam Bellaire][1]'s
excellent [gitignore][2] plugin.

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

By default, patterns are read from `~/.vim/wildignore` and `~/.vim/suffixes`.

The syntax for pattern files is straightforward:

    pattern1
    pattern2,pattern3

    " Empty lines and comments are permitted
    pattern4

## Contributing

Pull requests are welcome! If a problem is encountered using this plugin, please
file an issue on [GitHub][3].

## License

Source code in this repository is licensed under a Simplified BSD License. See
[LICENSE] for more details.

[1]: https://www.vim.org/account/profile.php?user_id=16577
[2]: https://www.vim.org/scripts/script.php?script_id=2557
[3]: https://github.com/sstallion/vim-wildignore/issues

[LICENSE]: LICENSE
