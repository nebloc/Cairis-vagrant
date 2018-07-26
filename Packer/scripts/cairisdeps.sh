#!/bin/sh -eux

echo debconf mysql-server/root_password password root | sudo debconf-set-selections
echo debconf mysql-server/root_password_again password root | sudo debconf-set-selections

apt-get install -y python-dev build-essential mysql-server mysql-client graphviz docbook dblatex python-pip python-numpy git libmysqlclient-dev --no-install-recommends texlive-latex-extra docbook-utils inkscape libxml2-dev libxslt1-dev poppler-utils python-setuptools