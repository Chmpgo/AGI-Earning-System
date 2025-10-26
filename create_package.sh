#!/bin/bash
# AGI-Earning-System Package Generator

echo "Creating folder structure..."
mkdir -p agi-brain ubuntu-setup

# Placeholder README
cat <<EOL > README.md
# AGI-Earning-System
Automated deployment package for Azure VMs + AGI Brain.
EOL

# AGI Brain main script
cat <<'EOL' > agi-brain/main.py
#!/usr/bin/env python3
import time
print("AGI Brain started. Automating everything...")
while True:
    # Placeholder for tasks
    time.sleep(10)
EOL

chmod +x agi-brain/main.py

# Ubuntu setup script
cat <<'EOL' > ubuntu-setup/setup.sh
#!/bin/bash
echo "Setting up Ubuntu VM..."
sudo apt update && sudo apt install -y docker.io python3 python3-pip git sshpass
sudo systemctl enable docker
sudo systemctl start docker
echo "Ubuntu VM setup completed."
EOL

chmod +x ubuntu-setup/setup.sh

echo "Package creation completed!"

