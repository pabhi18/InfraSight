#!/bin/bash

# Update package lists
sudo apt update -y

# Download the CloudWatch Agent package
wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb

# Install the package
sudo dpkg -i -E ./amazon-cloudwatch-agent.deb

# Remove the package file
rm -f amazon-cloudwatch-agent.deb

# Create a default configuration file (modify as needed)
sudo tee /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json > /dev/null <<EOL
{
    "agent": {
        "metrics_collection_interval": 60,
        "logfile": "/opt/aws/amazon-cloudwatch-agent/logs/amazon-cloudwatch-agent.log"
    },
    "metrics": {
        "metrics_collected": {
            "cpu": {
                "measurement": [
                    "cpu_usage_idle",
                    "cpu_usage_iowait",
                    "cpu_usage_user",
                    "cpu_usage_system"
                ],
                "metrics_collection_interval": 60,
                "resources": ["*"]
            },
            "disk": {
                "measurement": [
                    "disk_used_percent"
                ],
                "metrics_collection_interval": 60,
                "resources": ["*"]
            },
            "mem": {
                "measurement": [
                    "mem_used_percent"
                ],
                "metrics_collection_interval": 60
            }
        }
    }
}
EOL

# Start the CloudWatch Agent
sudo systemctl enable amazon-cloudwatch-agent
sudo systemctl start amazon-cloudwatch-agent

# Verify the service status
sudo systemctl status amazon-cloudwatch-agent --no-pager

echo "CloudWatch Agent installation and configuration completed successfully."