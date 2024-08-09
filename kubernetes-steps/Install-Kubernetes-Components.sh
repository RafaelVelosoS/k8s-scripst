#!/usr/bin/env bash

sudo apt-get install -y apt-transport-https &> /dev/null
sudo apt-get install -y gnupg2 &> /dev/null

sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add 

sudo echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update &> /dev/null

sudo apt-get install -y kubelet &> /dev/null
sudo apt-get install -y kubeadm &> /dev/null 
sudo apt-get install -y kubectl &> /dev/null

sudo swapoff -a

sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab