useradd u19507
usermod -u 1022 u19507
groupmod -g 1029 u19507

# Enable multilib in /etc/pacman.conf and pacman -Syyu
pacman -Syyu
pacman -S --needed base-devel -y
pacman -S sudo vim which tmux git vi go wget curl openssh ttf-droid -y

echo "Now edit the visudo file to allow sudo use in docker!"
sleep 5
visudo
usermod -aG wheel u19507
echo "Basic user setup complete! Run su u19507 to start working!"

# Build env setup
wget https://raw.githubusercontent.com/akhilnarang/scripts/master/setup/arch-manjaro.sh
chmod +x arch-manjaro.sh
./arch-manjaro.sh
rm arch-manjaro.sh

cd ~/
cd yay-git
makepkg -si

# Mounting Ramdisk
sudo mount -t tmpfs -o size=400g tmpfs ram