variable "aws_region" {
  description = "AWS Academy region."
  type        = string
  default     = "us-east-1"
}

variable "key_name" {
  description = "Existing EC2 key pair name, not the .pem file name."
  type        = string
  default     = "cs312-key"
}

variable "admin_cidr_blocks" {
  description = "Your public IP /32 for SSH."
  type        = list(string)
}

variable "minecraft_cidr_blocks" {
  description = "Who can reach Minecraft TCP/25565."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "instance_type" {
  description = "k3s plus Minecraft needs more than a tiny instance."
  type        = string
  default     = "t3.medium"
}

variable "root_volume_size_gb" {
  description = "Root disk size for k3s, images, and local PV data."
  type        = number
  default     = 40
}

variable "iam_instance_profile" {
  description = "Pre-existing AWS Academy instance profile."
  type        = string
  default     = "LabInstanceProfile"
}
