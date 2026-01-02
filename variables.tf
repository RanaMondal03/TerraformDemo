variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the EC2 key pair "
  default = "terraform_cicd_pem"
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket for remote state test"
  default = "terraform-artifacts-bucket-3"
}

variable "name" {
  description = "Name of EC2 Intance"
}