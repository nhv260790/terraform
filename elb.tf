module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  name = "my-alb"

  load_balancer_type = "application"

  vpc_id             = module.vpc.vpc_id
  subnets            = module.vpc.public_subnets
  security_groups    = ["${aws_security_group.security_group_for_elb.id}"]

    #   access_logs = {
    #     bucket = "my-alb-logs"
    #   }

  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      targets = {
        Laravel_App_01 = {
          target_id = "${aws_instance.instance01.id}"
          port = 80
        }
        Laravel_App_02 = {
          target_id = "${aws_instance.instance02.id}"
          port = 80
        }
      }
    }
  ]

#   health_check {
#     path                = "/"
#     protocol            = "HTTP"
#     matcher             = "200"
#     interval            = 6
#     timeout             = 3
#     healthy_threshold   = 2
#     unhealthy_threshold = 2
#   }

    #   https_listeners = [
    #     {
    #       port               = 443
    #       protocol           = "HTTPS"
    #       certificate_arn    = "arn:aws:iam::123456789012:server-certificate/test_cert-123456789012"
    #       target_group_index = 0
    #     }
    #   ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    Environment = "ELB for nhv2607 vpc"
  }
}