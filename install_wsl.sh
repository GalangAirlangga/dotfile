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
echo "installing libnss3-tools"
sudo apt-get install libnss3-tools jq xsel

echo '-------------------------------------------------'
echo "installing composer"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

echo '-------------------------------------------------'
echo "installing valet"
composer global require cpriego/valet-linux
sudo apt-get install network-manager libnss3-tools jq xsel -y
valet install
sudo apachectl stop
valet restart

echo '-------------------------------------------------'
echo "installing mysql"
sudo apt-get install mariadb-server mariadb-client
sudo mysql -u root -proot -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';"

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

echo '-------------------------------------------------'
echo "valet setup"
mkdir Sites
cd Sites
valet park
cd ..
