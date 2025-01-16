#!/bin/bash

# Base directory
BASE_DIR="secure-lab-environment"

# Create main directory structure if it doesn't exist
mkdir -p ${BASE_DIR}/{docs,scripts/{setup,security},diagrams,website/css}

# Function to create a file with content
create_file() {
    local file=$1
    local title=$2
    local content=$3
    
    echo "# ${title}

## Overview
${content}

## Implementation Details

## Configuration Steps

## Reference Documentation
" > "$file"
}

# Documentation files content
cd ${BASE_DIR}/docs

# Architecture documentation
create_file "architecture.md" "Environment Architecture" "Detailed description of the lab environment architecture including network segments, security zones, and component interactions."

# Network diagram documentation
create_file "network-diagram.md" "Network Diagrams" "Visual and technical documentation of network layout, including DMZ, internal, and isolated network segments."

# Data flow documentation
create_file "data-flow.md" "Data Flow Documentation" "Comprehensive documentation of data movement between components, including security checkpoints and authentication processes."

# Security implementation documentation
create_file "security-implementation.md" "Security Implementation" "Detailed security measures implemented including firewall rules, SSH configurations, and network isolation strategies."

# PAM setup documentation
create_file "pam-setup.md" "PAM Configuration" "Complete PAM setup documentation including access control policies, user management, and audit logging configuration."

# Create script templates
cd ../scripts/setup
echo '#!/bin/bash
# Bastion Host Setup Script
# Configuration and security setup for bastion host' > bastion-setup.sh

echo '#!/bin/bash
# Web Server Setup Script
# Configuration for web server deployment' > webserver-setup.sh

echo '#!/bin/bash
# Database Server Setup Script
# Secure configuration for database server' > db-setup.sh

cd ../security
echo '#!/bin/bash
# Firewall Rules Configuration
# Implementation of security rules and policies' > firewall-rules.sh

echo '#!/bin/bash
# PAM Configuration Script
# Setup and configuration of PAM modules' > pam-config.sh

# Make all scripts executable
chmod +x ../setup/*.sh
chmod +x ./*.sh

# Create basic website template
cd ../../website
echo '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Lab Environment Documentation</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <h1>Lab Environment Architecture</h1>
    <!-- Content will be added here -->
</body>
</html>' > index.html

# Create basic CSS
mkdir -p css
echo 'body {
    font-family: Arial, sans-serif;
    margin: 40px;
    line-height: 1.6;
}' > css/styles.css

echo "Documentation framework has been set up successfully!"
