provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

module "s3"  {  
  source = "../modules/s3"

  bucket = var.s3

  tags = var.tags
}