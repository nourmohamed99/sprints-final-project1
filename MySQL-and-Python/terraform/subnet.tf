resource "aws_subnet" "subnet_1" {
    cidr_block = "10.0.0.0/24"
    vpc_id = aws_vpc.my_vpc.id
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1a"
    
    tags = {
        Name = "subnet-1"
    }
}

resource "aws_subnet" "subnet_2" {
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.my_vpc.id
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1b"
    tags = {
        Name = "subnet-2"
    }
    
}