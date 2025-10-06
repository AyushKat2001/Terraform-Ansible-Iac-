variable "aws_region" {
    description = "Region to deploy the infrastructure"
    default = "ap-south-1"
  
}
variable "aws_instance_type" {
    default = "t2.micro"
  
}
variable "key_name" {
    type = string
  
}
variable "key_path" {
    type = string
  
}
variable "ami_id" {
    type = string
  
}