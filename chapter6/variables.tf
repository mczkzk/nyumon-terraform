variable "region" {
  description = "This is the cloud hosting region where your webapp will be deployed."
  default = "ap-northeast-1"
}

variable "prefix" {
  description = "This is the environment your webapp will be prefixed with. dev, qa, or prod"
  default = "dev"
}

variable "name" {
  description = "Your name to attach to the webapp address"
  default = "mk-lab"
}
