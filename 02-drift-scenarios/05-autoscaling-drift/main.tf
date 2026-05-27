
resource "aws_launch_template" "drift_template" {
  name_prefix = var.launch_template_name

  image_id      = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name        = "drift-launch-template"
    Environment = "Production"
    Project     = "Drift-Detection"
    Scenario    = "AutoScaling-Drift"
    ManagedBy   = "Terraform"
  }
}

resource "aws_autoscaling_group" "drift_asg" {
  name = var.autoscaling_group_name

  desired_capacity = var.desired_capacity

  min_size = var.min_size
  max_size = var.max_size

  health_check_type = "EC2"

  launch_template {
    id      = aws_launch_template.drift_template.id
    version = "$Latest"
  }

  availability_zones = ["ap-south-1a"]

  tag {
    key                 = "Name"
    value               = "terraform-drift-asg-instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Production"
    propagate_at_launch = true
  }

  tag {
    key                 = "Project"
    value               = "Drift-Detection"
    propagate_at_launch = true
  }

  tag {
    key                 = "Scenario"
    value               = "AutoScaling-Drift"
    propagate_at_launch = true
  }

  tag {
    key                 = "ManagedBy"
    value               = "Terraform"
    propagate_at_launch = true
  }
}
