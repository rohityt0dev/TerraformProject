resource "aws_vpc" "myvpc" {

    cidr_block = "10.0.0.0/16"

    tags= {

        name = "insysvpc"

    }

}



#  1 create a internet gateway

resource  "aws_internet_gateway" "myig" {

vpc_id = aws_vpc.myvpc.id

tags = {

    name = "myig"

}

}

# 2 create a subnet private subnet

resource "aws_subnet" "subnet1" {

    cidr_block ="10.0.2.0/24"

    vpc_id = aws_vpc.myvpc.id

tags = {

    name = "subnet1"

}

}



resource "aws_subnet" "subnet2"{

    cidr_block ="10.0.3.0/24"

    vpc_id = aws_vpc.myvpc.id

tags = {

    name = "subnet2"

}

}

# 3 routing table

  resource "aws_route_table" "myrt" {

    vpc_id = aws_vpc.myvpc.id

    route  {

        cidr_block = "0.0.0.0/0"

        gateway_id =  aws_internet_gateway.myig.id

    }

  }

  #associate route table

  resource "aws_route_table_association" "publicsub" {

    route_table_id = aws_route_table.myrt.id

    subnet_id = aws_subnet.subnet1.id

      }



# 4 create Security Group

resource "aws_security_group" "vpcSec" {

  name        = "vpcSec"

  description = "Security group for VPC"

  vpc_id      = aws_vpc.myvpc.id



  ingress {

    from_port   = 22

    to_port     = 22

    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

    }

    egress {

      from_port   = 0

      to_port     = 0

      protocol    = "-1"

      cidr_blocks = ["0.0.0.0/0"]

    }

    tags = {

      Name = "vpcSec"

    }

}


 # 5  create EC2 machine
 resource "aws_instance" "ec1" {

  ami           = "ami-0d176f79571d18a8f"

  instance_type = var.instance_type

  subnet_id = aws_subnet.subnet1.id

  vpc_security_group_ids = [aws_security_group.vpcSec.id]

  tags = {

    Name = "awslinuxvm"

  }


}
