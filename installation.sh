#!/usr/bin/env bash

set -e
set -u

if [ "$EUID" -ne 0 ]
  then echo "Please run as root. Required for installation into /opt/"
  exit
fi

source_dir=$(dirname $0:h:P)

bold=$(tput bold)
normal=$(tput sgr0)

function install() {
  target=$1
  zen_pyenv_dir="$HOME/.$target"
  zen_installation_dir="/opt/$target"
  zen_installation_path="$zen_installation_dir/$target"
  zen_completion_path="$zen_installation_dir"/"$target"_completion
  echo "${bold}Installing $target${normal}"

  mkdir -p "/opt/$target"

  if [ -e $zen_pyenv_dir ]; then
      echo "$zen_pyenv_dir already exists."
  else
      echo "Creating '$zen_pyenv_dir'"
      mkdir $zen_pyenv_dir
  fi

  if [ -e "$zen_installation_path" ]; then
      echo "$target already exists in $zen_installation_dir"
  else
      echo "copying $target over to $zen_installation_path"
      cp "$source_dir"/$target "$zen_installation_path"
  fi

  if [ -e "$zen_installation_path" ]; then
      echo "$target already exists in $zen_installation_dir"
  else
      echo "copying $target over to $zen_installation_path"
      cp "$source_dir"/$target "$zen_installation_path"
  fi

  if [ -e "$zen_completion_path" ]; then
      echo "$target"_completion already exists in "$zen_installation_dir"
  else
      echo "copying $target over to $zen_installation_path"
      cp "$source_dir"/completions/$target "$zen_completion_path"
  fi


  echo "${bold}Manually add the following alias and source completion in bashrc/zshrc${normal}"
  echo "alias $target='source $zen_installation_path"
  echo "source \"$zen_completion_path\""
}

install zen
install zen2
