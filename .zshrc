export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(
    git
    macos
    gradle
    adb
    zsh-autosuggestions
    docker
    python
)

PATH="${PATH}:/home/ademar/.local/bin"
source $ZSH/oh-my-zsh.sh

#prompt_context () {
#    if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
#        BTC=$(bitcoin)
#        prompt_segment black default "%(!.%{%F{yellow}%}.)$USER $BTC"
#    fi
#}

eval $(thefuck --alias)
export vim=nvim
export VISUAL=$vim
export EDITOR="$VISUAL"

export LC_ALL=en_US.UTF-8

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

export ANDROID_NDK="/Users/ademar/Library/Android/sdk/ndk-bundle"
export ANDROID_SDK="/Users/ademar/Library/Android/sdk"
export ANDROID_HOME=$ANDROID_SDK
export ANDROID_SDK_ROOT="/Users/ademar/Library/Android"
export KOTLIN_HOME="/usr/local/Cellar/kotlin/1.3.21/"
export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/Contents/Home"

PATH="${PATH}:${ANDROID_HOME}"
PATH="${PATH}:${ANDROID_HOME}/platform-tools"
PATH="${PATH}:${ANDROID_HOME}/tools"
PATH="${PATH}:${ANDROID_HOME}/emulator"
PATH="${PATH}:${ANDROID_HOME}/tools/bin"
PATH="${PATH}:/Users/ademar/Scripts"
PATH="${PATH}:/Users/ademar/Library/Python/3.7/bin"
PATH="${PATH}:/Users/ademar/Workspace/mrScripts"
PATH="${PATH}:/Users/ademar/Workspace/cleandroid"
PATH="${PATH}:/home/ademar/Workspace/flutter/bin"

run-gradle() {
    FLAVOR=$1
    VARIANT="$(tr '[:lower:]' '[:upper:]' <<< ${FLAVOR:0:1})${FLAVOR:1}"
    ./gradlew build${VARIANT}PreBundle assemble${VARIANT}
    ls app/build/outputs/apk/${FLAVOR}/ | grep apk | xargs -I % $SHELL -c "adbplus install -r app/build/outputs/apk/${FLAVOR}/%"
}

install-apks() {
    find . -name '*.apk' -not -path '**/intermediates/**' | xargs -I % $SHELL -c "adbplus install -r %"
}

alias gti=git
alias got=git
alias gt=git
alias gut=git
alias python=python3
alias pip=pip3
alias ls=exa
alias la="exa -alh"
alias cat=bat
alias subl="open -a Sublime\ Text $@"
alias v=$vim
alias vi=$vim
alias vim=$vim

alias clear-branchs="git for-each-ref --format '%(refname:short)' refs/heads | grep -v master | xargs git branch -D"
alias clear-local-gradle='find . \( -name "intermediates" -o -name "bin" -o -name "gen" -o -name "build" \) | xargs rm -rf'
alias clear-gradle="rm -rf ~/.gradle/caches && rm -rf ~/.gradle/daemon && rm -rf ~/.gradle/native && rm -rf ~/.gradle/notifications && rm -rf ~/.gradle/workers && rm -rf ~/.gradle/wrapper && find . -name 'bin' | xargs rm -rf && find . -name 'gen' | xargs rm -rf && find . -name 'build' | xargs rm -rf"

alias run-gradle-debug="run-gradle debug"
alias run-gradle-beta="run-gradle beta"
alias run-gradle-release="run-gradle release"

quill() {
  ps ax | grep $1 | cut -f1 -d ' ' | xargs kill -9
}

export bitcoin() {
    last=$(tail -1 ~/.bitcoin_price)
    onebefore=$(tail -2 ~/.bitcoin_price | head -1)
    if (( $last > $onebefore )); then
        echo "↗ ₿ $last"
    elif (( $last < $onebefore )); then
        echo "↘︎ ₿ $last"
    else
        echo "⇌ ₿ $last"
    fi
    curl -s http://api.coindesk.com/v1/bpi/currentprice.json | python3 -c "import json, sys; print('{:.0f}'.format(float(json.load(sys.stdin)['bpi']['USD']['rate'].replace(',',''))))" >> ~/.bitcoin_price 2&>/dev/null
}

export GPG_TTY=$(tty)

if [ -z "$TMUX" ] && [ -z "$VIM" ]; then 
    #neofetch;
    #fortune | cowsay -f ~/Workspace/cowsay-files/cows/$(ls ~/Workspace/cowsay-files/cows | grep ".cow" | shuf -n1) -W 100 | lolcat;
fi
