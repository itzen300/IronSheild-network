! === STEP 1: Create all VLANs ===
enable
configure terminal

vlan 3
 name CP3_ARTS_ENTRY
vlan 6
 name CP6_ITC_MASTER
vlan 8
 name CP8_MECH_WIRED
vlan 12
 name CP12_EE_REMOTE
vlan 17
 name CP17_ARCH_OFFTECH
vlan 25
 name CP25_CSIT_STORAGE
vlan 99
 name MANAGEMENT
exit

! === STEP 2: Create SVI (gateway) interfaces for inter-VLAN routing ===
ip routing

interface vlan 3
 ip address 192.168.3.1 255.255.255.0
 no shutdown
 description ENTRY_GATEWAY_CP3

interface vlan 6
 ip address 192.168.6.1 255.255.255.0
 no shutdown
 description MASTER_CONTROLLER_CP6

interface vlan 8
 ip address 192.168.8.1 255.255.255.0
 no shutdown
 description MECH_WIRED_CP8

interface vlan 12
 ip address 192.168.12.1 255.255.255.0
 no shutdown
 description EE_REMOTE_CP12

interface vlan 17
 ip address 192.168.17.1 255.255.255.0
 no shutdown
 description ARCH_CP17

interface vlan 25
 ip address 192.168.25.1 255.255.255.0
 no shutdown
 description STORAGE_SUBMASTER_CP25

interface vlan 99
 ip address 192.168.99.1 255.255.255.0
 no shutdown
 description MANAGEMENT

! === STEP 3: Configure trunk uplinks to each campus switch ===
! (adjust Fa0/1–Fa0/6 to match your actual cable ports)

interface FastEthernet0/1
 description TRUNK_TO_CP3
 switchport trunk encapsulation dot1q
 switchport mode trunk
 switchport trunk allowed vlan 3,99

interface FastEthernet0/2
 description TRUNK_TO_CP8
 switchport trunk encapsulation dot1q
 switchport mode trunk
 switchport trunk allowed vlan 8,99

interface FastEthernet0/3
 description TRUNK_TO_CP12
 switchport trunk encapsulation dot1q
 switchport mode trunk
 switchport trunk allowed vlan 12,99

interface FastEthernet0/4
 description TRUNK_TO_CP17
 switchport trunk encapsulation dot1q
 switchport mode trunk
 switchport trunk allowed vlan 17,99

interface FastEthernet0/5
 description TRUNK_TO_CP25
 switchport trunk encapsulation dot1q
 switchport mode trunk
 switchport trunk allowed vlan 25,99

! === STEP 4: Enable OSPF ===
router ospf 1
 network 192.168.3.0 0.0.0.255 area 0
 network 192.168.6.0 0.0.0.255 area 0
 network 192.168.8.0 0.0.0.255 area 0
 network 192.168.12.0 0.0.0.255 area 0
 network 192.168.17.0 0.0.0.255 area 0
 network 192.168.25.0 0.0.0.255 area 0
 network 192.168.99.0 0.0.0.255 area 0

end
write memory
