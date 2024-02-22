resource "aws_subnet" "sub-priv-1a" {
    vpc_id = aws_vpc.eks_vpc.id
    cidr_block = cidrsubnet(var.cidr_block, 8, 3)
    availability_zone = "${data.aws_region.current.name}a"
    tags = merge(
      local.tags,
      {
          Name = "${var.project_name}-sub-priv-1a"
          "kubernetes.io/role/internal-elb" = 1  
      }
    )
}

resource "aws_subnet" "sub-priv-1b" {
    vpc_id = aws_vpc.eks_vpc.id
    cidr_block = cidrsubnet(var.cidr_block, 8, 4)
    availability_zone = "${data.aws_region.current.name}b"
    tags = merge(
      local.tags,
      {
          Name = "${var.project_name}-sub-priv-1b"
          "kubernetes.io/role/internal-elb" = 1
    }
  )
}

resource "aws_route_table_association" "rtb-assoc-priv-1a" {
  subnet_id = aws_subnet.sub-priv-1a.id
  route_table_id = aws_route_table.pub-route-table.id
}

resource "aws_route_table_association" "rtb-assoc-priv-1b" {
  subnet_id = aws_subnet.sub-priv-1b.id
  route_table_id = aws_route_table.pub-route-table.id
}