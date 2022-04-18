echo ""
echo -e "\033[0;36m   ____  _     _       \033[0m"
echo -e "\033[0;36m  / ___|| |__ (_)_ __  \033[0m"
echo -e "\033[0;36m  \___ \| '_ \| | '_ \ \033[0m"
echo -e "\033[0;36m   ___) | | | | | | | |\033[0m"
echo -e "\033[0;36m  |____/|_| |_|_|_| |_|\033[0m"
echo ""
echo "Installing configs ..."
this=$(pwd)
cd $HOME
sudo mkdir -p .ndos/shin
sudo cp $this/configs/shin.config .ndos/shin/
sudo cp $this/configs/shinVersion.config .ndos/shin/
sudo cp $this/shin /usr/local/bin
echo "Please enter your username"
read name
echo user=$name  >> $HOME/.ndos/shin/shin.config