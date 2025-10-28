module "vpc" {
  source     = "./modules/vpc"
  cidr_block = var.vpc_cidr
  vpc_name   = "main-vpc"
}

module "subnets" {
  source       = "./modules/subnets"
  vpc_id       = module.vpc.vpc_id
  public_cidr  = var.public_subnet_cidr
  private_cidr = var.private_subnet_cidr
  az           = var.az
  project      = "movie-analyst"
}