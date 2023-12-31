# Jenkins Instance 생성
resource "aws_instance" "project02-jenkins" {
  ami                         = data.aws_ami.ubuntu.image_id
  instance_type               = "t3.large"
  key_name                    = "project02-key"
  vpc_security_group_ids      = [data.terraform_remote_state.project02-security.outputs.web-security, data.terraform_remote_state.project02-security.outputs.ssh-security]
  subnet_id                   = data.terraform_remote_state.project02-vpc.outputs.private-subnet2a
  associate_public_ip_address = false

  tags = {
    Name = "project02-jenkins-instance"
  }
}
