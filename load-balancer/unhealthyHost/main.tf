data "aws_lb" "existing_loadbalancer" {
  for_each = var.loadbalancers
  name = each.value.name
}

data "aws_alb_target_group" "existing_tg" {
  for_each = var.loadbalancers
  name = each.value.target_group
}

resource "aws_cloudwatch_metric_alarm" "loadbalancer" {
    for_each                  = var.loadbalancers
    actions_enabled           = true
    alarm_actions             = []
    alarm_name                = "loadbalancer-${each.value["name"]}-UnhealthyHostCount"
    comparison_operator       = "GreaterThanThreshold"
    datapoints_to_alarm       = 1
    dimensions                = {
        "LoadBalancer"        = data.aws_lb.existing_loadbalancer[each.key].arn_suffix
        "TargetGroup"         = data.aws_alb_target_group.existing_tg[each.key].arn_suffix
        "AvailabilityZone"    = each.value.az
    }
    evaluation_periods        = 1
    insufficient_data_actions = []
    metric_name               = "UnHealthyHostCount"
    namespace                 = "AWS/ApplicationELB"
    ok_actions                = []
    period                    = 60
    statistic                 = "Sum"
    tags                      = {}
    tags_all                  = {}
    threshold                 = 0
    treat_missing_data        = "missing"
}