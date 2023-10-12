resource "aws_cloudwatch_metric_alarm" "ec2_cpu" {
     count                     = length(var.instance_id)
     alarm_name                = "instance-${var.instance_id[count.index]}-cpu-utilization"
     comparison_operator       = "GreaterThanOrEqualToThreshold"
     evaluation_periods        = "2"
     metric_name               = "CPUUtilization"
     namespace                 = "AWS/EC2"
     period                    = "120" #seconds
     statistic                 = "Average"
     threshold                 = "80"
     alarm_description         = "This metric monitors ec2 cpu utilization"
     insufficient_data_actions = []
     dimensions = {
       InstanceId = var.instance_id[count.index]
     }
}