#!/bin/bash
id=$(id -u)
if [ $id -eq 0 ]; then
    echo "Do not run this script as root"
else
    echo "starting install..."
    echo ""
    bash install/user.sh
    sudo python install/getOs.py
fi
