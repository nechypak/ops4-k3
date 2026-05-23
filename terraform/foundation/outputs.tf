output "aws_account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "ecr_repository_name" {
  value = aws_ecr_repository.minecraft.name
}

output "ecr_repository_url" {
  value = aws_ecr_repository.minecraft.repository_url
}

output "backup_bucket_name" {
  value = aws_s3_bucket.minecraft_backups.bucket
}
