resource "aws_db_subnet_group" "this" {
  name       = "${var.project}-${var.environment}-rds-subnet-group"
  subnet_ids = var.private_subnet_ids
  tags = {
    Name = "${var.project}-${var.environment}-rds-subnet-group"
  }
}

resource "aws_rds_cluster" "this" {
  cluster_identifier      = "${var.project}-${var.environment}-aurora-cluster"
  engine                  = "aurora-postgresql"
  engine_mode             = "provisioned"
  engine_version          = "15.4"
  database_name           = var.db_name
  master_username         = var.master_username
  master_password         = var.master_password
  db_subnet_group_name    = aws_db_subnet_group.this.name
  vpc_security_group_ids  = [var.security_group_id]
  skip_final_snapshot     = true
  storage_encrypted       = true
  backup_retention_period = 7
  tags = {
    Environment = var.environment
    Project     = var.project
  }
}

resource "aws_rds_cluster_instance" "writer" {
  identifier              = "${var.project}-${var.environment}-aurora-writer"
  cluster_identifier      = aws_rds_cluster.this.id
  instance_class          = var.instance_class
  engine                  = aws_rds_cluster.this.engine
  engine_version          = aws_rds_cluster.this.engine_version
  publicly_accessible     = false
  db_subnet_group_name    = aws_db_subnet_group.this.name
  tags = {
    Role        = "writer"
    Environment = var.environment
  }
}

resource "aws_rds_cluster_instance" "reader" {
  identifier              = "${var.project}-${var.environment}-aurora-reader"
  cluster_identifier      = aws_rds_cluster.this.id
  instance_class          = var.instance_class
  engine                  = aws_rds_cluster.this.engine
  engine_version          = aws_rds_cluster.this.engine_version
  publicly_accessible     = false
  db_subnet_group_name    = aws_db_subnet_group.this.name
  tags = {
    Role        = "reader"
    Environment = var.environment
  }
}