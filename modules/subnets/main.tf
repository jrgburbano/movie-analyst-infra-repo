resource "aws_subnet" "public_subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_cidr
  availability_zone       = var.az
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.project}-public-subnet"
    Project     = var.project
    Environment = "default"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_cidr
  availability_zone = var.az

  tags = {
    Name        = "${var.project}-private-subnet"
    Project     = var.project
    Environment = "default"
  }
}