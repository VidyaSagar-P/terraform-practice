variable "instance_types" {
  default = {
    mysql = "t3.small"
    backend = "t3.micro"
    frontend = "t3.micro"
  }
}

variable "zone_id" {
  default = "Z09356231G2QVZQIFGTG9"
}

variable "domain_name" {
  default = "bavs.space"
}