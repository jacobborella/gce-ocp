#Install OpenShift on gce, using Ansible

Ansible playbook for installing OpenShift 3.10 on Google Cloud Platform. There are some prerequisites to be met:
* Install Ansible 3.6
* Set the following variables in your env
** RH_USER=*rh username*
** RH_PASSWORD=*rh password*
** RH_POOL_ID=*id for sub you want to use*
* Generate ssh private/public key pair (optional)
* Create a project and a service account user on gcp (to be automated)

Once above tasks has been done, you can start configuring the file *group_vars/all/vars.yml* to meet your needs. There are the following variables:

|Var name|Description|Default|
|--------|-----------|-------|
|masters|List with names you want for your master nodes|[master-1 master-2 master-3]|
|infra_nodes|List with names for your infra nodes|[infra-1 infra-2]|
|app_nodes|List with names for your app nodes|[node-1 node-2]|
|cns_nodes|List with names for your cns nodes. At least tree must be provided|[cns-1 cns-2 cns-3]|
|service_account_email|The email for the service account you have associated with your GCP project|N/A (must provide your own value)|
|credentials_file|The credentials file for your service account|N/A (must provide your own value|
|project_id|The project-id for the project to use on gce account|N/A (must provide your own|
|region|The region in which you want to install OCP|europe-west3|
|zone|The zone in which you want to install OCP|europe-west3-b|
|bastion_tag|The network tag to apply to bastion vm instances|{{ project_id }}-bastion|
|master_tag|The network tag to apply to master vm instances|{{ project_id }}-master|
|infra_tag|The network tag to apply to infra vm instances|{{ project_id }}-infra|
|node_tag|The network tag to apply to all nodes in the network|{{ project_id }}-node|
|cns_tag|The network tag to apply to all cns vm instances|{{ project_id }}-cns|
|machine_image|The name for your machine image, which will get created as part of the installation and stored on GCP|rhel-image-v1|
|cluster_network_name|The name of the VPC network created on GCP|{{ project_id }}-net|
|cluster_subnetwork_name|The name of the subnetwork|{{ project_id }}-subnet|
|cluster_network_cidr|The IP range of the network created|10.240.0.0/24|
|rh_username|The username for registering the machines with Red Hat Subscription Manager|N/A|
|rh_password|The password for your Red Hat account|N/A|
|rh_poolid|The poolid with the subscriptions for OCP|N/A|
|public_key_location|The location of your public key to use ssh between machines in the network|N/A|
|private_key_location|The location of your private key to use between machines in the network|N/A|
|remote_linux_user|The user on the remote machines to use.|jacobborella|

run
```
ansible-playbook create-image.yml
ansible-playbook site.yml
```
then sign in to the bastion host and run *install.sh*.


Note:
* If you enable logging, you'll need big infra machines. Logging alone require 16+ G of memory
