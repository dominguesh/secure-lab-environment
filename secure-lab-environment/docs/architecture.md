# Lab Environment Architecture

## Overview
This lab environment implements a secure, segmented network architecture using VMware Workstation Pro. The design follows security best practices including network isolation, controlled access points, and the principle of least privilege.

## Network Segmentation
The environment is divided into three distinct network segments:

1. DMZ Network (10.0.1.0/24)
   - Purpose: Hosts public-facing services
   - Controlled internet access
   - Direct external connectivity

2. Internal Network (172.16.0.0/24)
   - Purpose: Hosts internal services and workstations
   - No direct internet access
   - Controlled through Bastion Host

3. Isolated Network (192.168.1.0/24)
   - Purpose: Hosts sensitive database services
   - Air-gapped from internet
   - Strictly controlled access

## Component Details

### Bastion Host (10.0.1.20)
- Primary security control point
- Manages access to all network segments
- Interfaces:
  * DMZ: ens33 (10.0.1.20)
  * Internal: ens34 (172.16.0.1)
  * Isolated: ens35 (192.168.1.1)
- Security Features:
  * SSH key-based authentication
  * Strict firewall rules
  * Comprehensive logging
  * PAM implementation

### Web Server (10.0.1.10)
- Hosts environment documentation
- Located in DMZ
- Interface:
  * DMZ: ens33 (10.0.1.10)
- Security Features:
  * Access only from Bastion Host via SSH
  * Web access on ports 80/443
  * Minimal installed packages

### Database Server (192.168.1.30)
- Hosts sensitive data
- Located in isolated network
- Interface:
  * Isolated: ens33 (192.168.1.30)
- Security Features:
  * No direct internet access
  * Access only through Bastion Host
  * Restricted MySQL access

## Security Implementation

### Network Access Controls
- DMZ to Internet: Controlled through NAT
- Internal to DMZ: Through Bastion Host only
- Isolated to Internal: Strictly controlled
- All inter-network traffic passes through Bastion Host

### Access Control Hierarchy
1. Network Level
   - UFW firewall rules on all servers
   - Network segregation through VMware
   - Port-level access control

2. Authentication Level
   - SSH key-based authentication
   - No password authentication allowed
   - Different keys for different access levels

3. Authorization Level
   - PAM controls
   - Role-based access
   - Audit logging

### Monitoring and Logging
- Centralized logging on Bastion Host
- SSH access logging
- Failed access attempts monitoring
- Network traffic logging

## Maintenance and Future Considerations

### Backup Strategy
- Configuration backup procedures
- Regular system updates protocol
- Data backup requirements for DB server

### Scalability Considerations
- Additional web servers can be added to DMZ
- Database replication options
- Load balancing possibilities

### Future Enhancements
1. High Availability
   - Redundant Bastion Hosts
   - Database clustering
   - Load balanced web services

2. Monitoring Improvements
   - Centralized monitoring system
   - Advanced intrusion detection
   - Performance monitoring

### Documentation Maintenance
- Regular review of network diagrams
- Configuration change logging
- Security policy updates
