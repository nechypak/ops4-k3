provider "aws" {
  region = var.aws_region
}

data "aws_caller_identity" "current" {}

resource "aws_ecr_repository" "minecraft" {
  name                 = var.ecr_repository_name
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Course     = "CS312"
    Assignment = "Ops4"
    ManagedBy  = "Terraform"
  }
}

resource "aws_s3_bucket" "minecraft_backups" {
  bucket        = var.backup_bucket_name
  force_destroy = true

  tags = {
    Course     = "CS312"
    Assignment = "Ops4"
    ManagedBy  = "Terraform"
  }
}

resource "aws_s3_bucket_public_access_block" "minecraft_backups" {
  bucket                  = aws_s3_bucket.minecraft_backups.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "minecraft_backups" {
  bucket = aws_s3_bucket.minecraft_backups.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "minecraft_backups" {
  bucket = aws_s3_bucket.minecraft_backups.id

  rule {
    id     = "expire-old-minecraft-backups"
    status = "Enabled"

    filter {
      prefix = "minecraft/"
    }

    expiration {
      days = var.backup_expiration_days
    }

    noncurrent_version_expiration {
      noncurrent_days = var.backup_expiration_days
    }
  }
}
