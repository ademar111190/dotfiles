set fish_greeting

set -x vim nvim
set -x VISUAL $vim
set -x EDITOR "$VISUAL"

set -x LC_ALL en_US.UTF-8

set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'
set -x FZF_DEFAULT_OPTS "--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

set -x ANDROID_NDK "/Users/ademar/Library/Android/sdk/ndk-bundle"
set -x ANDROID_SDK "/Users/ademar/Library/Android/sdk"
set -x ANDROID_HOME $ANDROID_SDK
set -x ANDROID_SDK_ROOT "/Users/ademar/Library/Android"
set -x JAVA_HOME "/Applications/Android Studio.app/Contents/jre/jdk/Contents/Home"

set PATH $PATH $ANDROID_HOME
set PATH $PATH $ANDROID_HOME/platform-tools
set PATH $PATH $ANDROID_HOME/tools
set PATH $PATH $ANDROID_HOME/emulator
set PATH $PATH $ANDROID_HOME/tools/bin
set PATH $PATH /Users/ademar/Scripts
set PATH $PATH /Users/ademar/Library/Python/3.7/bin
set PATH $PATH /Users/ademar/Workspace/mrScripts
set PATH $PATH /Users/ademar/Workspace/cleandroid
set PATH $PATH ~/.cargo/bin
set PATH $PATH ~/Qt/5.15.0/clang_64/bin

set -x DYLD_LIBRARY_PATH ~/Qt/5.15.0/clang_64/lib

function gti
    git $argv
end
function got
    git $argv
end
function gt
    git $argv
end
function gut
    git $argv
end
function python
    python3 $argv
end
function pip
    pip3 $argv
end
function ls
    exa $argv
end
function la
    exa -alh $argv
end
function cat
    bat $argv
end
function subl
    open -a Sublime\ Text $argv
end
function v
    $vim $argv
end
function vi
    $vim $argv
end
function vim
    $vim $argv
end
function clear-branchs
    git for-each-ref --format '%(refname:short)' refs/heads | grep -v master | xargs git branch -D
end

function bitcoin_last_price
    tail -1 ~/.bitcoin_price
end

function bitcoin_previous_price
    tail -2 ~/.bitcoin_price | head -1
end

function bitcoin
    set last (bitcoin_last_price)
    set onebefore (bitcoin_previous_price)
    set formatted (numfmt --grouping $last)\$
    if test $last -gt $onebefore
        echo ↗ ₿ $formatted
    else if test $last -lt $onebefore
        echo ↘︎ ₿ $formatted
    else
        echo ⇌ ₿ $formatted
    end
    curl -s http://api.coindesk.com/v1/bpi/currentprice.json | python3 -c "import json, sys; print('{:.0f}'.format(float(json.load(sys.stdin)['bpi']['USD']['rate'].replace(',',''))))" >> ~/.bitcoin_price 2>/dev/null
end

set -x GPG_TTY (tty)
thefuck --alias | source 

if test -z "$TMUX" && test -z "$VIM"
    neofetch;
    fortune | cowsay -f ~/Workspace/cowsay-files/cows/(ls ~/Workspace/cowsay-files/cows | grep ".cow" | shuf -n1) -W 100 | lolcat;
end
