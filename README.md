# Cairis-vagrant
A vagrant configuration for creating a [Cairis](https://github.com/failys/cairis) vm and a systemd service

## Install vagrant:
Debian/Ubuntu:
```
sudo apt install vagrant
```
Fedora/CentOS/RHEL:
```
sudo yum install vagrant
```
Mac:
Install Homebrew:
```
brew install vagrant
```

Windows - [Download the install from here](https://www.vagrantup.com/downloads.html)


## Install cairis
You need to install Virtualbox from Oracle

Clone this repo, open the directory in a terminal and type
```
$ vagrant up
```
This should start virtual box and complete all the installation.
After it has finished, access the virtual box with:
```
$ vagrant ssh
```
Navigate in to the cairis directory and run the setup
```
$ cd cairis
$ ./quick_setup
```

The mysql root password is in the bootstrap file as root. 
Username and password can be what you want. These are the credentials you will use to access the web console.

After the setup has complete, run the following commnads:
```
$ sudo systemctl enable /etc/systemd/system/cairis.service
$ sudo systemctl start cairis.service
```
These install the service unit and enable the service, so that when the VM is booted, it will start cairis by default.

You can now exit the SSH, with 
```
$ exit
```
## Maintaining
Web console can be accessed on [localhost:8080](http://localhost:8080)

To see the logs from cairis, SSH in to the virtual machine and type:
```
$ sudo journalctl -u cairis.service
```

To start and stop the virtual machine:
```
# Shutdown the VM
$ vagrant halt      

# Launch the VM and Cairis
$ vagrant up        
```  
## Saving your progress
Due to Cairis' ongoing development and instability, I recommend using 
```
$ vagrant snapshot save name-of-save
```
Then using the export model function to save the 'model.xml'.
If it fails, there is the option to roll back using the following command:
```
$ vagrant snapshot restore name-of-save --no-provision
```
