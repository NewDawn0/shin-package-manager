#!/bin/bash
####### configs
source $HOME/.ndos/shin/shin.config
####### Installation
installation () {
    yay () {
        which -s yay
        if [[ $? != 0 ]] ; then
            echo -e "\033[0;36m=>\033[0m Installing Homebrew ..."
            echo -e "\033[0;36m=>\033[0m This might take a while"
            yes | sudo pacman -S --needed base-devel # > /dev/null 2>&1
            yes | sudo pacman -S git # > /dev/null 2>&1
            sudo -u $user git clone https://aur.archlinux.org/yay.git # > /dev/null 2>&1
            sudo chown -R  cloudcone:users yay # > /dev/null 2>&1
            cd yay # > /dev/null 2>&1
            sudo -u $user makepkg -si --noconfirm # > /dev/null 2>&1
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
            yes | sudo pacman -S # > /dev/null 2>&1
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
            yes | sudo pacman -S go # > /dev/null 2>&1
            echo -e "\033[0;32m=>\033[0m Installed Go"
        else
            echo -e "\033[0;32m=>\033[0m Go"
        fi
    }
    python () {
        which -s python
        if [[ $? != 0 ]] ; then
            echo -e "\033[0;36m=>\033[0m Installing Python ..."
            echo -e "\033[0;36m=>\033[0m This might take a while"
            yes | sudo pacman -S python # > /dev/null 2>&1
            yes | sudo pacman -S python-pip # > /dev/null 2>&1
            echo -e "\033[0;32m=>\033[0m Installed Python"
        else
            echo -e "\033[0;32m=>\033[0m Python"
        fi
    }
    cargo () {
        which -s cargo
        if [[ $? != 0 ]] ; then
            echo -e "\033[0;36m=>\033[0m Installing Cargo ..."
            echo -e "\033[0;36m=>\033[0m This might take a while"
            curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh # > /dev/null 2>&1
            echo -e "\033[0;32m=>\033[0m Installed Cargo"
        else
            echo -e "\033[0;32m=>\033[0m Cargo"
        fi
    }
    indiepkg () {
        which -s indiepkg
        if [[ $? != 0 ]] ; then
            echo -e "\033[0;36m=>\033[0m Installing Indiepkg ..."
            echo -e "\033[0;36m=>\033[0m This might take a while"
            sudo -u $user git clone https://github.com/talwat/indiepkg.git # > /dev/null 2>&1
            sudo -u $user cd indiepkg # > /dev/null 2>&1
            sudo -u $user make # > /dev/null 2>&1
            sudo -u $user make install # > /dev/null 2>&1
            echo -e "\033[0;32m=>\033[0m Installed Indiepkg"
        else
            echo -e "\033[0;32m=>\033[0m Indiepkg"
        fi
    }
    npm () {
        which -s npm
        if [[ $? != 0 ]] ; then
            echo -e "Installing NodeJS/npm ..."
            echo -e "This might take a while"
            yes | sudo yay -S nvm # > /dev/null 2>&1
            nvm install 8.0 # > /dev/null 2>&1
            nvm use 8.0 # > /dev/null 2>&1
            yes | sudo pacman -S npm > /dev/null 2>&1
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
            yes | sudo pacman -S figlet # > /dev/null 2>&1
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
            yes | sudo pacman -S wget # > /dev/null 2>&1
            echo -e "\033[0;32m=>\033[0m Installed wget"
        else
            echo -e "\033[0;32m=>\033[0m wget"
        fi
    }
    # install package managers and dependencies
    echo "Checking and installing dependencies ..."
    yay
    wget
    cmake
    go
    cargo
    npm
    indiepkg
    figlet
    # adding package manager to managers list
    cat /dev/null > $HOME/.ndos/shin/managers.txt
    sudo echo "Managers         Full Name/Description" >> $HOME/.ndos/shin/managers.txt
    sudo echo "pacman   ->      Homebrew" >> $HOME/.ndos/shin/managers.txt
    sudo echo "yay      ->      macPorts" >> $HOME/.ndos/shin/managers.txt
    sudo echo "cargo    ->      Rust Cargo" >> $HOME/.ndos/shin/managers.txt
    sudo echo "indiepkg ->      Indiepkg" >> $HOME/.ndos/shin/managers.txt
    sudo echo "npm      ->      NodeJS" >> $HOME/.ndos/shin/managers.txt
    sudo echo "pip      ->      Python - Pip" >> $HOME/.ndos/shin/managers.txt
}

installation
