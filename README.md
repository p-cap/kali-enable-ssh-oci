# kali-enable-ssh-oci
Use this repo to pull the commands needed to enable ssh on kali linux image in Oracle Cloud Infrasatructure (OCI). The documentation for the OCI image by default does not have the ssh enabled. For more info, refer to the kali documentation for the oci image. 

## Pre-requisites
- Please make sure you have console access to the Kali linux OCI instance
- You have the permissions to perfrom the task

## STEPS
1. launch a "console connection -> Launch Cloud Shell Connection" within your KALI oci instance
2. Login in
3. Go to the releases page on this repo by clicking on "Releases" on the right hand side of this page
4. Select the latest release and then pick the applicable "Asset". For this repo, we are selecting the ```.tar.gz```
5. Right click and copy the link of the selected Asset
6. use the command ```wget <copied link>```
7. untar the file ```tar -xvf <downloaded .tar.gz>```
8. ```chmod 700 <tar file>```
9. ```./<tar file>```
    - while running the script, please be aware of the prompts
    - the script annoatates to what part of the script has prompts
10. Please close the console connection
11. ```ssh -v -i <private-key> user@public-ip```
12. add user with the following commands:
   - ```sudo useradd -m -s /bin/bash pcap```
   - ```sudo passwd pcap```
13. ```sudo apt update```
14. ```sudo apt full-upgrade -y```
15. OPTIONAL: if you enrounter an error that looks like ```/usr/bin/dpkg returned an error code (1)```, please run ```sudo dpkg --configure -a```
16. ```sudo apt install kali-desktop-xfce xorg xrdp```
17. ```sudo systemctl enable xrdp --now```
18. In OCI, create the bastion resource
19. add your IP as part of the ```CIDR Block allow list```
20. Create the bastion session and configure it with the following:
    - seesion type: ssh port forwarding
    - session name
    - pick the compute instance
    - add your public key you had for our Kali OCI instance
21. copy the ssh command needed to connect to the session. In the ssh command, please change the following:
    - private key location for the ```-i``` option
    - the local port should be different from 3389
22. On Windows, open RDP app
23. In the computer field, annotate ```localhost:<the other port```
24. Upon successful connection, login with the user you created above
25. You should see the screen look like the one below:

![image](https://github.com/p-cap/kali-oci-enable-ssh-rdp/assets/64616459/3017e1e6-8ec5-4dbd-95b8-a657786a3bf4)


## If you get to stuck
- dpkg error
  - ```sudo dpkg --configure -a```
  - ```sudo apt-get install -f```
- Check if port 3389 is open. You do the following to check for it:
  - ```sudo iptables -L```
  - ```sudo netstat -ntlp```
- Check the status of the following services:
  - ```sudo systemctl status xrdp.service```
- ```sudo journalctl | grep -i <service-name>```

REFERENCES:
- Source list addition
  https://www.kali.org/docs/general-use/kali-linux-sources-list-repositories/
- apt update issue in kali
  https://superuser.com/questions/1644520/apt-get-update-issue-in-kali
- Install updates via commandline
  https://askubuntu.com/questions/196768/how-to-install-updates-via-command-line
- Enable ssh in Kali linux
  https://linuxhint.com/enable_ssh_kali_linux/
- How to Fix sub-process /usr/bin/dpkg returned an error code (1)
  https://phoenixnap.com/kb/fix-sub-process-usr-bin-dpkg-returned-error-code-1
  
