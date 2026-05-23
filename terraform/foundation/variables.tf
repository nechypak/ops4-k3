variable "aws_region" {
  description = "AWS Academy region."
  type        = string
  default     = "us-east-1"
}

variable "ecr_repository_name" {
  description = "Long-lived ECR repo reused by Ops 4."
  type        = string
  default     = "ops4-k3-minecraft"
}

variable "backup_bucket_name" {
  description = "Globally unique S3 bucket for Minecraft world backups."
  type        = string
  default     = "ops4-minecraft-backup-kn"
}

variable "backup_expiration_days" {
  description = "Lifecycle expiration for old backup objects."
  type        = number
  default     = 7
}
