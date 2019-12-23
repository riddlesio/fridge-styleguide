#!/bin/sh

BASE_URL=https://raw.githubusercontent.com/riddlesio/somatics-styleguide/experimental/githooks

install_githooks() {
  curl $BASE_URL/git/$1/hooks/pre-commit > .git/hooks/pre-commit
  curl $BASE_URL/git/$1/hooks/commit-msg > .git/hooks/commit-msg
  rm -rf ".git/hooks/*.sample"
  chmod 755 ".git/hooks/*"
}

install_githooks $@
