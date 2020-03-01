#!/usr/bin/env bash

defaults write com.apple.finder AppleShowAllFiles TRUE
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

killall Finder
