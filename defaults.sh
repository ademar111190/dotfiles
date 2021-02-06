#!/usr/bin/env bash

# Desktop Environment
defaults write com.apple.finder AppleShowAllFiles TRUE
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

# File types,
# File type: mdls file.type | grep kMDItemContentType
# App key: mdls App.app | grep kMDItemCFBundleIdentifier
function setDefaultApp() {
    app="$1"
    shift
    for fileType in "${@}"; do
        defaults write ~/Library/Preferences/com.apple.LaunchServices/com.apple.launchservices.secure.plist LSHandlers -array-add "{LSHandlerContentType=$fileType;LSHandlerRoleAll=$app;}"
        defaults write ~/Library/Preferences/com.apple.LaunchServices.plist LSHandlers -array-add "{LSHandlerContentType=$fileType;LSHandlerRoleAll=$app;}"
    done
}

setDefaultApp "com.sublimetext.3" \
    "dyn.ah62d4rv4ge80442" \
    "net.daringfireball.markdown" \
    "public.json" \
    "public.plain-text" \
    "public.python-script" \
    "public.yaml" \
    "public.xml"

setDefaultApp "com.aone.keka" \
    "org.7-zip.7-zip-archive" \
    "public.zip-archive"

setDefaultApp "org.videolan.vlc" \
    "com.apple.quicktime-movie" \
    "public.mp3" \
    "public.mpeg-4"

setDefaultApp "org.libreoffice.script" \
    "com.microsoft.word.doc"

killall Finder
