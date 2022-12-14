resource "aws_instance" "front_end_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = module.vpc.private_subnets[0]
  key_name      = var.key_pair
  ebs_block_device {
    delete_on_termination = true
    device_name           = "${var.env}-ebs"
    volume_size           = var.vol_size
  }
  security_groups = [aws_security_group.instance_sg.id]
}

resource "aws_security_group" "instance_sg" {
  name        = "${var.env}-sg"
  description = "Security group for instance"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_security_group_rule" "ingress_443" {
  security_group_id        = aws_security_group.instance_sg
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  type                     = "ingress"
  source_security_group_id = aws_security_group.lb_sg.id
}