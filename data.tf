data "terraform_remote_state" "private_dns" {
  backend = "local"

  config = {
    path = "${path.module}/test/terraform.tfstate"
  }
}
