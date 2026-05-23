output "k3s_public_ip" {
  value = aws_instance.k3s.public_ip
}

output "k3s_public_dns" {
  value = aws_instance.k3s.public_dns
}

output "ssh_command" {
  value = "ssh -i ~/Downloads/cs312-key.pem ubuntu@${aws_instance.k3s.public_ip}"
}

output "ansible_inventory_line" {
  value = "ops4-k3s ansible_host=${aws_instance.k3s.public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/Downloads/cs312-key.pem"
}
