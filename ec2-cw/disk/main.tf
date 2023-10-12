data "aws_instance" "selected" {
  for_each = toset(var.instance_id)
  instance_id = each.value
}

resource "aws_cloudwatch_metric_alarm" "disk_alarm_1" {
  for_each            = data.aws_instance.selected
  alarm_name          = "DiskUtilizationAlarm-test"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "disk_used_percent"
  namespace           = "CWAgent"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"
  alarm_description  = "Disk space utilization is above 80%"
  # alarm_actions      = [aws_sns_topic.SRE_CloudWatch_to_OpsGenie_biovitals-staging-us-west-1.arn]
    dimensions = {
       ImageId          = "ami-03d294e37a4820c21"
       InstanceId       = each.key
       Path             = "/"
       InstanceType     = "t2.micro"
       device           = "xvda1"
       fstype           = "xfs"
     }
}


