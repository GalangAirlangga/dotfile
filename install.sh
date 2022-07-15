#!/bin/bash
# Get dotfiles installation directory
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -sf "$DOTFILES_DIR/.gitconfig" ~
ln -sf "$DOTFILES_DIR/.gitignore_global" ~
ln -sf "$DOTFILES_DIR/.zshrc" ~
ln -sf "$DOTFILES_DIR/.zsh_exports" ~
ln -sf "$DOTFILES_DIR/.zsh_aliases" ~

echo '-------------------------------------------------'
echo '       Linux Development Setup - Galang          '
echo '-------------------------------------------------'

echo 'running update and upgrade'
sudo apt update
sudo apt upgrade

echo '-------------------------------------------------'
echo 'installing Google Chrome'
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

echo '-------------------------------------------------'
echo 'installing curl'
sudo apt-get install curl -y

echo '-------------------------------------------------'
echo 'installing git'
sudo apt-get install git -y

echo '-------------------------------------------------'
echo "Setting git user name"
git config --global user.name "Galang Airlangga"

echo '-------------------------------------------------'
echo "Setting git user email"
git config --global user.email "galangairlangga1@gmail.com"
echo '-------------------------------------------------'
echo "installing apache"
sudo apt-get install -y apache2

echo '-------------------------------------------------'
echo "installing php"
sudo apt install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update

sudo apt install php8.1 php8.1-common php8.1-mysql php8.1-xml php8.1-xmlrpc php8.1-curl php8.1-gd php8.1-imagick php8.1-cli php8.1-dev php8.1-imap php8.1-mbstring php8.1-opcache php8.1-soap php8.1-zip php8.1-intl php8.1-sqlite3 php8.1-bcmath php8.1-zip -y

echo '-------------------------------------------------'
echo "installing composer"
sudo apt install composer

echo '-------------------------------------------------'
echo "installing valet"
composer global require cpriego/valet-linux
sudo apt-get install network-manager libnss3-tools jq xsel -y
valet install
sudo apachectl stop
valet restart

echo '-------------------------------------------------'
echo "installing mysql"
sudo apt install mysql-server -y
sudo mysql_secure_installation
sudo mysql

echo '-------------------------------------------------'
echo 'installing Node.js LTS'
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install nodejs -y

echo '-------------------------------------------------'
echo 'installing yarn'
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn

echo '-------------------------------------------------'
echo 'installing VSCode'
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https -y
sudo apt-get update
sudo apt-get install code -y # or code-insiders

echo '-------------------------------------------------'
echo 'installing spotify'
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client -y

echo '-------------------------------------------------'
echo 'installing insomnia'
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list

wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc \
    | sudo apt-key add -

sudo apt-get update && sudo apt-get install insomnia -y

echo '-------------------------------------------------'
echo 'installing flameshot'
sudo apt-get install flameshot -y

echo '-------------------------------------------------'
echo 'installing peek'
sudo apt-get install peek -y

echo '-------------------------------------------------'
echo 'installing beekeeper studio'
wget --quiet -O - https://deb.beekeeperstudio.io/beekeeper.key | sudo apt-key add -
echo "deb https://deb.beekeeperstudio.io stable main" | sudo tee /etc/apt/sources.list.d/beekeeper-studio-app.list
sudo apt update
sudo apt install beekeeper-studio -y

echo '-------------------------------------------------'
echo 'installing terminator'
sudo apt-get install terminator -y

echo '-------------------------------------------------'
echo 'installing vim'
sudo apt-get install vim -y

echo '-------------------------------------------------'
echo 'installing gnome-tweak-tool'
sudo apt-get install gnome-tweak-tool -y

echo '-------------------------------------------------'
echo 'installing zsh'
sudo apt-get install zsh -y
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s /bin/zsh

echo '-------------------------------------------------'
echo 'installing autosuggestions'
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
source ~/.zshrc

echo '-------------------------------------------------'
echo "installing zsh-autocomplete"
mkdir Git
cd ~/Git
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git

echo '-------------------------------------------------'
echo "installing tmux"
sudo apt install tmux