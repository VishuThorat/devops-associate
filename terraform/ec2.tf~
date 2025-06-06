resource "aws_instance" "devops_ec2" {
  ami           = "ami-0731becbf832f281e"  # Amazon Linux 2 in us-east-1; change as per region
  instance_type = "t2.micro"

  tags = {
    Name = "DevOpsAssocInstance"
  }
}

output "public_ip" {
  value = aws_instance.devops_ec2.public_ip
}

