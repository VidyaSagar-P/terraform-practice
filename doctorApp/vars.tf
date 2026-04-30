# variable "ami_id" {
#     default = "ami-0220d79f3f480ecf5"
# }

variable "cidr_block" {
    default = ["0.0.0.0/0"]
}

variable "instance_type" {
    default = "t3.small"
}

variable "instance_names" {
    default = [ "mysql", "backend", "frontend" ]
}

variable "common_tags" {
    default = {
        project = "doctorAppointment"
        env = "dev"

    }
}
variable "env" {
    default = "prod"
}

variable "zone_id" {
    default = "Z09356231G2QVZQIFGTG9"
}

variable "domain_name" {
    default = "bavs.space"
}