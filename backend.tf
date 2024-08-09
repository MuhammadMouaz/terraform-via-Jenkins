terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket1212121"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}