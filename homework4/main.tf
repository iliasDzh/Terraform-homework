
provider aws {
     region = var.region
}


  

resource "aws_instance" "web" {
 ami = var.ami_id
 instance_type = "t2.micro"
 key_name  = var.key_name
 vpc_security_group_ids      = [aws_security_group.allow_tls.id]
 availability_zone = var.availability_zone
 count = var.instance_count
}
variable ami_id {
  default = ""
  type = string
}
variable type {
  default = ""
  type = string
}

variable region {
  default = ""
  type = string
}
variable key_name {
  default = ""
  type = string
}
variable availability_zone {
  default = ""
  type = string
}

variable instance_count {
  default = ""
  type = string
}
variable ports {
  default = "22,80,443"
  type = list(number)
}


