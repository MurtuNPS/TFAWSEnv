# TFAWSEnv
build a network and vms in AWS

# Description
The script creates
1. VPC
2. optional dhcp option set
4. optional public subnet with IG
5. optional nat gateway with routes for internet access for private subnets
6. private subnets
7. vpc endpoints and ssm configuration
8. security groups and rules
9. optional peering connection
10. instances
11. iam role attached to ec2 instances
12. group and users who will have access to ec2 via ssm

# Pre-requisites
aws account and key pair 

# Usage
download folder and edit main.tf, terraform.tfvars, instances.csv and sg.csv as per your requirements.

you may edit windows-userdata.tpl and linux-userdata.tpl to edit user data for your instances if required, current userdata initiallizes the disks for windows and linux

run terraform init, validate, plan and apply
