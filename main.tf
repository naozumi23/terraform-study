terraform {
  backend "gcs" {
    bucket = "terraform-backend-001"
  }
}


provider "google" {
  project = "horse-race-project-415513"
  region  = "us-central1" # 好きなリージョンを指定
}

resource "google_compute_instance" "sample_instance" {
  name         = "example-instance3"
  machine_type = "e2-micro" # インスタンスタイプ
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11" # OSイメージ
    }
  }

  network_interface {
    network = "default"
    access_config {
      # 必要に応じて外部IPアドレスを割り当てる
    }
  }

  tags = ["http-server", "https-server"] # ファイアウォールルール用タグ
}
