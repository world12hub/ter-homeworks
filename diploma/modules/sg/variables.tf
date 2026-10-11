variable "sg_name" {
  type        = string  
  description = "Имя группы безопасности"
  validation {
    condition     = length(var.sg_name) > 0 && length(var.sg_name) <= 63
    error_message = "Имя должно быть непустым и не длиннее 63 символов."
  }  
}

variable "network_id" {
  description = "ID сети, в которой создаётся группа"
  type        = string
}


variable "security_group_ingress" {
  description = "secrules ingress"
  type = list(object(
    {
      protocol       = string
      description = optional(string)
      v4_cidr_blocks = optional(list(string))
      security_group_id = optional(string)
      port           = optional(number)
      from_port      = optional(number)
      to_port        = optional(number)
  }))
  default = [
    {
      protocol       = "TCP"
      description    = "SSH"
      v4_cidr_blocks = ["0.0.0.0/0"]
      port           = 22
    },
    {
      protocol       = "TCP"
      description    = "HTTP"
      v4_cidr_blocks = ["0.0.0.0/0"]
      port           = 80
    },
    {
      protocol       = "TCP"
      description    = "HTTPS"
      v4_cidr_blocks = ["0.0.0.0/0"]
      port           = 443
    },
  ]

  validation {
    condition = alltrue([
      for r in var.security_group_ingress :
      contains(["TCP", "UDP", "ICMP", "ANY", "IPV6_ICMP"], r.protocol)
    ])
    error_message = "protocol должен быть одним из: TCP, UDP, ICMP, ANY, IPV6_ICMP."
  }
  
  validation {
    condition = alltrue([
      for r in var.security_group_ingress :
      r.v4_cidr_blocks != null || r.security_group_id != null
    ])
    error_message = "У каждого правила ingress должен быть указан v4_cidr_blocks или security_group_id."
  }

  validation {
    condition = alltrue([
      for r in var.security_group_ingress :
      r.port == null || (r.port >= 1 && r.port <= 65535)
    ])
    error_message = "port должен быть в диапазоне 1..65535."
  }      
}


variable "security_group_egress" {
  description = "secrules egress"
  type = list(object(
    {
      protocol       = string
      description = optional(string)
      v4_cidr_blocks = optional(list(string))
      security_group_id = optional(string)
      port           = optional(number)
      from_port      = optional(number)
      to_port        = optional(number)
  }))
  default = [
    { 
      protocol       = "ANY"
      description    = "разрешить весь исходящий трафик"
      v4_cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  validation {
    condition = alltrue([
      for r in var.security_group_egress :
      contains(["TCP", "UDP", "ICMP", "ANY", "IPV6_ICMP"], r.protocol)
    ])
    error_message = "protocol должен быть одним из: TCP, UDP, ICMP, ANY, IPV6_ICMP."
  }  
}