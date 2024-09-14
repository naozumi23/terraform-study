terraform {
  backend "gcs" {
    bucket = "terraform-backend-001"
  }
}


provider "google" {
  project = "horse-race-project-415513"
  region  = "us-central1" # 好きなリージョンを指定
}

module "vm_instance" {
  source = "../../modules/vm_instance"

  instance_name = var.instance_name
}
