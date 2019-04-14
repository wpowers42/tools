#!/bin/sh

BREW_STATUS="queued"
PIP_STATUS="queued"
NPM_STATUS="queued"
GEM_STATUS="queued"

print_status()
{
clear
printf "brew: $BREW_STATUS\n"
printf "pip:  $PIP_STATUS\n"
printf "npm:  $NPM_STATUS\n"
printf "gem:  $GEM_STATUS\n"
}

update_status()
{
  # $1 is status variable, $2 is new status
  eval $1="$2"
  print_status
}

# updating brew
update_status BREW_STATUS "processing"
brew update
brew upgrade
brew cleanup
brew doctor
update_status BREW_STATUS "done"


# updating pip
update_status PIP_STATUS "processing"
pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U
update_status PIP_STATUS "done"

# updating npm
update_status NPM_STATUS "processing"
npm -g update
npm -g outdated
npm -g prune
update_status NPM_STATUS "done"

# updating gem
update_status GEM_STATUS "processing"
gem update --system
gem update
gem cleanup
update_status GEM_STATUS "done"