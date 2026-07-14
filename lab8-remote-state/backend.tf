terraform {
  backend "s3" {
    bucket       = "nick-terraform-state-2026-unique"
    key          = "lab8/terrafomr.tfstate"
    region       = "us-east-2"
    encrypt      = true
    use_lockfile = true
  }
}