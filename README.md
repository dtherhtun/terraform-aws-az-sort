# Sorting AWS Subnet IDs from Data Source

Terraform module which sort subnet ids in alphabetize az

## Examples
- [single data source sorting](https://github.com/dtherhtun/terraform-aws-az-sort/blob/e7767ba850ef56637a9d1237fc3a12d04eeaeab2/example/main.tf#L44)
- [multiple data source sorting](https://github.com/dtherhtun/terraform-aws-az-sort/blob/e7767ba850ef56637a9d1237fc3a12d04eeaeab2/example/main.tf#L50)

![alt](https://raw.githubusercontent.com/dtherhtun/terraform-aws-az-sort/main/example/sorting.png)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | n/a | yes |
| <a name="input_subnet_data"></a> [subnet\_data](#input\_subnet\_data) | data from subnet data source | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sorted"></a> [sorted](#output\_sorted) | sorted value of subnet ids |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

Apache 2 Licensed. See [LICENSE](https://github.com/dtherhtun/terraform-aws-az-sort/tree/master/LICENSE) for full details.