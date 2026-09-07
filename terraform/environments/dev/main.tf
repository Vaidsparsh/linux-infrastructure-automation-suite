data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}



resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = "cloud-dev-vpc"
    Environment = "dev"
    Project     = "cloud-infrastructure-automation"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name        = "cloud-dev-public-subnet"
    Environment = "dev"
    Project     = "cloud-infrastructure-automation"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "cloud-dev-igw"
    Environment = "dev"
    Project     = "cloud-infrastructure-automation"
  }
}
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name        = "cloud-dev-public-rt"
    Environment = "dev"
    Project     = "cloud-infrastructure-automation"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}



resource "aws_security_group" "ec2" {
  name        = "cloud-dev-ec2-sg"
  description = "Security group for Dev EC2 instance"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "cloud-dev-ec2-sg"
    Environment = "dev"
    Project     = "cloud-infrastructure-automation"
  }
}


resource "aws_iam_role" "ec2" {
  name = "cloud-dev-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name        = "cloud-dev-ec2-role"
    Environment = "dev"
    Project     = "cloud-infrastructure-automation"
  }
}


resource "aws_iam_instance_profile" "ec2" {
  name = "cloud-dev-ec2-profile"
  role = aws_iam_role.ec2.name
}


resource "aws_instance" "app" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  subnet_id = aws_subnet.public.id

  vpc_security_group_ids = [
    aws_security_group.ec2.id
  ]

  associate_public_ip_address = true

  iam_instance_profile = aws_iam_instance_profile.ec2.name

  tags = {
    Name        = "cloud-dev-app-server"
    Environment = "dev"
    Project     = "cloud-infrastructure-automation"
  }
}







resource "aws_s3_bucket" "artifacts" {
  bucket = "cloud-dev-artifacts-${data.aws_caller_identity.current.account_id}"

  tags = {
    Name        = "cloud-dev-artifacts"
    Environment = "dev"
    Project     = "cloud-infrastructure-automation"
  }
}

resource "aws_s3_bucket_versioning" "artifacts" {
  bucket = aws_s3_bucket.artifacts.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "artifacts" {
  bucket = aws_s3_bucket.artifacts.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_ecr_repository" "app" {
  name                 = "cloud-dev-app"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name        = "cloud-dev-app"
    Environment = "dev"
    Project     = "cloud-infrastructure-automation"
  }
}

data "aws_caller_identity" "current" {}

resource "aws_iam_role_policy" "ec2_s3_ecr" {
  name = "cloud-dev-ec2-s3-ecr-policy"
  role = aws_iam_role.ec2.id

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
        ]

        Resource = [
          aws_s3_bucket.artifacts.arn,
          "${aws_s3_bucket.artifacts.arn}/*"
        ]
      },
      {
        Effect = "Allow"

        Action = [
          "ecr:GetAuthorizationToken"
        ]

        Resource = "*"
      },
      {
        Effect = "Allow"

        Action = [
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage"
        ]

        Resource = aws_ecr_repository.app.arn
      }
    ]
  })
}