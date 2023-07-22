# module "ec2_instance" {
#   source = "terraform-aws-modules/ec2-instance/aws"
#   count  = 3
#   name   = "instance-${count.index + 1}"

#   instance_type               = var.instance-type
#   key_name                    = "personal"
#   monitoring                  = true
#   vpc_security_group_ids      = [module.vpc.sg-id]
#   subnet_id                   = element(module.vpc.subnet-id, count.index)
#   associate_public_ip_address = true
#   user_data = "${file("user-data.sh")}"

#   tags = {
#     Owner = "shrey.shah@intuitive.cloud"
#   }
# }

