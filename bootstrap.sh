# Set the locale for ubuntu - python scripts fail without 
locale-gen en_GB.UTF-8

# Update repo list
apt update

apt install apache2 apache2-dev -y
# Copy the service file to the systemd directory
mv /tmp/cairis.service /etc/systemd/system/cairis.service

# If using a bento/ubuntu box uncomment:
# #Set root password for mysql database (default is root)
#debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
#debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

# #Install cairis dependencies
#apt-get install -y python-dev build-essential mysql-server mysql-client graphviz docbook dblatex python-pip python-numpy git libmysqlclient-dev --no-install-recommends texlive-latex-extra docbook-utils inkscape libxml2-dev libxslt1-dev poppler-utils python-setuptools



# Clone the latest on the master branch
git clone --depth 1 https://github.com/failys/cairis
cd cairis

# Unsure if needed, but wheel was failing the installs
pip install -U setuptools
pip install -U wheel
# Install cairis python dependencies
pip install -r requirements.txt
#pip install -r wsgi_requirements.txt 

# Run setup script as vagrant user, with cairis paths set, and passed init username/password
# Overriding HOME variable as python getenv HOME returns roots home, despite sudo -u.
sudo -u vagrant \
    HOME=/home/vagrant \
    CAIRIS_CFG=/home/vagrant/cairis.cnf \
    PYTHONPATH=${PYTHONPATH}:/home/vagrant/cairis/ \
    /home/vagrant/cairis/cairis/bin/quick_setup_headless.py --user $1 --password $2 --dbRootPassword root


systemctl enable /etc/systemd/system/cairis.service
systemctl start cairis.service
