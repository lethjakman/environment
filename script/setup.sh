#!/bin/zsh
set -e
environment="$HOME/.environment"
if [ ! -d "$environment" ]; then
  git clone -q --branch prezto --recursive https://github.com/lethjakman/environment "$environment"
fi

dot_folder="$environment/dotfiles"
for f in "$dot_folder"/*; do
  if [ -e "$f" ]; then
    filename=$(basename "$f")
    homepath_filename="$HOME/.$filename"

    if [ ! -e "$homepath_filename" -a ! -d "$homepath_filename" ]; then # if it doesn't exist and isn't a directory
      echo "Added symlink to $filename"
      ln -s "$f" "$homepath_filename"
    elif [ ! -h "$homepath_filename" ]; then # if it exists as a symlink
      echo "Backed up and symlinked $filename"
      mv "$homepath_filename"{,.bak}
      ln -s "$f" "$homepath_filename"
    else
      echo "$homepath_filename already exists as a symlink...skipping."
    fi
  fi
done

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
