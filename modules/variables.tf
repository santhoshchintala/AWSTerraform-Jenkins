
## s3 variables
#variable "bucket" {
#type = string
#}

variable "bucket" {
  type = map(object({
    bucket_name = string
  }))

}


## iam variables
variable "role_name" {
  type = string

}


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
