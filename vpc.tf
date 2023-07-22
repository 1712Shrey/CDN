module "vpc" {
  source = "./modules/vpc"
  cidr-range = var.cidr
}