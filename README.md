#Install OpenShift on gce, using Ansible

Install Ansible 3.6

Set the following variables in your env
RH_USER=*rh username*
RH_PASSWORD=*rh password*
RH_POOL_ID=*id for sub you want to use*

run
```
ansible-playbook site.yml
```

Note: Not production ready, not even finalized ATM
