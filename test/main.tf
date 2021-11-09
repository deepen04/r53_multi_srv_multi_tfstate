resource "aws_instance" "web" {
  ami           = "ami-02e136e904f3da870"
  instance_type = "t2.micro"

  tags = {
    Name = "testHelloWorld"
  }
}
