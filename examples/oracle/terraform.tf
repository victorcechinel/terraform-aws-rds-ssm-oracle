terraform {
  backend "s3" {
    key     = "oracle/terraform.tfstate"
    region  = "sa-east-1"
    bucket  = "my-bucket-name"
    profile = "test" # aws-cli profile

    dynamodb_table = "my-dynamodb-table"
  }
}
