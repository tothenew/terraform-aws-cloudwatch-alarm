variable "loadbalancers" {
  type    = map(object({
    name         = string
    target_group = string
    az           = string
  }))
}