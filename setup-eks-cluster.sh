#!/bin/sh
#
# AUTHOR: Paulo Monteiro @ New Relic - 2019-04
#

# publish your images

cd ~/${GITHUB_REPO}
docker login
docker-compose build
docker-compose push

# source the variables

cd ~/${GITHUB_REPO}
. env.sh

# install kubectl

curl -sLO https://amazon-eks.s3-us-west-2.amazonaws.com/1.11.5/2018-12-06/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /usr/local/bin

# install heptio-authenticator-aws

curl -sLo heptio-authenticator-aws https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v0.3.0/heptio-authenticator-aws_0.3.0_linux_amd64
chmod +x heptio-authenticator-aws
sudo mv heptio-authenticator-aws /usr/local/bin

# configure the AWS cli

export AWS_REGION='us-west-2'

mkdir ~/.aws
printf "[default]\noutput = json\nregion = ${AWS_REGION}\n" > ~/.aws/config
aws configure

# install eksctl

curl -sL "https://github.com/weaveworks/eksctl/releases/download/latest_release/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin

# create the basic EKS cluster (when done consider saving ~/.kube/config to a safe place)

eksctl create cluster --region=${AWS_REGION} --name=${CLUSTER_NAME}

# check if everything is sound

kubectl get pods --all-namespaces --no-headers -o custom-columns=":metadata.name,:metadata.namespace"
