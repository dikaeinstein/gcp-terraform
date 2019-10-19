variable "project" {
  type = "string"
  description = "The project id that resources belongs to."
}

variable "region" {
  type = "string"
  description = "The region that the resource will be hosted."
}

variable "zone" {
  type = "string"
  description = "The zone that the resource will be hosted."
}

variable "machine_type" {
  type = "string"
  description = "The machine type of the vm instance."
}

variable "instance_name" {
  type = "string"
  description = "The instance name"
}

variable "tags" {
  type = "list"
  description = "The list of tags attached to the instance."
}

variable "image" {
  type = "string"
  default = "ubuntu-1604-lts"
  description = "Image to use on the instance"
}

variable "size" {
  type = "string"
  description = "The size of the image in gigabytes."
}

variable "firewall_rule_name" {
  type = "string"
  description = "The name of the firewall rule."
}

variable "ports" {
  type = "list"
  description = "An optional list of ports to which this rule applies."
}

variable "protocol" {
  type = "string"
  description = "The IP protocol to which this rule applies"
}

variable "source_ranges" {
  type = "list"
  description = "The IP CIDR range"
  default = ["0.0.0.0/0"]
}

variable "target_tags" {
  type = "list"
  description = "A list of instance tags indicating sets of instances located in the network."
  default = []
}

variable "ssh_public_key_path" {
  type = "string"
  description = "ssh public key to connect to the vm instance."
}

variable "ssh_user" {
  type = "string"
  description = "The ssh user"
}

