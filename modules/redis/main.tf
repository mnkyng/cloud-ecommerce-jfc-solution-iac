resource "aws_elasticache_subnet_group" "redis" {
  name       = var.name
  subnet_ids = var.subnet_ids
}

resource "aws_elasticache_cluster" "redis" {
  cluster_id           = var.name
  engine               = "redis"
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  parameter_group_name = var.parameter_group_name
  port                 = var.port
  subnet_group_name    = aws_elasticache_subnet_group.redis.name
  security_group_ids   = var.security_group_ids
  tags                 = var.tags
}
