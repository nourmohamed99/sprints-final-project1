resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "PublicRtassociation1" {
    subnet_id = aws_subnet.subnet_1.id
    route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "PublicRtassociation2" {
    subnet_id = aws_subnet.subnet_2.id
    route_table_id = aws_route_table.rt.id
}