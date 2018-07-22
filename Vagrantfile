Vagrant.configure("2") do |config|  
  config.vm.box = "google/gce"
  config.ssh.username = "username" # YOU NEED TO CHANGE THIS
  config.ssh.private_key_path = "~/.ssh/google_compute_engine"

  config.vm.provider :google do |google, override|
    google.google_project_id = "PROJECT-ID" # CHANGE TO YOUR PROJECT ID
    google.google_client_email = "email@example.com" # CHANGE TO YOUR GOOGLE CLIENT EMAIL
    google.google_json_key_location = "./account.json" # NEED TO PLACE IN THE SAME FOLDER, CALLED account.json
    
    google.image_family = 'ubuntu-1604-lts' # ubuntu xenial 16.0.4
    
    override.ssh.username = "username" # CHANGE TO SAME AS ABOVE
    override.ssh.private_key_path = "~/.ssh/google_compute_engine"
  end

  
  # Copy the systemd service file to the local machine
  config.vm.provision "file", source: "./cairis.service", destination: "./cairis.service"

  # Start the provisioning script
  config.vm.provision "shell" do |s|
    s.path = "./bootstrap.sh"
  end
end
