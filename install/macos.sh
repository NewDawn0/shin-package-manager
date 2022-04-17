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
    ports () {
        which -s port
        if [[ $? != 0 ]] ; then
            echo -e "\033[0;36m=>\033[0m Installing macPorts ... "
            echo -e "\033[0;36m=>\033[0m This might take a while"
            wget https://github.com/macports/macports-base/releases/download/v2.7.2/MacPorts-2.7.2.tar.gz > /dev/null 2>&1
            tar xzvf MacPorts-2.7.2.tar.gz > /dev/null 2>&1
            cd MacPorts-2.7.2
            ./configure && make && sudo make install > /dev/null 2>&1
            cd ../
            rm -rf MacPorts-2.7.2* > /dev/null 2>&1
            ps -aux | grep spinner.sh
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
    echo "Checking and installing dependencies ..."
    brew
    cmake
    go
    ports
    cargo
    npm
    indiepkg
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