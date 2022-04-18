#!/bin/bash
echo -e "\033[0;36m   ____  _     _       \033[0m"
echo -e "\033[0;36m  / ___|| |__ (_)_ __  \033[0m"
echo -e "\033[0;36m  \___ \| '_ \| | '_ \ \033[0m"
echo -e "\033[0;36m   ___) | | | | | | | |\033[0m"
echo -e "\033[0;36m  |____/|_| |_|_|_| |_|\033[0m"
echo ""
########### Functions ###########
####### Installation
installation () {
    brew () {
        which -s brew
        if [[ $? != 0 ]] ; then
            echo -e "\033[0;36m=>\033[0m Installing Homebrew ..."
            echo -e "\033[0;36m=>\033[0m This might take a while"
            ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" > /dev/null 2>&1
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
            brew install cmake > /dev/null 2>&1
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
            brew install go > /dev/null 2>&1
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
            brew install python > /dev/null 2>&1
            echo -e "\033[0;32m=>\033[0m Installed Python"
        else
            echo -e "\033[0;32m=>\033[0m Python"
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
            brew install rust > /dev/null 2>&1
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
            git clone https://github.com/talwat/indiepkg.git > /dev/null 2>&1
            cd indiepkg > /dev/null 2>&1
            make > /dev/null 2>&1
            make install > /dev/null 2>&1
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
            brew install node > /dev/null 2>&1
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
            brew install figlet > /dev/null 2>&1
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
            brew install wget > /dev/null 2>&1
            echo -e "\033[0;32m=>\033[0m Installed wget"
        else
            echo -e "\033[0;32m=>\033[0m wget"
        fi
    }
    echo "Checking and installing dependencies ..."
    brew
    cmake
    go
    ports
    cargo
    npm
    indiepkg
    figlet

    #configs
    this=$(pwd)
    cd $HOME
    sudo mkdir -p .ndos/shin
    sudo cp $this/configs/shin.config .ndos/shin/
    sudo cp $this/configs/shinVersion.config .ndos/shin/
}
 
####### Update
update () {
    brew update && brew upgrade
    sudo port -v selfupdate
    cargo update
    indiepkg upgrade && indiepkg update
}

########### MAIN ###########
####### Installation
installation

####### Update
#update