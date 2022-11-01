variable "region" {
  description = "Default region"
  type        = string
  default     = "ap-southeast-1"
}

variable "ami_id" {
  description = "ami id"
  type        = string
  default     = "ami-07651f0c4c315a529"
}

variable "private_ip" {
  description = "This is private ip for instances"
  type = list(string)
  default = ["10.0.1.11", "10.0.2.22", "10.0.3.33", "10.0.4.44"]
}

variable "database-instance-identifier" {
  description = "This is database-instance-identifier"
  type = string
  default = "nhv2607-database"
}

variable "database-instance-class" {
  description = "This is database-instance-class"
  type = string
  default = "db.t2.micro"
}

variable "multi-az-deployment" {
  description = "This is multi-az-deployment"
  type = bool
  default = false
}

variable "dbstorage" {
  description = "This is dbstorage"
  type = number
  default = 20
}

variable "storage_type" {
  description = "This is dbstorage"
  type = string
  default = "gp2"
}
variable "engine_version" {
  description = "This is engine_version"
  type = string
  default = "8.0.27"
}

variable "cidr_blocks" {
  description = "This is cidr_blocks"
  type = string
  default = "10.0.0.0/16"
}

variable "engine" {
  description = "This is engine"
  type = string
  default = "mysql"
}

variable "db_name" {
  default     = "laravel_db"
  description = "db name"
}

variable "db_port" {
  default     = 3306
  description = "db port"
  type = number
}

variable "username" {
  default     = "admin"
  description = "db username"
  type = string
}

variable "password" {
  default     = "Passw0rd!123"
  description = "db password"
  type = string
}

variable "domain_name" {
  default     = "lacoste-chinh-hang.co.uk"
  description = "domain name"
  type = string
}

variable "record_alb_name" {
  default     = "nhv2607-alb"
  description = "alb name"
  type = string
}


variable "domainName" {
  default = "lacoste-chinh-hang.co.uk"
  type    = string
}

variable "bucketName" {
  default = "nhv2607-s3-bucket-lacoste-chinh-hang.co.uk"
  type    = string
}

variable "rds_database_name" {
  default = "nhv2607-rds-db.lacoste-chinh-hang.co.uk"
  type    = string
}

variable "acm_certificate_arn" {
  default = "arn:aws:acm:us-east-1:816244034855:certificate/6dd0667f-7306-412b-91b4-71ae546409e6"
  type    = string
}

variable "alternate_domain_name_for_cloudfront" {
  default = "nhv2607-cloudfront.lacoste-chinh-hang.co.uk"
  type    = string
}

variable "cf_record_name" {
  default = "nhv2607-cloudfront.lacoste-chinh-hang.co.uk"
  type    = string
}