
## vpc variables
variable "cidr" {
  type = string
}

variable "vpc_name" {
  type = string
}

##subnet variables
variable "public_subnet_cidr" {
  type = string
}

variable "public_subnet_name" {
  type = string
}
