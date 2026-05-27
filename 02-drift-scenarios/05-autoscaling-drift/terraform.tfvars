aws_region             = "ap-south-1"
launch_template_name   = "terraform-drift-launch-template"
autoscaling_group_name = "terraform-drift-asg"
instance_type          = "t3.micro"
ami_id                 = "ami-07a00cf47dbbc844c"
desired_capacity       = 2
min_size               = 1
max_size               = 6
