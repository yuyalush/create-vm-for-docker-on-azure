# Create VM for Docker on Azure

1. create Resource Group
2. create Linux VM by default
3. Get Public Ip address from VM and create hosts
4. Install Docker CE by Ansible

## if you use this script

Plese set your value.

- createvm.sh
  - group: Resource Group Name
  - vm: VM name
  - location: Azure Region name

## Caution

This scripts use only Ubuntu 16.04 LTS.
