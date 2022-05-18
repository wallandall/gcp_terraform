variable "project" {
  default = "playground-s-11-14127e6c"
}

variable "bucket" {
  default = "terraform1805"
}

variable "prefix" {
  default = "terraform"
}

variable "credentials" {
  default = "terraform-key.json"
  
}

variable "region" {
  default = "us-central1" 
}

variable "zone"  {
  default = "us-central1-c"
}

variable "cidr" {
  default = "10.0.0.0/16"
}
  