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

module "route_tables" {
  source            = "./modules/route_tables"
  vpc_id            = module.vpc.vpc_id
  public_subnet_id  = module.subnets.public_subnet_id
  private_subnet_id = module.subnets.private_subnet_id
  igw_id            = module.igw.igw_id
  project           = "movie-analyst"
}

module "igw" {
  source  = "./modules/igw"
  vpc_id  = module.vpc.vpc_id
  project = "movie-analyst"
}
