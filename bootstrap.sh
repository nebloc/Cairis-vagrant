locale-gen en_GB.UTF-8

apt update

debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

apt-get install -y python-dev build-essential mysql-server mysql-client graphviz docbook dblatex python-pip python-numpy git libmysqlclient-dev --no-install-recommends texlive-latex-extra docbook-utils inkscape libxml2-dev libxslt1-dev poppler-utils python-setuptools

git clone https://github.com/failys/cairis
cd cairis
pip install -U setuptools
pip install -U wheel
pip install -r requirements.txt

mv ./cairis.service /etc/systemd/system/cairis.service

##########
## TODO ##
##########

# Need to find a way to run ./setup.py programatically
# Can take from the docker examples if deciphered.

# systemctl enable --now /etc/systemd/system/cairis.service