#!/bin/sh
#
# AUTHOR: Paulo Monteiro @ New Relic - 2019-05
#

# update packages

sudo yum update -y

# ATTENTION: change variables below

export YOUR_NAME='Winston Wolfe'
export YOUR_COMPANY_NAME='Marsellus Wallace Inc.'
export NEW_RELIC_LICENSE_KEY=''

# install the NR Infra agent

echo "\
license_key: ${NEW_RELIC_LICENSE_KEY}
custom_attributes:
    student: ${YOUR_NAME}
    company: ${YOUR_COMPANY_NAME}
" | sudo tee -a /etc/newrelic-infra.yml
sudo curl -sLo /etc/yum.repos.d/newrelic-infra.repo \
  https://download.newrelic.com/infrastructure_agent/linux/yum/el/6/x86_64/newrelic-infra.repo
sudo yum -q makecache -y --disablerepo='*' --enablerepo='newrelic-infra'
sudo yum install newrelic-infra -y

# install docker-compose

curl -sLo docker-compose "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)"
chmod +x docker-compose
sudo mv docker-compose /usr/local/bin

# install git / docker

sudo yum install git docker-io -y
sudo service docker start
sudo usermod -aG docker ec2-user
logout
