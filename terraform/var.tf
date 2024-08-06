variable "region" {
  default = "us-east-1"
}

variable "ami" {
  default = "ami-0230bd60aa48260c6"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "dan_msych"
  default     = "msych" 
}
