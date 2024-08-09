variable "region" {
  default = "us-east-1"
}

variable "ami" {
  default = "ami-04a81a99f5ec58529"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "key-pair for ngnix"
}

variable "vpc_id" {
  default = "vpc-04c7c9f3da80795d3" # Replace with your default VPC ID if necessary
}

variable "aws_access_key" {
  description = "AWS access key"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
  sensitive   = true
}