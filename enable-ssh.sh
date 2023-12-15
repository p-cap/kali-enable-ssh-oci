sleep 5 
echo "Adding software repository recommended by kali.org"
echo "deb http://http.kali.org/kali kali-rolling main contrib non-free non-free-firmware" | sudo tee /etc/apt/sources.list

echo "this will take a while"
sleep 5
wget http://http.kali.org/kali/pool/main/k/kali-archive-keyring/kali-archive-keyring_2022.1_all.deb
sudo dpkg -i kali-archive-keyring_2022.1_all.deb
rm kali-archive-keyring_2022.1_all.deb
sudo apt update -y # Update the repositories to ensure you receive the latest packages.

sleep 10
echo "Installing and enabling ssh"
sudo apt install ssh -y # accept the defaults
sudo service ssh start
sudo systemctl start rescue-ssh.target

sudo apt install ssh -y # accept the defaults
sudo service ssh start
sudo update-rc.d -f ssh remove
sudo update-rc.d -f ssh defaults

sleep 10
echo "changing default keys"
cd /etc/ssh/
sudo mkdir default_kali_keys
sudo mv ssh_host_* default_kali_keys/
sudo dpkg-reconfigure openssh-server
sudo service ssh restart
sudo systemctl start rescue-ssh.target
