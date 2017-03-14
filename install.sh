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

  [ -d ~/.vim ] && mv ~/.vim "$BACKUPS"
  [ -d ~/system ] && mv ~/system "$BACKUPS"
fi

if confirm "Link new dotfiles? (y/n)"; then
  ln -sf "$DOTFILES_DIR/system/" ~
  ln -sf "$DOTFILES_DIR/.bash_profile" ~
  ln -sf "$DOTFILES_DIR/git/.git-completion.bash" ~
  ln -sf "$DOTFILES_DIR/git/.gitconfig" ~
  ln -sf "$DOTFILES_DIR/git/.gitignore_global" ~
  ln -sf "$DOTFILES_DIR/rc/.jshintrc" ~
  ln -sf "$DOTFILES_DIR/rc/.railsrc" ~
  ln -sf "$DOTFILES_DIR/ruby/.rspec" ~
  ln -sf "$DOTFILES_DIR/ruby/.ruby-version" ~
  ln -sf "$DOTFILES_DIR/vim/.vimrc" ~
fi
