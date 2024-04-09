resource "aws_key_pair" "School" {
  key_name   = "Bastion"
  public_key = file("~/.ssh/id_rsa.pub")
}