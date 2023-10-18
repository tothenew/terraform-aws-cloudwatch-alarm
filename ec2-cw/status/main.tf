data "aws_instance" "selected" {
  for_each = toset(var.instance_id)
  instance_id = each.value
}

resource "aws_cloudwatch_metric_alarm" "disk_alarm" {
     for_each                  = data.aws_instance.selected
     alarm_name                = "instance-${each.value.id}-status-check"
     comparison_operator       = "GreaterThanOrEqualToThreshold"
     evaluation_periods        = "5"
     metric_name               = "StatusCheckFailed"
     namespace                 = "AWS/EC2"
     period                    = "120" #seconds
     statistic                 = "Average"
     threshold                 = "1"
     alarm_description         = "This metric monitors ec2 cpu utilization"
     insufficient_data_actions = []
     dimensions = {
       InstanceId       = each.value.id
     }
}