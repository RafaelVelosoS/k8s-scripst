#!/usr/bin/env bash

sudo apt install -y containerd.io &> /dev/null

sudo mkdir -p /etc/containerd

sudo containerd config default > /etc/containerd/config.toml &> /dev/null

sudo systemctl enable containerd &> /dev/null

sudo systemctl restart containerd &> /dev/null