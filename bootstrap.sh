# Set the locale for ubuntu - python scripts fail without 
locale-gen en_GB.UTF-8

# Update repo list
apt update

# Set root password for mysql database (default is root)
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

# Install cairis dependencies
apt-get install -y python-dev build-essential mysql-server mysql-client graphviz docbook dblatex python-pip python-numpy git libmysqlclient-dev --no-install-recommends texlive-latex-extra docbook-utils inkscape libxml2-dev libxslt1-dev poppler-utils python-setuptools

# Copy the service file to the systemd directory
mv ./cairis.service /etc/systemd/system/cairis.service

# Clone the latest on the master branch
git clone https://github.com/failys/cairis
cd cairis

# Unsure if needed, but wheel was failing the installs
pip install -U setuptools
pip install -U wheel
# Install cairis python dependencies
pip install -r requirements.txt



##########
## TODO ##
##########
# Find out why pip install requirements is exiting...

# Need to find a way to run ./setup.py programatically
# Can take from the docker examples if deciphered.

# systemctl enable --now /etc/systemd/system/cairis.service