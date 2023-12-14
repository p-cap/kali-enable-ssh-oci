sleep 5 
echo "Adding software repository recommended by kali.org"
echo "deb http://http.kali.org/kali kali-rolling main contrib non-free non-free-firmware" | sudo tee /etc/apt/sources.list

echo "this will take a while"
sleep 5
wget http://http.kali.org/kali/pool/main/k/kali-archive-keyring/kali-archive-keyring_2022.1_all.deb
sudo dpkg -i kali-archive-keyring_2022.1_all.deb
rm kali-archive-keyring_2022.1_all.deb
sudo apt update -y        # Fetches the list of available updates

sleep 10
echo "Installing and enabling ssh"
sudo apt-get install ssh -y # Please select defaults for now
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

echo "Adding user"
sudo useradd -m -s /bin/bash pcap
sudo passwd pcap

# REF: https://www.kali.org/docs/general-use/xfce-with-rdp/
#!/bin/bash
echo "[i] Updating and upgrading Kali (this will take a while)"
apt-get update
apt-get --yes --force-yes full-upgrade

echo "[i] Installing Xfce4 & xrdp (this will take a while as well)"
apt-get --yes --force-yes install kali-desktop-xfce xorg xrdp

# below is going to optional if you want your port to listen to the ports below
echo "[i] Configuring xrdp to listen to port 3390 (but not starting the service)"
sed -i 's/port=3389/port=3390/g' /etc/xrdp/xrdp.ini

# check if xrdp, xorg and kali-desktop-xfce need to start
sudo systemctl enable xrdp --now

# PLACEHOLDER, do we need to open the ports??????

## please do the following below one you established ssh connection
:'
# This is NOT part of this script
sudo apt upgrade  -y     # Installs some updates; does not remove packages
sudo apt full-upgrade -y  # Installs updates; may also remove some packages, if needed
sudo apt autoremove  -y  # Removes any old packages that are no longer needed
'
