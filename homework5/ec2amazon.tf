data "aws_ami" "amzn2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.20240329.0-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"]
}

resource "aws_instance" "web2" {
  instance_type               = var.instance_type1[1].ins_type
  ami                         = data.aws_ami.amzn2.id
  subnet_id                   = aws_subnet.pub1.id
  vpc_security_group_ids      = [aws_security_group.allow_tls.id]
  user_data                   = file("amazonapache.sh")
  user_data_replace_on_change = true
  tags                        = local.common_tags1
}
output "Amazon" {
  value = aws_instance.web2.public_ip

}