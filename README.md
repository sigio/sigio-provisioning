sigio-provisioning
==================

Ansible provisioning playbooks for Sig-I/O ...

Requirements
------------

  - uses modules from ansible-provisioning (https://github.com/ansible-provisioning/ansible-provisioning)

Usage
-----

  - Edit hosts file to your needs
  - Run vmprepare playbook to setup kvm environment, required files for deployment system
  - Run vmdeploy playbook to actually deploy one or more VM's from deploy_centos or deploy_debian groups

