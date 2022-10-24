terraform {
  required_version = ">= 0.14, < 0.15"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

locals {
  location = "Central India"
}