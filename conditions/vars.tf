variable "ami_id" {
    default = "ami-0220d79f3f480ecf5"
}

variable "cidr_block" {
    default = ["0.0.0.0/0"]
}

variable "env" {
    default = "prod"
}