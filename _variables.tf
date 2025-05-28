variable instance_id {
  type    = list(string)
  default = ["i-08ef9201037dd01da"]
}

variable requests  {
    type    =  bool
    default =  true
}

variable "alb_names" {
  type    = list(string)
  default = ["test-1"]  # Replace with the names of your ALBs
}

variable "target_group_name" {
  type    = list(string)
  default = ["test-tg"]  # Replace with the names of your ALBs
}

variable "loadbalancers" {
  type    = map(object({
    name         = string
    target_group = string
    az           = string
  }))
}

variable "alarm_action_arn" {
  description = "ARN of the SNS topic to notify on alarm"
  type        = string
}
