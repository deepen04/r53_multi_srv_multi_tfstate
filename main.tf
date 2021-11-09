resource "aws_instance" "web" {
  count = "2"
  ami           = "ami-02e136e904f3da870"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_route53_record" "r53_web" {
  zone_id = "Z0604754A7FIXHRF0HF0"
  name    = "web1.kimai.com"
  type    = "SRV"
  ttl     = "300"
  records = [ "10 100 9215 ${aws_instance.web.0.private_dns}", "10 100 9215 ${aws_instance.web.1.private_dns}", "10 100 9215 ${join(" ", data.terraform_remote_state.private_dns.outputs.private_dns)}" ]
}
