# VARIABLES

variable "mykey" {
  type    = string
  default = "Frankfurt"
}

variable "owner" {
  description = "Infrastructure Owner"
  default     = "Sergey Ulikhanyan"
}

variable "vpc_cidr" {
  description = "CIDR for the whole VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_1_cidr" {
  description = "CIDR for the Subnet 1"
  default     = "10.0.1.0/24"
}

variable "subnet_2_cidr" {
  description = "CIDR for the Subnet 2"
  default     = "10.0.2.0/24"
}