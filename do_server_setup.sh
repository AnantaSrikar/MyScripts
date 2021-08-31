printf "Enter the IP address of the server: "
read IP_ADDR

printf "\nEnter the non root user name you want to add: "
read NON_ROOT_USER

ssh root@$IP_ADDR -t "adduser $NON_ROOT_USER --ingroup sudo"
scp cp-keys.sh root@$IP_ADDR:~/
ssh root@$IP_ADDR -t "cp cp-keys.sh /home/$NON_ROOT_USER/; chmod +x /home/$NON_ROOT_USER/cp-keys.sh; su -c 'cd ~/; ./cp-keys.sh' $NON_ROOT_USER"

printf "\nFinished adding new user $NON_ROOT_USER, cleaning up\n\n"

ssh root@$IP_ADDR -t "rm cp-keys.sh /home/$NON_ROOT_USER/cp-keys.sh"

printf "\n\nUpdating the server, hang on...\n\n"

ssh $NON_ROOT_USER@$IP_ADDR -t "sudo apt update && sudo apt upgrade -y && sudo reboot"

printf "\n\nUpdate completed, the server is now restarting. \nYou can access your server by typing: 'ssh $NON_ROOT_USER@$IP_ADDR'\n\nHave a great day!"