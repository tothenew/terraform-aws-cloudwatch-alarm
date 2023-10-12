module agent {
    source      =   "./module/ec2-cw-agent/"
    instance_id =   var.instance_id
    requests    =   var.requests
}

module ec2-CloudWatch-cpu   {
    source  =   "./module/ec2-cw/cpu"
    instance_id =   var.instance_id
}

module ec2-CloudWatch-disk   {
    source  =   "./module/ec2-cw/disk"
    instance_id =   var.instance_id
}

module ec2-CloudWatch-status   {
    source  =   "./module/ec2-cw/status"
    instance_id =   var.instance_id
}

module ec2-CloudWatch-memory   {
    source  =   "./module/ec2-cw/memory"
    instance_id =   var.instance_id
}

module lb_request {
    source        =   "./module/load-balancer/requestCount/"
    loadbalancers = var.loadbalancers
}

module lb_target_response_time {
    source        =   "./module/load-balancer/targetresponsetime/"
    loadbalancers = var.loadbalancers
}

module unhealthyhost {
    source        =   "./module/load-balancer/unhealthyHost/"
    loadbalancers = var.loadbalancers
}


