variable "az" {
  type = list(string)
  default = [ "us-east-1a", "us-east-1b", "us-east-1c" ]
}

variable "public-cidr" {
  type = list(string)
  default = [ "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24" ]
}

variable "private-cidr" {
  type = list(string)
  default = [ "10.0.10.0/24","10.0.20.0/24", "10.0.30.0/24" ]
}

variable "cidr-range" {
  type = string
}