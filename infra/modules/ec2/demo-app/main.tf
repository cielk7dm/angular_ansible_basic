resource "aws_instance" "main" {
  ami           = data.aws_ami.amazon.id
  instance_type = "t2.micro"
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.main.id]
  associate_public_ip_address = true
  subnet_id = var.vpc_subnet_id
  iam_instance_profile = "SSM_Managed_Instance_Core"

  tags = {
    Name = "demo-app-ansible"
  }
}

resource "aws_security_group" "main" {
  name = "${var.env}-${var.account_name}-sg"
  description = "Allow traffic for demo-app"
  vpc_id = var.vpc_id
  ingress {
    description = "Allow traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow traffic"
    from_port   = 4200
    to_port     = 4200
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.env}-${var.account_name}-sg"
  }
}
