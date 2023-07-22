module "asg" {
  source = "terraform-aws-modules/autoscaling/aws"

  # Autoscaling group
  name                      = "asg"
  min_size                  = 2
  max_size                  = 5
  desired_capacity          = 3
  wait_for_capacity_timeout = 0
  health_check_type         = "EC2"
  vpc_zone_identifier       = module.vpc.subnet-id[*]
  target_group_arns         = module.alb.target_group_arns

  # Launch template
  launch_template_name   = "demo-template"
  update_default_version = true
  image_id               = var.new-ami
  key_name               = "personal"
  instance_type          = var.instance-type
  ebs_optimized          = false
  enable_monitoring      = true
  security_groups        = [module.vpc.sg-id]
  network_interfaces = [{
    associate_public_ip_address = true
  }]
  user_data = base64encode(file("user-data.sh"))

  scaling_policies = {
    my-policy = {
      policy_type = "TargetTrackingScaling"
      target_tracking_configuration = {
        predefined_metric_specification = {
          predefined_metric_type = "ASGAverageCPUUtilization"
          //resource_label         = "MyLabel"
        }
        target_value = var.target
      }
    }
  }
}

# locals {
#    user_data = <<-EOT
#     #!/bin/bash
#     sudo yum update -y
#     sudo yum install httpd -y
#     sudo systemctl start httpd
#     sudo systemctl enable httpd
#     sudo echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
#    EOT
#  }
