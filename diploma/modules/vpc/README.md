<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.15.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.228.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [yandex_vpc_network.develop](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.develop](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_v4_cidr_blocks"></a> [v4\_cidr\_blocks](#input\_v4\_cidr\_blocks) | https://cloud.yandex.ru/docs/vpc/operations/subnet-create | `list(string)` | <pre>[<br/>  "10.0.1.0/24"<br/>]</pre> | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | VPC network&subnet name | `string` | `"develop"` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | https://cloud.yandex.ru/docs/overview/concepts/geo-scope | `string` | `"ru-central1-a"` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_network"></a> [network](#output\_network) | n/a |
| <a name="output_subnet"></a> [subnet](#output\_subnet) | n/a |
<!-- END_TF_DOCS -->