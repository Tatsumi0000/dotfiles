#!/bin/bash

CURRENT_DIR=$(cd $(dirname $0) && pwd)
ln -sf ${CURRENT_DIR}/nvim/init.lua ~/.config/nvim/init.lua
ln -sf ${CURRENT_DIR}/nvim/lua/plugins/appearance.lua ~/.config/nvim/lua/plugins/appearance.lua
ln -sf ${CURRENT_DIR}/nvim/lua/plugins/fern.lua ~/.config/nvim/lua/plugins/fern.lua
ln -sf ${CURRENT_DIR}/nvim/lua/plugins/telescope.lua ~/.config/nvim/lua/plugins/telescope.lua
ln -sf ${CURRENT_DIR}/nvim/lua/plugins/gitsigns.lua ~/.config/nvim/lua/plugins/gitsigns.lua
ln -sf ${CURRENT_DIR}/nvim/lua/plugins/theme.lua ~/.config/nvim/lua/plugins/theme.lua
ln -sf ${CURRENT_DIR}/fish/config.fish ~/.config/fish/config.fish
ln -sf ${CURRENT_DIR}/zsh/.zshrc ~/.zshrc
ln -sf ${CURRENT_DIR}/tmux/.tmux.conf ~/.tmux.conf
ln -sf ${CURRENT_DIR}/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -sf ${CURRENT_DIR}/git/ignore ~/.config/git/ignore
ln -sf ${CURRENT_DIR}/git/config ~/.config/git/config
