resource "aws_dynamodb_table" "cart" {
  name           = var.table_name
  billing_mode   = var.billing_mode
  hash_key       = "userId"
  range_key      = "productId"

  attribute {
    name = "userId"
    type = "S"
  }

  attribute {
    name = "productId"
    type = "S"
  }

  ttl {
    attribute_name = "ttl"
    enabled        = true
  }

  tags = var.tags
}