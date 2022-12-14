variable "env" {
  type    = string
  default = "ssandbox-2"
}

variable "cidr_range" {
  type    = string
  default = "10.100.0.0/16"
}

variable "availibility_zone" {
  type    = list(string)
  default = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.50.51.0/24", "10.50.52.0/24", "10.50.53.0/24"]
}

variable "private_subnets" {
  type    = list(string)
  default = ["10.50.61.0/24", "10.50.62.0/24", "10.50.63.0/24"]
}

