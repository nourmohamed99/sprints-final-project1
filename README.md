# sprints-final-project1

Sprints Final Project
# Setting up Jenkins with Terraform, Ansible, AWS, and GitHub

This guide outlines the steps to set up Jenkins for continuous integration and deployment using Terraform, Ansible, AWS, and GitHub. Follow these instructions to get your environment up and running.

After cloning the repo

## Step 1: Intialize Infrastructure:

1. Initialize Terraform:
```shell
terraform init
```
2. Plan and review the infrastructure changes:
 
```shell
terraform plan -input=false
```
3. Apply the infrastructure changes:
   
```shell
terraform apply -input=false -auto-approve
```
## Step 2: Install Tools using ansible

1. Run Ansible-playbook to install Docker, AWS CLI, Kubernetes tools, and Jenkins.
   change the inventory files in terraform and ansible folder with the ip of your instance.
   make sure to run this command inside the ansible folder.
   
```shell
ansible-playbook docker.yml -i inventory.txt
```
```shell
ansible-playbook kubectl.yml -i inventory.txt
```
```shell
ansible-playbook awscli.yml -i inventory.txt
```
```shell
ansible-playbook jenkins.yml -i inventory.txt
```

## Step 3: Jenkins Configuration 

1. Open browser and put the public-ip:8080 in it

2. Connect to your instnace then retrieve the initial admin password

```shell
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```
3.Install suggested plugins then create a Jenkins  account:


## Step 4: Add Credentials:

1. To create jenkins credentials we acess Jenkins > manage Jenkins > credentials > system > global credentials 
   add aws credentials and github credentials (using git hub token)


## Step 5: Add GitHub Webhook:

In your GitHub repository, go to Settings > Webhooks > Add webhook.

1. public-ip:8080/github-webhook/
2. Change Content type to application/json
3. add access to everything


## Step 6: Configure Jenkins Pipeline

1.Create a Multibranch Pipeline in Jenkins
2. add github-url and credentials and jenkins file path.


## Step 7: Run the Pipeline
Commit and push changes to your GitHub repository.
Jenkins will automatically trigger the pipeline on new commits and perform the defined actions.

   
