resource "aws_instance" "terraform" {
    for_each = var.instance_types
    ami           = data.aws_ami.joindevops.id
    instance_type = each.value
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

    tags = {
        Name = each.key
    }

}


resource "aws_security_group" "allow_ssh_terraform" {
    name = "allow_ssh_1"
    description = "allow ssh to terraform"

    dynamic "ingress" {
        for_each = var.inbound_rules
        content {
        from_port        = ingress.value.from_port
        to_port          = ingress.value.to_port
        protocol         = ingress.value["protocol"]
        cidr_blocks      = ingress.value["cidr_blocks"]
        }
    }

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

    tags = {
    Name = "allow_ssh_1"
    }
}

