#!/bin/sh

GIT_HOOK_BASE_URL="https://raw.githubusercontent.com/riddlesio/somatics-styleguide/master/git"

install_githooks() {
  curl -m 2 -s $GIT_HOOK_BASE_URL/$1/hooks/pre-commit > /tmp/pre-commit && mv /tmp/pre-commit .git/hooks/pre-commit
  curl -m 2 -s $GIT_HOOK_BASE_URL/$1/hooks/commit-msg > /tmp/commit-msg && mv /tmp/commit-msg .git/hooks/commit-msg
  rm -rf .git/hooks/*.sample >> /dev/null 2>&1
  rm -rf /tmp/pre-commit >> /dev/null 2>&1
  rm -rf /tmp/commit-msg >> /dev/null 2>&1
  chmod 755 .git/hooks/* >> /dev/null 2>&1
}

install_githooks $@
