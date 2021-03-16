#!/usr/bin/env bash
set -xe

VERSION=$1

[[ -n $VERSION ]] || (echo "Usage: cut-release.sh VERSION" && exit 1)
[[ -z $(git status -s) ]] || (echo "Dirty workspace! Aborting..." && exit 1)

RELEASE_BRANCH="release/caravan-$VERSION"

git checkout main
git fetch && git pull
git branch -r | grep "$RELEASE_BRANCH" && echo "Release branch $RELEASE_BRANCH already exists! Aborting..." && exit 1
git checkout -b "$RELEASE_BRANCH"
git push --set-upstream origin "$RELEASE_BRANCH"
