terraform {
    backend "s3" {
        encrypt                     = true
        bucket                      = "terraform-remote-state"
        dynamodb_table              = "terraform-state-lock"
        region                      = "us-east-1"
        workspace_key_prefix        = "staging"
        key                         = "eks/terraform.tfstate"
        profile                     = "default"
        shared_credentials_file     = "~/.aws/credentials"
    }
}