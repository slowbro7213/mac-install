#!/bin/bash

APP_DIR=/Applications
PJT_DIR=$HOME/Documents/ProjectRepository
ROOT_DIR=/$HOME/Settings

# install homebrew
if ! which brew
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    if ! which brew
    then
        echo "brew install failed."
        exit 1
    fi
else
    brew update
fi
if ! which cask
then
    brew install cask
fi
if ! which mas
then
    brew install mas
fi

# execute BrewFile
brew bundle --file=./BrewFile
brew upgrade

# install oh-my-zsh, plugins and theme
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# input all plugins on zshrc
# echo "\nplugins=(\n  git\n  zsh-syntax-highlighting\n  zsh-autosuggestions\n)" >> $HOME/.zshrc
# ZSH_THEME="powerlevel10k/powerlevel10k"
# source $HOME/.zshrc

# export
# export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home"
# export GOPATH="${PJT_DIR}"
# export GOROOT="$(brew --prefix golang)/libexec"
# export PATH="$JAVA_HOME/bin:$HOME/.pyenv/bin:${GOPATH}/bin:${GOROOT}/bin:$PATH"
# source $HOME/.zshrc

# read password
read -r -s -p "[sudo] sudo password for $(whoami):" pass

# clear app isolation
echo "$pass" | sudo -S xattr -dr com.apple.quarantine $APP_DIR/iTerm.app
echo "$pass" | sudo -S xattr -dr com.apple.quarantine $APP_DIR/Termius.app
#echo "$pass" | sudo -S xattr -dr com.apple.quarantine $APP_DIR/Cyberduck.app
echo "$pass" | sudo -S xattr -dr com.apple.quarantine $APP_DIR/Visual\ Studio\ Code.app
#echo "$pass" | sudo -S xattr -dr com.apple.quarantine $APP_DIR/IntelliJ\ IDEA\ CE.app
#echo "$pass" | sudo -S xattr -dr com.apple.quarantine $APP_DIR/PyCharm\ CE.app
echo "$pass" | sudo -S xattr -dr com.apple.quarantine $APP_DIR/Google\ Chrome.app
echo "$pass" | sudo -S xattr -dr com.apple.quarantine $APP_DIR/Slack.app
echo "$pass" | sudo -S xattr -dr com.apple.quarantine $APP_DIR/Notion.app
echo "$pass" | sudo -S xattr -dr com.apple.quarantine $APP_DIR/Fork.app
#echo "$pass" | sudo -S xattr -dr com.apple.quarantine $APP_DIR/Sourcetree.app
echo "$pass" | sudo -S xattr -dr com.apple.quarantine $APP_DIR/Docker.app
echo "$pass" | sudo -S xattr -dr com.apple.quarantine $APP_DIR/VirtualBox.app
echo "$pass" | sudo -S xattr -dr com.apple.quarantine $APP_DIR/KakaoTalk.app
echo "$pass" | sudo -S xattr -dr com.apple.quarantine $APP_DIR/Microsoft Word.app
echo "$pass" | sudo -S xattr -dr com.apple.quarantine $APP_DIR/Microsoft Teams.app
echo "$pass" | sudo -S xattr -dr com.apple.quarantine $APP_DIR/OneDrive.app
echo "$pass" | sudo -S xattr -dr com.apple.quarantine $APP_DIR/TeamViewer.app
