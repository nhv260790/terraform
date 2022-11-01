# Create Database Subnet Group
# terraform aws db subnet group
resource "aws_db_subnet_group" "database-subnet-group" {
  name        = "database subnets"
  subnet_ids  = module.vpc.private_subnets
  description = "Subnets for Database Instance"

  tags = {
    Name = "Database Subnets"
  }
}


# Create Database Instance Restored from DB Snapshots
# terraform aws db instance
resource "aws_db_instance" "database-instance" {
  instance_class      = var.database-instance-class
  skip_final_snapshot = true
  availability_zone   = module.vpc.azs[0]
  identifier          = var.database-instance-identifier
  #   snapshot_identifier     = data.aws_db_snapshot.latest-db-snapshot.id
  db_subnet_group_name   = aws_db_subnet_group.database-subnet-group.name
  multi_az               = var.multi-az-deployment
  vpc_security_group_ids = [aws_security_group.private_security_group_for_rds.id]
  allocated_storage      = var.dbstorage
  storage_type           = var.storage_type
  db_name                = var.db_name
  engine                 = var.engine
  engine_version         = var.engine_version
  port                   = var.db_port
  username               = "admin"
  password               = "Passw0rd!123"
  publicly_accessible    = false


  tags = {
    Name = "RDS_MySQL"
  }
}
