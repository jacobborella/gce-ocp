#!/bin/bash
ansible-playbook docker-setup.yml
ansible-playbook /usr/share/ansible/openshift-ansible/playbooks/prerequisites.yml
ansible-playbook /usr/share/ansible/openshift-ansible/playbooks/deploy_cluster.yml
