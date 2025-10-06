resource "aws_key_pair" "deployer" {
    key_name = var.key_name
    public_key = file(var.key_path)
  
}
resource "aws_security_group" "web_sg" {
    name = "web_sg"
    description = "Allow HTTP and SSH"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
resource "aws_instance" "web" {
    ami = var.ami_id
    instance_type = var.aws_instance_type
    key_name = var.key_name
    vpc_security_group_ids = [aws_security_group.web_sg.id]

    tags = {
        name = "Terraform-Ansible"
    }
    provisioner "local-exec" {
        command = <<EOT
                echo [web] > ../ansible/inventory.ini
                echo ${self.public_ip} ansible_user=ec2-user ansible_ssh_private_key_file=private_key_path
                EOT
    }
}