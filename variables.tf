variable "az" {
  type    = list(string)
}

variable "public-cidr" {
  type    = list(string)
}

variable "private-cidr" {
  type    = list(string)
}

variable "instance-type" {
  type    = string
}

variable "new-ami" {
  type    = string
}

variable "target" {
  type = number
}

variable "cidr" {
  type = string
}
