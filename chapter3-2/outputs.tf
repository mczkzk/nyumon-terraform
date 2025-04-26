# AWS側で決定される値を出力

output "public_ip" {
  value = aws_eip.wordpress.public_ip
}

output "rds_endpoint" {
  value = aws_db_instance.wordpress.endpoint
}

output "rds_password" {
  value = random_password.wordpress.result
  sensitive = true
}
