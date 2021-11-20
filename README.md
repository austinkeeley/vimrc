Vim Configuration File
========================

This repository contains my (somewhat opinionated) `init.vim` file.

## Setup (for NeoVim)

1. Install Vundle

    git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
2. Copy the `init.vim` file to ~/.config/nvim/init.vim
3. Start nvim
4. Run `:PluginInstall`

## Features

* Spaces by default
* Arrow keys disabled (this forces you to get good at `hjkl`)
* Various key mappings to make navigating through window splits and tabs easier
* `:StripTrailingWhitespaces` command to clean up trailing white spaces (optional
automatic call to do it on file save)

