terraform {
  required_providers {
    harness = {
      source  = "harness/harness"
      version = "0.24.2"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

provider "harness" {
  endpoint        = "https://app.harness.io/gateway"
  account_id      = var.account_id
  platform_api_key = var.harness_api_token
}