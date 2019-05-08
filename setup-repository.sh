#!/bin/sh
#
# AUTHOR: Paulo Monteiro @ New Relic - 2019-04
#

# create an SSH key

export SSH_KEY_PASSPHRASE='I-will-be-medieval-on-your-SaaS'
rm -f /home/ec2-user/.ssh/id_rsa
ssh-keygen -q -t rsa -N "${SSH_KEY_PASSPHRASE}" -f /home/ec2-user/.ssh/id_rsa

# ATTENTION: change variables below

export GITHUB_USER='ThyWoof'
export GITHUB_USER_NAME='Winston Wolfe'
export GITHUB_USER_EMAIL='Winston.Wolfe@marsellus.inc.com'
export GITHUB_REPO=''

# configure git

git config --global user.name "${GITHUB_USER_NAME}"
git config --global user.email "${GITHUB_USER_EMAIL}"

# clone the repo

cd ~ && git clone "http://github.com/${GITHUB_USER}/${GITHUB_REPO}"
cd ~/${GITHUB_REPO}

# create the .env file
cp env.template .env
