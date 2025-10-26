#!/bin/bash
echo "Setting up Ubuntu VM..."
sudo apt update && sudo apt install -y docker.io python3 python3-pip git sshpass
sudo systemctl enable docker
sudo systemctl start docker
echo "Ubuntu VM setup completed."
