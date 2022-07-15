alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias $(pwd)/dotman.sh=dotman
alias reloadcli="source $HOME/.zshrc"
# Directories

alias ll='ls -FGlAhp'

alias ..="cd ../"

alias ...="cd ../../"

alias ....="cd ../../../"

alias .....="cd ../../../../"
alias df="df -h"

alias diskusage="df"

alias fu="du -ch"

alias folderusage="fu"

alias tfu="du -sh"

alias totalfolderusage="tfu"
# PHP

alias c='composer'

alias cr='composer require'

alias cda='composer dumpautoload'

alias co='composer outdated --direct'

alias update-global-composer='cd ~/.composer && composer update'

alias composer-update-global='update-global-composer'

alias a='php artisan'

alias pa='php artisan'

alias phpa='php artisan'

alias art='php artisan'

alias arti='php artisan'

alias test='vendor/bin/phpunit'

alias y='yarn'

alias yr='yarn run'

alias runngrok='$HOME/ngrok http'
alias gosites='cd ~/Sites'
alias gomsdb='cd ~/Sites/mServiceDesk-Backend-BusinessLogic/local'
alias gomsdg='cd ~/Sites/mServiceDesk-Backend-Gateway/local'
alias gojualanku='cd ~/Sites/jualanku-be'
alias runmysql='sudo service mysql start'
alias runengine='sudo service php7.4-fpm start && sudo service nginx start && sudo service mysql start'
alias stopengine='sudo service php7.4-fpm stop && sudo service nginx stop && sudo service mysql stop '
alias statusengine='sudo service php7.4-fpm status && sudo service nginx status && sudo service mysql status'
alias edithost='sudo nano /etc/hosts'
## Colorize the ls output ##
alias ls='ls --color=auto'

## Use a long listing format ##
alias ll='ls -la'

## Show hidden files ##
alias l.='ls -d .* --color=auto'
# handy short cuts #
alias h='history'
alias j='jobs -l'

alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5'
# Do not wait interval 1 second, go fast #
alias fastping='ping -c 100 -s.2'
# Functions

mkcdir ()

{

    mkdir -p -- "$1" &&

    cd -P -- "$1"

}
engine_go () {
    echo '🚀🚀🚀 Running engine......'
    runengine
    sudo ip link set dev eth0 mtu 1350
    echo 'status engine 👀👀'
    statusengine
    echo 'Running Cron ? Enter value Y/N: '
    read run_cron
    if [ $run_cron = "Y" ]; then
        echo '🚀🚀🚀 Running cron......'
        sudo service cron start
        echo 'status cron 👀👀'
        sudo service cron status
    else 
        echo 'cron not running 🚫'
    fi
    echo '🚀🚀🚀 Running engine done'
}


engine_stop () {
    echo '🚀🚀🚀 Turn off the machine......'
    stopengine
    echo 'status engine 👀👀'
    statusengine
    echo '🚀🚀🚀 Turn off the cron......'
    sudo service cron stop
    echo '🚀🚀🚀 Turn off the engine successfully...'
}

alias chrome='{read -r arr; open -a "Google Chrome" "${arr}"} <<<'

alias browser='{read -r arr; chrome ${arr} } <<<'

alias google='{read -r arr; browser "https://google.com/search?q=${arr}";} <<<'

alias lara='composer create-project laravel/laravel'

alias pest='./vendor/bin/pest'

alias gpv='git -c http.sslVerify=false push'

alias gp='git push'

#cuaca

alias cuaca='curl wttr.in/Bandung' #current, narrow, quiet, no Follow
alias cuaca_besok='curl wttr.in/Bandung\?1nqF' #+1day, narrow, quiet, no Follow
#vtop
alias top="vtop"
alias oldtop="/usr/bin/top"
alias dotman='/home/dev/dotman/dotman.sh'
