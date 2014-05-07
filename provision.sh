#! /bin/bash
if [ ! -f /home/vagrant/already-installed-flag ]
then
  echo "ADD EXTRA ALIAS VIA .bashrc"
  cat /vagrant/bashrc.append.txt >> /home/vagrant/.bashrc
  echo "GENERAL APT-GET UPDATE"
  apt-get -qq update
  echo "INSTALL GIT"
  apt-get -qq -y install git
  echo "INSTALL VIM"
  apt-get -qq -y install vim
  echo "INSTALL TREE"
  apt-get -qq -y install tree
  echo "INSTALL UNZIP"
  apt-get -qq -y install unzip curl 
  echo "INSTALL SYSSTAT"
  apt-get -y install sysstat

  apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
  echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" | tee -a /etc/apt/sources.list.d/10gen.list
  apt-get -y update
  apt-get install mongodb-org=2.6.1 mongodb-org-server=2.6.1 mongodb-org-shell=2.6.1 mongodb-org-mongos=2.6.1 mongodb-org-tools=2.6.1
  apt-get -y install build-essential python-dev
  apt-get -y install python-setuptools
  easy_install pymongo bottle

  curl -OL https://mms.mongodb.com/download/agent/monitoring/mongodb-mms-monitoring-agent_2.1.2.43-1_amd64.deb
  dpkg -i mongodb-mms-monitoring-agent_2.1.2.43-1_amd64.deb
  apt-get install munin-node

  touch /home/vagrant/already-installed-flag
  echo "Done but please update mmsApiKey via: sudo vi /etc/mongodb-mms/monitoring-agent.config and then start agrent via: sudo start mongodb-mms-monitoring-agent plus run: sudo service munin-node start."
else
  echo "already installed flag set : /home/vagrant/already-installed-flag"
fi

