variable "project" {
    default = "my-project-custom-445803"
}

variable "region" {
    default = "us-central1" 
}

variable "environment" {
    type = string
    default = "Dev"
}

variable "zone" {
    type = string
    default = "us-central1-a"
}

variable "machine_type" {
    type = string
    default = "n2-standard-2"
}

variable "service_account" {
    type = string
    default = "Dev-Serviceaccount"
}
variable "ip_cidr_range" {
    default = "10.128.0.0/20" #10.2.0.0/16
}
