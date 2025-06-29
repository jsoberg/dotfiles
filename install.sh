#!/usr/bin/env bash

bashrc_alias_connection="if [ -f ~/.bashrc_aliases ]; then . ~/.bashrc_aliases fi"

echo "Replace .bash_colors with latest version..."
yes | cp -rf .bash_colors ~/.bash_colors

echo "Replacing .bashrc_aliases with latest version..."
yes | cp -rf .bashrc_aliases ~/.bashrc_aliases

if grep -Fq "$bashrc_alias_connection" ~/.bashrc
then
    echo "Aliases already installed in ~/.bashrc"
else
    echo "Installing aliases in ~/.bashrc..."
    printf "\n$bashrc_alias_connection\n" >> ~/.bashrc
fi

echo "Resetting source for .bashrc..."
source ~/.bashrc