instance_id = ["i-08ef9201037dd01da"]
requests    = false
loadbalancers = {
  "test-1" = {
    name         = "test-1"
    target_group = "test-tg"
    az           = "ap-south-1b"
  }
}