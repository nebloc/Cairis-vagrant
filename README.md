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

Once finished, access cairis on localhost:port where port was specified in the conf.yaml file.
The User credentials are whatever was specified in the yaml file at provisioning time.

Multi_user specifies whether to run the cairis server with wsgi - Takes longer to provision as extra installations are needed.  

## Maintaining
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
Due to Cairis' ongoing development and occasional instability, I recommend using 
```
$ vagrant snapshot save name-of-save
```
Then using the export model function to save the 'model.xml'.
If it fails, there is the option to roll back using the following command:
```
$ vagrant snapshot restore name-of-save --no-provision
```
