# Variables
variable "mykey" {
  type    = string
  default = "Frankfurt"
}

variable "region" {
  type    = string
  default = "eu-central-1"
}

variable "first_zone" {
  type    = string
  default = "eu-central-1a"
}

variable "second_zone" {
  type    = string
  default = "eu-central-1b"
}

variable "image_id" {
  type    = string
  default = "ami-0c9354388bb36c088"
}

variable "instance_type" {
  type    = string
  default = "t2.large"
}

variable "cidrVPC" {
  type    = string
  default = "10.0.0.0/20"
}

variable "cidr1" {
  type    = string
  default = "10.0.0.0/26"
}

variable "cidr2" {
  type    = string
  default = "10.0.1.0/26"
}

variable "cidrRT" {
  type    = string
  default = "0.0.0.0/0"
}

variable "domain_name" {
  type    = string
  default = "sergeyulikhanyan.link."
}