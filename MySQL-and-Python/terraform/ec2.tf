data "aws_ami" "ubuntu" {

    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"]
}

resource "aws_instance" "ec2" {
  ami = data.aws_ami.ubuntu.id
  key_name = "sprints-key"
  instance_type = "t2.large"
  tags = {
    Name = "sprints-project"
  }
  #vpc_id = aws_vpc.myvpc.id
  subnet_id = aws_subnet.subnet_1.id
  vpc_security_group_ids = [aws_security_group.websg.id]
  associate_public_ip_address = true
  #user_data = "${file("script.sh")}"

}

resource "null_resource" "write_ip_to_file" {
  provisioner "local-exec" {
    command = "echo 'ec2 ansible_host=${aws_instance.ec2.public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=./sprints-key.pem' >> inventory.txt"
  }
  depends_on = [aws_instance.ec2]
}