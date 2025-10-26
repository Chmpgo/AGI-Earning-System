#!/bin/bash
# Full Deployment Script for AGI-Earning-System

# Step 1: Login to Azure
echo "Logging into Azure..."
#az login

# Step 2: Create Resource Group
echo "Creating resource group..."
az group create --name AGI-RG --location eastus

# Step 3: Create Ubuntu VM
echo "Creating Ubuntu VM..."
az vm create \
  --resource-group AGI-RG \
  --name AGI-VM \
  --image UbuntuLTS \
  --admin-username azureuser \
  --generate-ssh-keys

# Step 4: Setup Ubuntu VM
echo "Setting up Ubuntu VM..."
VM_IP=$(az vm show -d -g AGI-RG -n AGI-VM --query publicIps -o tsv)
sshpass -p "YourPasswordHere" ssh -o StrictHostKeyChecking=no azureuser@$VM_IP 'bash -s' < ubuntu-setup/setup.sh

# Step 5: Start AGI Brain
echo "Starting AGI Brain..."
sshpass -p "YourPasswordHere" ssh azureuser@$VM_IP "nohup python3 ~/AGI-Earning-System/agi-brain/main.py > brain.log 2>&1 &"

# Step 6: Upload to GitHub
echo "Pushing to GitHub..."
git init
git add .
git commit -m "Initial AGI-Earning-System commit"
git branch -M main
git remote add origin https://$GITHUB_TOKEN@github.com/Chmpgo/AGI-Earning-System.git
git push -u origin main

echo "Deployment completed! AGI Brain is running on Azure VM."

