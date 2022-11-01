output "nhv2607_elb" {
  description = "The DNS name of the ELB"
  value       = module.alb.lb_dns_name
}

output "db_instance_endpoint" {
  description = "The connection endpoint"
  value       = aws_db_instance.database-instance.address
}

output "s3_website_endpoint" {
  description = "The s3 website endpoint"
  value       = aws_s3_bucket.my-bucket.bucket_domain_name
}

output "cloudfront_link" {
  description = "The cloudfront link"
  value       = "${resource.aws_cloudfront_distribution.s3_distribution.domain_name}"
}
