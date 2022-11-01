module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "nhv2607-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["ap-southeast-1a", "ap-southeast-1b"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]

  # enable_nat_gateway = true
  # enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "test"
  }
}




resource "aws_instance" "instance01" {
  subnet_id     = module.vpc.public_subnets[0]
  ami           = data.aws_ami.ubuntu.id
  key_name      = "keyForLaravelApp"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.public_security_group_80.id]
  # security_groups = [aws_security_group.public_security_group_80.id]
  user_data = "${file("user_data.sh")}"
  private_ip = var.private_ip[0]

  tags = {
    Name = "Laravel_App_01"
  }
}

resource "aws_instance" "instance02" {
  subnet_id     = module.vpc.public_subnets[1]
  ami           = data.aws_ami.ubuntu.id
  key_name      = "keyForLaravelApp"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.public_security_group_80.id]
  # security_groups = [aws_security_group.public_security_group_80.id]
  user_data = "${file("user_data.sh")}"
  private_ip = var.private_ip[1]
 
  tags = {
    Name = "Laravel_App_02"
  }
}