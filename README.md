# Secure Lab Environment

## Overview
This project implements a secure laboratory environment with isolated networks, featuring a web server, database server, and proper security controls through a bastion host. The implementation includes PAM (Pluggable Authentication Modules) for enhanced security and access control.

## Architecture
The environment consists of three distinct network segments:
- DMZ Network (10.0.1.0/24)
- Internal Network (172.16.0.0/24)
- Isolated Network (192.168.1.0/24)

### Components
- **Bastion Host**: Central security control point
- **Web Server**: Hosts environment documentation
- **Database Server**: Air-gapped secure database
- **Development Workstation**: For environment management

## Implementation Details

### Network Security
- Isolated database network
- Controlled access through bastion host
- Strictly defined firewall rules
- Network segregation

### Access Control
- SSH key-based authentication
- PAM implementation
- Role-based access control
- Audit logging

## Setup Instructions
Detailed setup instructions for each component can be found in the respective documentation:
- [Architecture Overview](docs/architecture.md)
- [Network Setup](docs/network-setup.md)
- [Security Implementation](docs/security-implementation.md)
- [PAM Configuration](docs/pam-setup.md)

## Scripts
The `/scripts` directory contains automation for:
- Environment setup
- Security configurations
- Network configurations
- PAM implementation

## Future Enhancements
- Load balancer implementation
- High availability configuration
- Automated backup solutions
- Enhanced monitoring system
- Container orchestration integration

## Prerequisites
- VMware Workstation Pro
- Ubuntu Server 22.04 LTS
- Basic networking knowledge
- Understanding of security principles

## Contributing
Feel free to submit issues and enhancement requests.

## License
[MIT License](LICENSE)

## Author
H.D
