# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.


  # May switch this to a smaller footprint - should be a systemd though...
  config.vm.box = "ubuntu/xenial64"

  # Forward the cairis web port to the localhost 8080
  config.vm.network "forwarded_port", guest: 7071, host: 8080, host_ip: "127.0.0.1"

  # Virtualbox setting as 2GB ram for cairis to help installation. May be decreased after provision. 
  config.vm.provider "virtualbox" do |vb|
    # Customize the amount of memory on the VM:
    vb.memory = 2048
  end
 
  # Copy the systemd service file to the local machine
  config.vm.provision "file", source: "./cairis.service", destination: "./cairis.service"

  # Start the provisioning script
  config.vm.provision "shell", path: "./bootstrap.sh"
end
