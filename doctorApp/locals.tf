locals {
  instance_type = var.env == "dev" ? "t3.micro" : "t3.large"
}
