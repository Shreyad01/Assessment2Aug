
variable "vpc_cidr" {
  description = "vpc cidr and the ip"
  type        = string
}

variable "pub_subnet_cidr" {
  description = "cidr and ip address for subnet"
  type = string
}

variable "private_subnet1_cidr" {
  description = "cidr and ip address for subnet"
  type = string
}

variable "private_subnet2_cidr" {
  description = "cidr and ip address for subnet"
  type = string
}