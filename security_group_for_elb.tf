resource "aws_security_group" "security_group_for_elb" {
  vpc_id = module.vpc.vpc_id
  name = "nhv2607_security_group_for_elb"
  description = "This is private security group for ELB port 80"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Security group for ELB"
  }
}