variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "environment" {
  description = "Deployment environment name"
  type        = string
}