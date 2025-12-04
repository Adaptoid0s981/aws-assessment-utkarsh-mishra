resource "aws_lb" "utkarsh_mishra_alb" {
  name               = "utkarsh-mishra-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.utkarsh_mishra_alb_sg.id]
  subnets            = aws_subnet.utkarsh_mishra_public_subnet[*].id

  tags = {
    Name = "utkarsh_mishra_alb"
  }
}

resource "aws_lb_target_group" "utkarsh_mishra_tg" {
  name     = "utkarsh-mishra-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.utkarsh_mishra_vpc.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "utkarsh_mishra_tg"
  }
}

resource "aws_lb_listener" "utkarsh_mishra_listener" {
  load_balancer_arn = aws_lb.utkarsh_mishra_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.utkarsh_mishra_tg.arn
  }
}
