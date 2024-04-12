provider aws {
     region = "us-east-1"
}

resource "aws_key_pair" "deployer" {
  key_name   = "Bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_s3_bucket" "example1" {
  bucket = "kaizen-ilias"

}
resource "aws_s3_bucket" "example2" {
  bucket_prefix = "kaizen"

}
resource "aws_s3_bucket" "example3" {
  bucket = "kyrgyz123"
}

resource "aws_s3_bucket" "example4" {
  bucket = "bishkek123"
}
#terraform import aws_s3_bucket.exaple3 kyrgyz123
#terraform import aws_s3_bucket.exaple4 bishkek123

