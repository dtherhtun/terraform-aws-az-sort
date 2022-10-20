data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [local.selected_vpc_id]
  }

  tags = {
    Tier = local.subnet_names[1]
  }
}

data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [local.selected_vpc_id]
  }

  tags = {
    Tier = local.subnet_names[0]
  }
}

data "aws_subnet" "private" {
  for_each = toset(data.aws_subnets.private.ids)
  id       = each.value
}

data "aws_subnet" "public" {
  for_each = toset(data.aws_subnets.public.ids)
  id       = each.value
}

locals {
  region          = "us-east-1"
  selected_vpc_id = "vpc-06cd3a375472242cd"
  subnet_names    = ["public", "private", "database", "elasticache"]

  before_sort = zipmap(slice(local.subnet_names, 0, 2), [data.aws_subnet.public, data.aws_subnet.private])

  private_sorted  = module.sort_az.sorted
  multiple_sorted = zipmap(slice(local.subnet_names, 0, 2), [for i in range(2) : module.multiple_sort_az[local.subnet_names[i]].sorted])
}

module "sort_az" {
  source      = "../"
  subnet_data = data.aws_subnet.private
  region      = local.region
}

module "multiple_sort_az" {
  source      = "../"
  for_each    = local.before_sort
  subnet_data = each.value
  region      = local.region
}
