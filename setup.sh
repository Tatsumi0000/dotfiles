#!/bin/bash

CURRENT_DIR=$(cd $(dirname $0) && pwd)
ln -sf ${CURRENT_DIR}/nvim/init.lua ~/.config/nvim/init.lua
ln -sf ${CURRENT_DIR}/nvim/lua/plugins/appearance.lua ~/.config/nvim/lua/plugins/appearance.lua
ln -sf ${CURRENT_DIR}/nvim/lua/plugins/fern.lua ~/.config/nvim/lua/plugins/fern.lua
ln -sf ${CURRENT_DIR}/nvim/lua/plugins/telescope.lua ~/.config/nvim/lua/plugins/telescope.lua
ln -sf ${CURRENT_DIR}/nvim/lua/plugins/gitsigns.lua ~/.config/nvim/lua/plugins/gitsigns.lua
ln -sf ${CURRENT_DIR}/fish/config.fish ~/.config/fish/config.fish
ln -sf ${CURRENT_DIR}/tmux/.tmux.conf ~/.tmux.conf
