variable "subnet_data" {
  type        = map(any)
  description = "data from subnet data source"
}

variable "region" {
  type        = string
  description = "AWS region"
}
