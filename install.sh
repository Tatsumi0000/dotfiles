#!/bin/bash

CURRENT_DIR=$(cd $(dirname $0) && pwd)
ln -sf ${CURRENT_DIR}/nvim/init.vim ~/.config/nvim/init.vim
ln -sf ${CURRENT_DIR}/nvim/dein/dein.toml ~/.config/nvim/dein/dein.toml
ln -sf ${CURRENT_DIR}/nvim/dein/dein_lazy.toml ~/.config/nvim/dein/dein_lazy.toml
ln -sf ${CURRENT_DIR}/fish/config.fish ~/.config/fish/config.fish

