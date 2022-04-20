echo ""
echo -e "\033[0;36m   ____  _     _       \033[0m"
echo -e "\033[0;36m  / ___|| |__ (_)_ __  \033[0m"
echo -e "\033[0;36m  \___ \| '_ \| | '_ \ \033[0m"
echo -e "\033[0;36m   ___) | | | | | | | |\033[0m"
echo -e "\033[0;36m  |____/|_| |_|_|_| |_|\033[0m"
echo ""
echo "Installing configs ..."
this=$1
echo $this
cd $HOME
sudo mkdir -p .ndos/shin
sudo cp $this/configs/shin.config $HOME/.ndos/shin/
sudo cp $this/configs/shinVersion.config $HOME/.ndos/shin/
sudo cp $this/shin /usr/local/bin
sudo touch $HOME/.ndos/shin/packages.txt
sudo touch $HOME/.ndos/shin/managers.txt
cd $this
cat install/user.txt >> $HOME/.ndos/shin/shin.config