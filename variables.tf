variable my_aws_region {
  default = "<YOUR_AWS_REGION>" # example: us-east-1, sa-east-1
}

variable ec2_image_id {
  default = "<YOUR_UBUNTU_AMI_ID>" # ami-0a63f96e85105c6d3 Ubuntu Server 18.04 LTS (HVM), SSD Volume Type (us-east-2)
}

variable ec2_key_name {
  default = "<YOUR_SSH_KEY_NAME>"
}

variable ec2_key_filename {
  default = "<YOUR_SSH_FILENAME>" # example: my-ssh-key.pub
}

variable "my_ip_addresses" {
  description = "My allowed IP addresses"
  type        = list(string)
  default     = ["<YOUR_IP>/32"] # example: 200.1.2.3/32
}

variable "zabbix_access_allowed_ip_addresses" {
  description = "The IP addressess that are allowed to access my Zabbix service interface"
  type        = list(string)
  default     = ["<YOUR_IP>/32"] # example: 0.0.0.0/0
}

variable "zabbix_service_allowed_ip_addresses" {
  description = "The IP addressess that are allowed to send data to my Zabbix service"
  type        = list(string)
  default     = ["<YOUR_IP>/32"] # example: 0.0.0.0/0
}