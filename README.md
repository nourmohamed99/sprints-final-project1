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
3. Apply the infrastructure:
   
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
3.Install suggested plugins then create a Jenkins  account.


## Step 4: Add Credentials:

1. To create jenkins credentials we acess Jenkins > manage Jenkins > credentials > system > global credentials 
   add aws credentials and github credentials (using git hub token)
   make sure to name id with: (aws-sprints) as i am using that name in jenkins file


## Step 5: Add GitHub Webhook:

In your GitHub repository, go to Settings > Webhooks > Add webhook.

1. public-ip:8080/github-webhook/
2. Change Content type to application/json
3. add access to everything


## Step 6: Configure Jenkins Pipeline

1.Create a Multibranch Pipeline in Jenkins
2. add github-url and credentials and jenkins file path. and make sure that the discover all brances strategy is set to all branches and all branches have the same properties.also the jenkinspath will be MySQL-and-Python/Jenkinsfile

## Step 7: Configure Jenkins Pipeline

1.in the ec2 terminal run 
```shell
sudo chmod 666 /var/run/docker.sock
```
2. then restart docker
```shell
sudo systemctl restart docker
```
3. run and add aws credentials to ec2-machine add key-id and access-key
```shell
aws configure
```
4. run
```shell
aws eks --region us-east-1 update-kubeconfig --name my-eks-cluster
```

## Step 8: Run the Pipeline
Commit and push changes to your GitHub repository.
Jenkins will automatically trigger the pipeline on new commits and perform the defined actions.


## step 9: make sure pods are running
```shell
kubectl get all
```
![kubectlgetall](https://github.com/nourmohamed99/sprints-final-project1/assets/88977873/b74d253f-e046-4789-a2fe-759c822d86ce)

## step 10: check website running
after running kubectl get all copy the EXTERNAL-IP of the my-app-service service and put it in the web browser it should open the website.

## output 
![pipeline](https://github.com/nourmohamed99/sprints-final-project1/assets/88977873/b06b2727-3e15-4e66-aa90-f2bba1343f11)


![app1](https://github.com/nourmohamed99/sprints-final-project1/assets/88977873/c1173680-dc14-4a17-a2ab-18c49ad5c640)


   ![app2](https://github.com/nourmohamed99/sprints-final-project1/assets/88977873/dd9c36be-7423-49d7-acc9-0cd5cc5b93de)

![app3](https://github.com/nourmohamed99/sprints-final-project1/assets/88977873/1924d13d-edbb-49ed-9579-8c09bfa6d139)
![signin1](https://github.com/nourmohamed99/sprints-final-project1/assets/88977873/01572bdc-2a4f-4451-8e2a-1d06721e7412)
![app4](https://github.com/nourmohamed99/sprints-final-project1/assets/88977873/0603ff00-6d94-430a-b05c-0db7d279a721)
