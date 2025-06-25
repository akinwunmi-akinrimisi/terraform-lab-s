terraform {
  backend "s3" {
    bucket         = "my-dev-sec-s3bucket-lab-akinwunmi" 
    key            = "terraform/state.tfstate"
    region         = "us-east-1" 
    dynamodb_table = "terraform-locks-akin"  
    encrypt        = true
  }
}



