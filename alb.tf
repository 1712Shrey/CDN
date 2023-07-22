module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"
  name = "alb"

  load_balancer_type = "application"

  vpc_id          = module.vpc.vpc-id
  subnets         = module.vpc.subnet-id[*]
  security_groups = [module.vpc.sg-id]

  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      health_check = {
        matcher = "200"
        path = "/index.html"
      }
  #     targets = {
  #       my_target1 = {
  #         target_id = module.ec2_instance[0].id
  #         port = 80
  #       }
  #       my_target2 = {
  #         target_id = module.ec2_instance[1].id
  #         port = 80
  #       }
  #       my_target3 = {
  #         target_id = module.ec2_instance[2].id
  #         port = 80
  #       }
  #     }
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]
}