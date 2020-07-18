# vim_config

Personnal Vim configuration file.

Clone this repository and add the following to your `.vimrc` file:

```
so /path/to/this/repo/vim_config.vim
```

## vim-plug

I use [vim-plug](https://github.com/junegunn/vim-plug) to manage plugins.
Run the following to install this plugin manager:

```shell
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Run the following in vim to manage plugins:

```shell
:PlugInstall
:PlugUpdate
```

## clang-format

Install clang-format as follows:

```shell
$ sudo apt-get update
$ sudo apt-get install clang-format
```

## Conquer of Completion

This plugin requires nodejs >= 10.12. Install it as follows:

```shell
$ curl -sL install-node.now.sh/lts | sudo bash
```

For C++, consider installing the [coc-clangd](https://github.com/clangd/coc-clangd).

```shell
:CocInstall coc-clangd
```

To generate the compilation database with Bazel, look up
[bazel-compilation-database](https://github.com/grailbio/bazel-compilation-database).
