# terraform-aws-cloudwatch-alarm


[![Lint Status](https://github.com/tothenew/terraform-aws-template/workflows/Lint/badge.svg)](https://github.com/tothenew/terraform-aws-template/actions)  
[![LICENSE](https://img.shields.io/github/license/tothenew/terraform-aws-template)](https://github.com/tothenew/terraform-aws-template/blob/master/LICENSE)

This is a template to use for baseline. The default actions will provide updates for section between Requirements and Outputs.

## Introduction

This Terraform module provides a standardized way to set up and monitor various AWS resources using CloudWatch metrics. It simplifies the integration of CloudWatch monitoring for EC2 instances and Load Balancers by encapsulating commonly used configurations into reusable modules.

### Explanation of Module

The module is structured to include CloudWatch metric alarms for CPU utilization, disk usage, memory usage, and instance status for EC2 instances. It also includes monitoring for ALB request counts, target response times, and unhealthy host counts.

## Resources Created and Managed by this Module

This module creates and manages the following types of resources:
- CloudWatch alarms for:
  - EC2 CPU utilization
  - EC2 disk usage
  - EC2 memory usage
  - EC2 instance status checks
  - ALB request count
  - ALB target response time
  - ALB unhealthy hosts
- CloudWatch Agent setup for EC2 instances

## Example Usages

```hcl
module "cloudwatch-monitoring" {
  source = "git::https://github.com/tothenew/terraform-aws-cloudwatch-alarm"

  instance_id = ["i-08ef9201037dd01da"]
  alb_names   = ["test-1"]
  target_group_name = ["test-tg"]
  requests = true

  loadbalancers = {
    alb1 = {
      name         = "test-1"
      target_group = "test-tg"
      az           = "us-east-1a"
    }
  }
}
```

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.3.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_agent"></a> [agent](#module_agent) | ./module/ec2-cw-agent/ | n/a |
| <a name="module_ec2-CloudWatch-cpu"></a> [ec2-CloudWatch-cpu](#module_ec2-CloudWatch-cpu) | ./module/ec2-cw/cpu | n/a |
| <a name="module_ec2-CloudWatch-disk"></a> [ec2-CloudWatch-disk](#module_ec2-CloudWatch-disk) | ./module/ec2-cw/disk | n/a |
| <a name="module_ec2-CloudWatch-memory"></a> [ec2-CloudWatch-memory](#module_ec2-CloudWatch-memory) | ./module/ec2-cw/memory | n/a |
| <a name="module_ec2-CloudWatch-status"></a> [ec2-CloudWatch-status](#module_ec2-CloudWatch-status) | ./module/ec2-cw/status | n/a |
| <a name="module_lb_request"></a> [lb_request](#module_lb_request) | ./module/load-balancer/requestCount/ | n/a |
| <a name="module_lb_target_response_time"></a> [lb_target_response_time](#module_lb_target_response_time) | ./module/load-balancer/targetresponsetime/ | n/a |
| <a name="module_unhealthyhost"></a> [unhealthyhost](#module_unhealthyhost) | ./module/load-balancer/unhealthyHost/ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_names"></a> [alb_names](#input_alb_names) | n/a | `list(string)` | <pre>[<br>  "test-1"<br>]</pre> | no |
| <a name="input_instance_id"></a> [instance_id](#input_instance_id) | n/a | `list(string)` | <pre>[<br>  "i-08ef9201037dd01da"<br>]</pre> | no |
| <a name="input_loadbalancers"></a> [loadbalancers](#input_loadbalancers) | n/a | <pre>map(object({<br>    name         = string<br>    target_group = string<br>    az           = string<br>  }))</pre> | n/a | yes |
| <a name="input_requests"></a> [requests](#input_requests) | n/a | `bool` | `true` | no |
| <a name="input_target_group_name"></a> [target_group_name](#input_target_group_name) | n/a | `list(string)` | <pre>[<br>  "test-tg"<br>]</pre> | no |

## Outputs

No outputs.

<!-- END_TF_DOCS -->

## Authors

Module managed by [TO THE NEW Pvt. Ltd.](https://github.com/tothenew)

## License

Apache 2 Licensed. See [LICENSE](https://github.com/tothenew/terraform-aws-template/blob/main/LICENSE) for full details.
