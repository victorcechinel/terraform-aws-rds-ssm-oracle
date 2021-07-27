module "aws_rds_oracle" {
  source  = "victorcechinel/rds-ssm-oracle/aws"
  version = "1.0.5"

  identifier             = "rds-identifier"
  subnet_group           = "my-subnet-group"
  parameter_group        = "my-parameter-group"
  vpc_security_group_ids = ["vpc-security-group-ids"]
}
