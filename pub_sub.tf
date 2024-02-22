resource "aws_subnet" "sub-pub-1a" {
    vpc_id = aws_vpc.eks_vpc.id
    cidr_block = cidrsubnet(var.cidr_block, 8, 1)
    map_public_ip_on_launch = true
    availability_zone = "${data.aws_region.current.name}a"
    tags = merge(
      local.tags,
      {
          Name =  "${var.project_name}-sub-pub-1a"
          "kubernetes.io/role/elb" = 1  
      }
    )
}

resource "aws_subnet" "sub-pub-1b" {
    vpc_id = aws_vpc.eks_vpc.id
    cidr_block = cidrsubnet(var.cidr_block, 8, 2)
    map_public_ip_on_launch = true
    availability_zone = "${data.aws_region.current.name}b"
    tags = merge(
      local.tags,
      {
          Name = "${var.project_name}-sub-pub-1b"
          "kubernetes.io/role/elb" = 1
    }
  )
}

resource "aws_route_table_association" "rtb-assoc-1a" {
  subnet_id = aws_subnet.sub-pub-1a.id
  route_table_id = aws_route_table.pub-route-table.id
}

resource "aws_route_table_association" "rtb-assoc-1b" {
  subnet_id = aws_subnet.sub-pub-1b.id
  route_table_id = aws_route_table.pub-route-table.id
}