# Terraform Block - We can defien Terraform version, Required providers, and also we can configure backend configuration for statefile

terraform {
    required_version = ">=1.8.5"
    required_providers {
      google = {
        source = "hashicorp/google"   
        version = "6.23.0"
      }
    }
}

provider "google" {
    project = "var.project"   # Provide Project ID instaed of name
    region = "var.region"          
}