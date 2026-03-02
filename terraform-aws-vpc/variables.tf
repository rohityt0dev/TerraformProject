variable "instance_type" {
  description = "The type of EC2 instance to launch"
  type        = string
  default     = "t3.small"
}
variable "region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "ap-south-1"
}