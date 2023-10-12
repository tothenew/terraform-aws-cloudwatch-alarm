data "aws_instance" "selected" {
  for_each = toset(var.instance_id)
  instance_id = each.value
}

resource "aws_cloudwatch_metric_alarm" "ec2_memory" {
     for_each                  = data.aws_instance.selected
     alarm_name                = "instance-${each.value.id}-memory-utilization"
     comparison_operator       = "GreaterThanOrEqualToThreshold"
     evaluation_periods        = "2"
     metric_name               = "mem_used_percent"
     namespace                 = "CWAgent"
     period                    = "120" #seconds
     statistic                 = "Average"
     threshold                 = "80"
     alarm_description         = "This metric monitors ec2 cpu utilization"
     insufficient_data_actions = []
     dimensions = {
       InstanceId = each.value.id
     }
}