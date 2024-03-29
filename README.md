# AWS RDS Oracle SSM

![Terraform Version](https://img.shields.io/badge/tf-%3E%3D1.0.3-blue.svg) [![MIT Licensed](https://img.shields.io/badge/license-MIT-green.svg)](https://tldrlegal.com/license/mit-license)

Terraform Module to provision an AWS instance RDS Oracle and store credentials on Parameter Store.

## Features

This Terraform module creates the following AWS resources:

* **RDS**: instace Oracle RDS;
* **Parameter Store**
  * identifier: save database identifier;
  * endpoint: save database endpoint;
  * username: save database superuser;
  * passsword: save database superuser password (random generated);

## Requirements

* This module is meant for use with [Terraform](https://www.terraform.io/downloads.html) 1.0.3+. It has not been tested with previous versions of Terraform.
* An AWS account and your credentials (`aws_access_key_id` and `aws_secret_access_key`) configured. There are several ways to do this (environment variables, shared credentials file, etc.): my preference is to store them in a [credential file](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html). More information in the [AWS Provider](https://www.terraform.io/docs/providers/aws/index.html) documentation.

## Usage

```HCL
terraform {
  required_version = ">= 1.0.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.37.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1.0"
    }
  }
}

provider "aws" {
  region                  = "sa-east-1"
  shared_credentials_file = "~/.aws/credentials"
}

module "aws_rds_oracle" {
  source  = "victorcechinel/rds-ssm-oracle/aws"
  version = "1.0.5"

  identifier             = "rds-identifier"
  subnet_group           = "my-subnet-group"
  parameter_group        = "my-parameter-group"
  vpc_security_group_ids = ["vpc-security-group-ids"]
}
```

## Inputs

| Name                   | Description                 | Type        | Default | Required |
| ---------------------- | --------------------------- | ----------- | ------- | -------- |
| identifier             | Database identifier         | string      | -       | yes      |
| subnet_group           | Database subnet group       | string      | -       | yes      |
| parameter_group        | Database parameter group    | string      | -       | yes      |
| vpc_security_group_ids | Database VPC security group | list string | -       | yes      |

## Outputs

| Name                | Description                 |
| ------------------- | --------------------------- |
| rds_oracle_endpoint | Database endpoint           |
| rds_oracle_username | Database superuser          |
| rds_oracle_password | Database superuser password |

## Author

Module written by [@victorcechinel](https://github.com/victorcechinel). 
[Linkedin](https://www.linkedin.com/in/victorcechinelr/). 
Module Support: [terraform-aws-rds-ssm-oracle](https://github.com/victorcechinel/terraform-aws-rds-ssm-oracle).
Contributions and comments are welcomed.

## Todo

* Save parameter store secure;
* Lambda to connect database and create data;