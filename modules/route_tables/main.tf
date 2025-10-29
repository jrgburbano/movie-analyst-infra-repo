resource "aws_route_table" "public_rt" {
  vpc_id = var.vpc_id

  tags = {
    Name        = "${var.project}-public-rt"
    Project     = var.project
    Environment = "default"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = var.vpc_id

  tags = {
    Name        = "${var.project}-private-rt"
    Project     = var.project
    Environment = "default"
  }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = var.public_subnet_id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_assoc" {
  subnet_id      = var.private_subnet_id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.igw_id
}