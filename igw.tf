resource "aws_internet_gateway" "eks_igw" {
  vpc_id = aws_vpc.eks_vpc.id 
  tags = merge(
    local.tags,
    {
        Name = "${var.project_name}-igw"
    }
  )
}

resource "aws_route_table" "pub-route-table" {
    vpc_id = aws_vpc.eks_vpc.id

    route = {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.eks_igw.id 
    }

    tags = merge(
    local.tags,
    {
        Name = "${var.project_name}-pub-route-table"
    }
  )
}