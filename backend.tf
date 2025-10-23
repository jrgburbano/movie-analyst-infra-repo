terraform {
  required_version = ">= 1.0.0"

  backend "s3" {
    bucket         = "terraform-remote-states-movie-analyst"
    key            = "movie-analyst/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}
