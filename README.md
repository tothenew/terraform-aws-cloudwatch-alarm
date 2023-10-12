
# terraform-aws-template

[![Lint Status](https://github.com/tothenew/terraform-aws-template/workflows/Lint/badge.svg)](https://github.com/tothenew/terraform-aws-template/actions)
[![LICENSE](https://img.shields.io/github/license/tothenew/terraform-aws-template)](https://github.com/tothenew/terraform-aws-template/blob/master/LICENSE)

This is a template to use for baseline. The default actions will provide updates for section bitween Requirements and Outputs.

The following content needed to be created and managed:
 - Introduction
     - Explaination of module 
     - Intended users
 - Resource created and managed by this module
 - Example Usages

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |

## Providers

No providers.

## Modules


| Name | Source | Version |
|------|--------|---------|
| <a name="module_agent"></a> [agent](#module\_agent) | ./module/ec2-cw-agent/ | n/a |
| <a name="module_ec2-CloudWatch-cpu"></a> [ec2-CloudWatch-cpu](#module\_ec2-CloudWatch-cpu) | ./module/ec2-cw/cpu | n/a |
| <a name="module_ec2-CloudWatch-disk"></a> [ec2-CloudWatch-disk](#module\_ec2-CloudWatch-disk) | ./module/ec2-cw/disk | n/a |
| <a name="module_ec2-CloudWatch-memory"></a> [ec2-CloudWatch-memory](#module\_ec2-CloudWatch-memory) | ./module/ec2-cw/memory | n/a |
| <a name="module_ec2-CloudWatch-status"></a> [ec2-CloudWatch-status](#module\_ec2-CloudWatch-status) | ./module/ec2-cw/status | n/a |
| <a name="module_lb_request"></a> [lb\_request](#module\_lb\_request) | ./module/load-balancer/requestCount/ | n/a |
| <a name="module_lb_target_response_time"></a> [lb\_target\_response\_time](#module\_lb\_target\_response\_time) | ./module/load-balancer/targetresponsetime/ | n/a |
| <a name="module_unhealthyhost"></a> [unhealthyhost](#module\_unhealthyhost) | ./module/load-balancer/unhealthyHost/ | n/a |


## Resources

No resources.

## Inputs


No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->

## Authors

Module managed by [TO THE NEW Pvt. Ltd.](https://github.com/tothenew)

## License

Apache 2 Licensed. See [LICENSE](https://github.com/tothenew/terraform-aws-template/blob/main/LICENSE) for full details.

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_names"></a> [alb\_names](#input\_alb\_names) | n/a | `list(string)` | <pre>[<br>  "test-1"<br>]</pre> | no |
| <a name="input_instance_id"></a> [instance\_id](#input\_instance\_id) | n/a | `list(string)` | <pre>[<br>  "i-08ef9201037dd01da"<br>]</pre> | no |
| <a name="input_loadbalancers"></a> [loadbalancers](#input\_loadbalancers) | n/a | <pre>map(object({<br>    name         = string<br>    target_group = string<br>    az           = string<br>  }))</pre> | n/a | yes |
| <a name="input_requests"></a> [requests](#input\_requests) | n/a | `bool` | `true` | no |
| <a name="input_target_group_name"></a> [target\_group\_name](#input\_target\_group\_name) | n/a | `list(string)` | <pre>[<br>  "test-tg"<br>]</pre> | no |

## Outputs


