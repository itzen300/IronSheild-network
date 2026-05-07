# IronSheild-network
# 🛡️ Iron Shield — Enterprise Campus Network Simulation

A full-scale enterprise campus network simulation modeled on KIIT University's infrastructure using Cisco Packet Tracer.  
This project demonstrates practical implementation of secure enterprise networking concepts including VLAN segmentation, dynamic routing, centralized authentication, access control policies, and secure remote management.


#  Project Overview :-

Iron Shield is a multi-campus enterprise network simulation designed to replicate a real-world university infrastructure environment.

The network is divided into multiple isolated campus zones using VLAN segmentation while maintaining controlled communication through Layer 3 routing and ACL-based security enforcement.

The project focuses on:
- Enterprise network architecture
- Inter-VLAN communication
- Dynamic routing
- Secure authentication
- Least-privilege access control
- DMZ deployment
- SSH hardening

---

#  Network Architecture :-

The infrastructure consists of **6 campus zones**, each mapped to a dedicated VLAN.

| Campus | Department | VLAN ID | Role |
|--------|-------------|----------|------|
| Campus 3 | Arts & Science | VLAN 3 | DMZ Gateway |
| Campus 6 | ITC Cell | VLAN 6 | Master Controller |
| Campus 8 | Mechanical | VLAN 8 | Restricted Zone |
| Campus 12 | Electrical | VLAN 12 | Remote Access Zone |
| Campus 17 | Management | VLAN 17 | Administrative Zone |
| Campus 25 | CS/IT | VLAN 25 | Sub-Master Controller |
| Management VLAN | Device Management | VLAN 99 | Out-of-Band Management |

---

#  Core Features :-

##  VLAN Segmentation
- Department-wise logical segmentation using VLANs
- Reduced broadcast domains
- Improved traffic isolation and security

##  Inter-VLAN Routing
- Implemented using Cisco Layer 3 Multilayer Switch
- High-speed routing between campus zones
- Centralized at Campus 6

##  Dynamic Routing (OSPF)
- OSPF configured for automatic route learning
- Fast reconvergence during link failures
- Scalable routing architecture

##  Secure Authentication
- Centralized RADIUS/AAA authentication server
- Secure SSH login for administrators
- Local credential fallback enabled

##  ACL-Based Security
- Extended ACLs enforce least-privilege communication
- Controlled access between campus zones
- DMZ isolation policies implemented

##  SSH Hardening
- Secure remote device management
- Telnet disabled
- VTY lines protected with AAA authentication

---

#  Security Policies :-

## Campus 8 — Core Engg Department
- Most restricted campus
- Wired-only access
- Blocked from:
  - Remote access zones
  - Authentication zones
  - Core management systems

## Campus 12 — Electronics Department
- Handles external remote access points
- Isolated from Master Controller
- Limited inter-campus communication

## Campus 3 — DMZ Gateway
- Accepts only:
  - HTTP
  - HTTPS
  - RADIUS
- Cannot directly access core infrastructure

---

#  Technologies & Protocols Used :-

- Cisco Packet Tracer
- VLANs
- OSPF
- ACL
- RADIUS
- AAA
- 802.1Q Trunking
- SSH
- Layer 3 Switching

---

#  Repository Structure :-

```bash
Iron-Shield/
│
├── Cisco packet tracer/
│   
│
├── Servers/
│   
│
├── Switches/
│   
│
├── Others/
│   
│
└── README.md
