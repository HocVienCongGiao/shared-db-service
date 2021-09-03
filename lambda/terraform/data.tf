data "aws_subnet_ids" "private" {
  # vpc_id = tolist(data.aws_vpcs.lambda.ids)[0]
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  tags = {
    type = "private"
  }
}

data "aws_security_groups" "sg" {
  filter {
    name = "vpc-id"
    # values = tolist([data.aws_subnet_ids.private.vpc_id])
    values = tolist([data.terraform_remote_state.vpc.outputs.vpc_id])
  }
}

data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = var.organisation
    workspaces = {
      name = "crossenv-shared-apps-hvcg-vpc"
    }
  }
}
