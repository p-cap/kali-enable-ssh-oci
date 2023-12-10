# switch to root
echo "SWITCHING TO ROOT ;-)"
sudo -i

sleep 5
echo "Adding software repository recommended by kali.org"
echo "deb http://http.kali.org/kali kali-rolling main contrib non-free non-free-firmware" | sudo tee /etc/apt/sources.list

echo "this will take a while"
sleep 5
wget http://http.kali.org/kali/pool/main/k/kali-archive-keyring/kali-archive-keyring_2022.1_all.deb
sudo dpkg -i kali-archive-keyring_2022.1_all.deb
rm kali-archive-keyring_2022.1_all.deb
sudo apt update -y        # Fetches the list of available updates
sudo apt upgrade  -y     # Installs some updates; does not remove packages
sudo apt full-upgrade -y  # Installs updates; may also remove some packages, if needed
sudo apt autoremove  -y  # Removes any old packages that are no longer needed

sleep 10
echo "Installing and enabling ssh"
sudo apt-get install ssh -y
sudo service ssh start
sudo update-rc.d -f ssh remove
sudo update-rc.d -f ssh defaults

sleep 10
echo "changing default keys"
cd /etc/ssh/
mkdir default_kali_keys
mv ssh_host_* default_kali_keys/
dpkg-reconfigure openssh-server
service ssh restart
