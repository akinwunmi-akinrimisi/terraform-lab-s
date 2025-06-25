resource "aws_instance" "web" {
  ami           = "ami-09e6f87a47903347c" # replace with the Amazon Linux AMI value from your region
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.sg.id]
  user_data = base64encode(<<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd wget unzip

              systemctl start httpd
              systemctl enable httpd

              cd /var/www/html

              wget https://www.free-css.com/assets/files/free-css-templates/download/page284/built-better.zip

              unzip built-better.zip -d /tmp
              cp -r /tmp/html/* /var/www/html/

              rm -r /tmp/html
              rm built-better.zip

              systemctl restart httpd
              EOF
)

  tags = {
    Name = "main-instance-yourname" #update with your name
  }
}

