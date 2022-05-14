#!/bin/bash
####### configs
source $HOME/.ndos/shin/shin.config
####### Installation
installation () {
    brew () {
        which -s brew
        if [[ $? != 0 ]] ; then
            echo -e "\033[0;36m=>\033[0m Installing Homebrew ..."
            echo -e "\033[0;36m=>\033[0m This might take a while"
            sudo -u $user ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" > /dev/null 2>&1
            echo -e "\033[0;32m=>\033[0m Installed Homebrew"
        else
            echo -e "\033[0;32m=>\033[0m Homebrew"
        fi
    }
    cmake () {
        which -s cmake
        if [[ $? != 0 ]] ; then
            echo -e "\033[0;36m=>\033[0m Installing CMake ..."
            echo -e "\033[0;36m=>\033[0m This might take a while"
            sudo -u $user brew install cmake > /dev/null 2>&1
            echo -e "\033[0;32m=>\033[0m Installed cmake"
        else
            echo -e "\033[0;32m=>\033[0m CMake"
        fi
    }
    go () {
        which -s go
        if [[ $? != 0 ]] ; then
            echo -e "\033[0;36m=>\033[0m Installing Go ..."
            echo -e "\033[0;36m=>\033[0m This might take a while"
            sudo -u $user brew install go > /dev/null 2>&1
            echo -e "\033[0;32m=>\033[0m Installed Go"
        else
            echo -e "\033[0;32m=>\033[0m Go"
        fi
    }
    ports () {
        which -s port
        if [[ $? != 0 ]] ; then
            echo -e "\033[0;36m=>\033[0m Installing macPorts ... "
            echo -e "\033[0;36m=>\033[0m This might take a while"
            xcode-select --install > /dev/null 2>&1
            wget "https://github.com/macports/macports-base/releases/download/v2.7.2/MacPorts-2.7.2-12-Monterey.pkg" > /dev/null 2>&1
            sudo installer -pkg MacPorts-2.7.2-12-Monterey.pkg -target / > /dev/null 2>&1
            sudo rm MacPorts-2.7.2-12-Monterey.pkg
            echo -e "\033[0;32m=>\033[0m Installed macPorts"
        else
            echo -e "\033[0;32m=>\033[0m macPorts"
        fi
    }
    cargo () {
        which -s cargo
        if [[ $? != 0 ]] ; then
            echo -e "\033[0;36m=>\033[0m Installing Cargo ..."
            echo -e "\033[0;36m=>\033[0m This might take a while"
            sudo -u $user brew install rust > /dev/null 2>&1
            echo -e "\033[0;32m=>\033[0m Installed Cargo"
        else
            echo -e "\033[0;32m=>\033[0m Cargo"
        fi
    }
    indiepkg () {
        which -s indiepkg
        if [[ $? != 0 ]] ; then
            echo -e "\033[0;36m=>\033[0m Installing Indiepkg ..."
            
            sudo -u $user git clone https://github.com/talwat/indiepkg.git
            echo -e "\033[0;36m=>\033[0m Error installing please run 'cd indiepkg && make && make install' in this directory" 
        else
            echo -e "\033[0;32m=>\033[0m Indiepkg"
        fi
    }
    npm () {
        which -s npm
        if [[ $? != 0 ]] ; then
            echo -e "\033[0;36m=>\033[0mInstalling NodeJS/npm ..."
            echo -e "\033[0;36m=>\033[0mThis might take a while"
            sudo -u $user brew install node > /dev/null 2>&1
            echo -e "\033[0;32m=>\033[0m Installed Npm"
        else
            echo -e "\033[0;32m=>\033[0m Npm"
        fi
    }
    figlet () {
        which -s figlet
        if [[ $? != 0 ]] ; then
            echo -e "\033[0;36m=>\033[0m Installing figlet ..."
            echo -e "\033[0;36m=>\033[0m This might take a while"
            sudo -u $user brew install figlet > /dev/null 2>&1
            echo -e "\033[0;32m=>\033[0m Installed figlet"
        else
            echo -e "\033[0;32m=>\033[0m figlet"
        fi
    }
    wget () {
        which -s wget
        if [[ $? != 0 ]] ; then
            echo -e "\033[0;36m=>\033[0m Installing wget ..."
            echo -e "\033[0;36m=>\033[0m This might take a while"
            sudo -u $user brew install wget > /dev/null 2>&1
            echo -e "\033[0;32m=>\033[0m Installed wget"
        else
            echo -e "\033[0;32m=>\033[0m wget"
        fi
    }
    echo "Checking and installing dependencies ..."
    pip install poetry > /dev/null 2>&1
    brew
    wget
    cmake
    go
    ports
    cargo
    npm
    indiepkg
    figlet
    # adding package manager to managers list
    cat /dev/null > $HOME/.ndos/shin/managers.txt
    sudo echo "Managers         Full Name/Description" >> $HOME/.ndos/shin/managers.txt
    sudo echo "brew     ->      Homebrew" >> $HOME/.ndos/shin/managers.txt
    sudo echo "port     ->      macPorts" >> $HOME/.ndos/shin/managers.txt
    sudo echo "cargo    ->      Rust Cargo" >> $HOME/.ndos/shin/managers.txt
    sudo echo "indiepkg ->      Indiepkg" >> $HOME/.ndos/shin/managers.txt
    sudo echo "npm      ->      NodeJS" >> $HOME/.ndos/shin/managers.txt
    sudo echo "pip      ->      Python - Pip" >> $HOME/.ndos/shin/managers.txt
}

installation
