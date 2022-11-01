data "aws_route53_zone" "hosted_zone"{
    name = var.domain_name
}

resource "aws_route53_record" "nhv2607_alb_record" {
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = var.record_alb_name
  type    = "A"
  # ttl     = 300

  alias {
    name = module.alb.lb_dns_name
    zone_id = module.alb.lb_zone_id
    evaluate_target_health = true
  }
}

# resource "aws_route53_record" "nhv2607_s3_record" {
#   zone_id = data.aws_route53_zone.hosted_zone.zone_id
#   name    = var.domain_name
#   type    = "A"
#   # ttl     = 300

#   alias {
#     name                   = aws_s3_bucket.my-bucket.bucket_domain_name
#     zone_id                = aws_s3_bucket.my-bucket.hosted_zone_id
#     evaluate_target_health = true
#   }
# }

resource "aws_route53_record" "rds_database" {
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name = var.rds_database_name
  type = "CNAME"
  ttl = "300"
  records = ["${aws_db_instance.database-instance.address}"]
}

resource "aws_route53_record" "nhv2607_cf_record" {
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = var.cf_record_name
  type    = "A"
  # ttl     = 300

  alias {
    name                   = resource.aws_cloudfront_distribution.s3_distribution.domain_name
    zone_id                = aws_s3_bucket.my-bucket.hosted_zone_id
    evaluate_target_health = false
  }
}