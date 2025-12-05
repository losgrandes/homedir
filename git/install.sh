#!/bin/bash
#
sudo apt-get -q -y install git
cd git
cp -n gitconfig ~/.gitconfig
mkdir -p ~/workspace/source/
mkdir -p ~/workspace/internal-source/
cp -n gitconfig_include_internal ~/workspace/internal-source/.gitconfig_include
cp -n gitconfig_include_external ~/workspace/source/.gitconfig_include
