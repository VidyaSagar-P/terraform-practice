resource "aws_instance" "terraform" {

    ami           = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

    tags = {
        Name = "terraform"
    }

}

resource "aws_security_group" "allow_ssh_terraform" {
    name = "allow_ssh_1"
    description = "allow ssh to terraform"

    ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.cidr_block
    ipv6_cidr_blocks = ["::/0"]
    }

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.cidr_block
    ipv6_cidr_blocks = ["::/0"]
  }

    tags = {
    Name = "allow_tls"
    }
}

