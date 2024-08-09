#!/usr/bin/env bash

#Update-all-Nodes
sudo apt-get update && apt-get upgrade -y

#Add-etc-Modules
sudo cat << EOF > /etc/modules-load.d/k8s.conf
br_netfilter
ip_vs
ip_vs_rr
ip_vs_sh
ip_vs_wrr
nf_conntrack_ipv4
overlay
EOF

sudo cat << EOF > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF

#Update-Systemctl
sudo sysctl --system

sudo apt update

sudo apt upgrade -y

#Download-Docker
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - 

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt update

#Install-Config-Containerd
sudo apt install -y containerd.io

sudo mkdir -p /etc/containerd

sudo containerd config default > /etc/containerd/config.toml

sudo systemctl enable containerd

sudo systemctl restart containerd

#Install-Kubernetes-Components
sudo apt-get update && sudo apt-get install -y apt-transport-https gnupg2

sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

sudo echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update

sudo apt-get install -y kubelet kubeadm kubectl

sudo swapoff -a

sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
