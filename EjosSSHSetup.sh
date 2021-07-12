echo "Hello! Welcome to Ejo's automatic SSH configurator! Would you like for me to set up SSH on your machine? (Y/N)"
read ANSWER
case "$ANSWER" in 
	[yY] | [yY][eE][sS])
		echo "Okay, let's get started!"
		;;
	[nN] | [nN][oO])
		echo "Okay, have a good day"
		exit
		;;
*)
	echo "ERROR"
	;;
esac

if ! hash ssh 2>/dev/null;
then
	echo "Let us begin by installing ssh!"
	sudo apt install openssh-server
	echo "Done!"
else
	echo "SSH already installed!"
fi

if ! hash sed 2>/dev/null;
then
	sudo apt install sed
else 
	echo "sed is already set up"
fi

echo "Which port would you like to use? (Port 22 is default)"
read -p "Number: " PORT
sudo sed -i "s/#Port 22/Port $PORT/" /etc/ssh/sshd_config
sudo systemctl enable ssh
sudo systemctl restart ssh
echo "All done! Enjoy!"
