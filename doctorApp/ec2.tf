resource "aws_instance" "terraform" {
    count = length(var.instance_names)
    ami           = data.aws_ami.joindevops.id
    instance_type = local.instance_type
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

    tags = merge(
        var.common_tags,
        {
            Name = var.instance_names[count.index]
        }
    )
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
    Name = "allow_ssh_1"
    }
}

