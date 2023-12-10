# kali-enable-ssh-oci
Use this repo to pull the commands needed to enable ssh on kali linux image in Oracle Cloud Infrasatructure (OCI). The documentation for the OCI image by default does not have the ssh enabled. For more info, refer to the kali documentation for the oci image. 

## Pre-requisites
- Please make sure you have console access to the Kali linux OCI instance

## STEPS
1. launch a console to connect to the Kali OCI instance
1. Select the desired release to download 
2. Right click and copy the link of the selected Asset
3. use the command ```wget <copied link>```
4. untar the file ```tar -xvf <downloaded .tar.gz>```

REFERENCES:
- Source list addition
  https://www.kali.org/docs/general-use/kali-linux-sources-list-repositories/
- apt update issue in kali
  https://superuser.com/questions/1644520/apt-get-update-issue-in-kali
- Install updates via commandline
  https://askubuntu.com/questions/196768/how-to-install-updates-via-command-line
- Enable ssh in Kali linux
  https://linuxhint.com/enable_ssh_kali_linux/