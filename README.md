# aws-zabbix

## Table of Contents
- [What does it do ?](https://github.com/groorj/aws-zabbix#what-does-it-do)
- [This project uses](https://github.com/groorj/aws-zabbix#this-project-uses)
- [Get started](https://github.com/groorj/aws-zabbix#get-started)
- [Clean up](https://github.com/groorj/aws-zabbix#clean-up)
- [Notes](https://github.com/groorj/aws-zabbix#notes)

## What does it do

In this repo you will find Terraform code to create a VPC and an EC2 instance to run a [Zabbix](https://zabbix.org/) Server instance. The user-data script will download and install the desired Zabbix version and it's dependecies.

At the end of the creation of the VPC and EC2 instance you will be able to access the HTTP interface using the EIP associated with the instance to finish your Zabbix configuration.

## This project uses

- AWS VPC, IGW, EC2, EIP
- Terraform
- Linux Ubuntu
- Zabbix version 5.0
- MySQL server
- Apache server

## Get started

You will need Terraform so if you don't have it yet download from [terraform.io](https://www.terraform.io/downloads.html).

Make changes to the following files

Lines to change:

| Filename | Line | Notes |
| ------------- |:-------------:|:-----|
| provider.tf | `profile = "<YOUR_AWS_PROFILE_NAME>"` | Replace `<YOUR_AWS_PROFILE_NAME>` with your AWS [profile name](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html). |
| provider.tf | `region  = "<YOUR_AWS_REGION>"` | Replace `<YOUR_AWS_REGION>` with you bucket region. |
| provider.tf | `bucket  = "<YOUR_BUCKET_NAME>"` | Replace `<YOUR_BUCKET_NAME>` with you bucket name. |
| variables.tf | `default = "<YOUR_AWS_REGION>"` | Replace `<YOUR_AWS_REGION>`with the region you want to run your resources. |
| variables.tf | `default = "<YOUR_UBUNTU_AMI_ID>"` | Replace `<YOUR_UBUNTU_AMI_ID>` with the AMI ID of the Ubuntu image of the chosen region. |
| variables.tf | `default = "<YOUR_SSH_KEY_NAME>"` | Replace `<YOUR_SSH_KEY_NAME>` with the name you want to give to your ssh key. |
| variables.tf | `default = "<YOUR_SSH_FILENAME>"` | Replace `<YOUR_SSH_FILENAME>` with the SSH public file you will use to access your instance. This file must be place into the same folder as the Terraform code and the name must match. |
| variables.tf | `default     = ["<YOUR_IP>/32"]` | Replace `<YOUR_IP>` with your IP or any other IPs you would like to give access to Zabbix. The variable named `zabbix_access_allowed_ip_addresses` will give access to the Zabbix user interface while the variable `zabbix_service_allowed_ip_addresses` will allow the communication with the Zabbix server on port TCP 10050 and 10051. |
| user-data.sh | `ZABBIX_PKG_NAME="zabbix-release_5.0-1+bionic_all.deb"` | You can replace with the latest package version if you wish. |
| user-data.sh | `DB_USER="zabbix"` | Replace `zabbix` with your DB username. |
| user-data.sh | `DB_PASS="zabbix"` | Replace `zabbix` with your DB password. |
| user-data.sh | `DB_NAME="zabbix"` | The default is `zabbix`. Replace as appropriate. |


## How to use it

### Run the Terraform code
```bash
terraform init
terraform plan
terraform apply
```

**Result:**
```bash
Apply complete! Resources: 16 added, 0 changed, 0 destroyed.

Outputs:

zabbixserver-eip = 3.23.250.150
```

### Configure your Zabbix server
In your browser, access the IP address that was returned when you created the resources and follow the steps to finish your Zabix Server installation.

Example: `http://3.23.250.150`

## Clean up

- Destroy all the created AWS resources (including the Zabbix server):

```bash
terraform destroy
```

**Result:**
```bash
Destroy complete! Resources: 16 destroyed.
```

## Notes
Running this code will create AWS resources in your account that might not be included in the free tier.
Use this code at your own risk.