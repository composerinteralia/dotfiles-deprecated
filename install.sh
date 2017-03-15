#!/usr/bin/env bash

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$DOTFILES_DIR/system/.function"

if confirm "Back up existing dotfiles? (y/n)"; then
  BACKUPS="$HOME/backup_dotfiles_$(date +"%Y_%m_%d_%H%M%S")"
  mkdir "$BACKUPS"

  FILES="
    bash_profile
    git-completion.bash
    gitconfig
    gitignore_global
    inputrc
    jshintrc
    railsrc
    ruby-version
    rspec
    vimrc
  "

  for DOTFILE in $FILES
  do
    [ -f "$HOME/.$DOTFILE" ] && mv "$HOME/.$DOTFILE" "$BACKUPS"
  done

  [ -d ~/system ] && mv ~/system "$BACKUPS"
  [ -d ~/.vim ] && mv ~/.vim "$BACKUPS"
fi

if confirm "Link new dotfiles? (y/n)"; then
  for DOTFILE in $DOTFILES_DIR/{git,ruby,runcom}/.*
  do
    [ -f "$DOTFILE" ] && ln -sf "$DOTFILE" ~
  done

  ln -sf "$DOTFILES_DIR/system/" ~
  ln -sf "$DOTFILES_DIR/vim/.vimrc" ~
fi
