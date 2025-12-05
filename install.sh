#!/bin/bash
#
TOOLS=("shell" "tmux" "git" "vim")
for tool in ${TOOLS[@]}; do
    echo "Installing and configuring $tool..."
    bash $tool/install.sh
    echo "Done installing and configuring $tool."
done
