require 'yaml'
conf = YAML.load_file("conf.yaml")

Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.


  # Now using a box with packages pre-installed / configured.
  # Switch to "bento/ubuntu-16.04" If you want to use a different provider
  config.vm.box = "nebloc/cairis"

  # Forward the cairis web port to the localhost 8080
  if conf['multi_user']
    config.vm.network "forwarded_port", guest: 8000, host: 8080, host_ip: "127.0.0.1"
  else
    config.vm.network "forwarded_port", guest: 7071, host: 8080, host_ip: "127.0.0.1"
  end

  # Virtualbox setting as 2GB ram for cairis to help installation. May be decreased after provision. 
  config.vm.provider "virtualbox" do |vb|
    # Customize the amount of memory on the VM:
    vb.memory = 2048
  end

  # Copy the systemd service file to the local machine
  if conf["multi_user"]
    config.vm.provision "file", source: "./cairis_wsgi.service", destination: "/tmp/cairis.service"
  else
    config.vm.provision "file", source: "./cairis.service", destination: "/tmp/cairis.service"
  end
  
  # Start the provisioning script
  config.vm.provision "shell" do |s|
    s.path = "./bootstrap.sh"
    # Initial Username, Initial Password
    s.args = ["#{conf['username']}", "#{conf['password']}", "#{conf['multi_user']}"]
  end
end
