resource "aws_dynamodb_table" "user_sessions" {
  name         = "user_sessions"
  hash_key     = "uid"
  billing_mode = "PROVISIONED"

  attribute {
    name = "uid"
    type = "N"
  }

  point_in_time_recovery {
    enabled = true
  }
}

resource "aws_dynamodb_table_item" "user_sessions" {
  table_name = aws_dynamodb_table.user_sessions.name
  hash_key   = aws_dynamodb_table.user_sessions.hash_key

  item = <<ITEM
{
  "uid": {"N": "123"},
  "auth": {"S": "abcabcabc"}
}
ITEM
}
