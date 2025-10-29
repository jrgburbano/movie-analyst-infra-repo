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

module "security_groups" {
  source            = "./modules/security_groups"
  vpc_id            = module.vpc.vpc_id
  project           = "movie-analyst"
  allowed_ssh_cidr  = "152.201.119.52/32" # ← Replace with local public IP
}

module "ec2" {
  source            = "./modules/ec2"
  ami_id            = "ami-07860a2d7eb515d9a" # Amazon Linux 2 (us-east-1)
  instance_type     = "t3.micro"
  public_subnet_id  = module.subnets.public_subnet_id
  bastion_sg_id     = module.security_groups.bastion_sg_id
  key_name          = "devops-bastion-key" # nombre de tu llave en AWS
  project           = "movie-analyst"
}
