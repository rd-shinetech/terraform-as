variable "vpc_name" {
  type = string
  default = "myvpc"
}

variable "ssh_port" {
  type = number
  default = 22
}

variable "enabled" {
  type = bool
  default = false
}

variable "mylist" {
  type = list(string)
  default = [ "value1", "value2" ]
}

variable "mymap" {
  type = map(string,string)
  default = {
    key1 = "value1"
    key2 = "value2"
  }
}