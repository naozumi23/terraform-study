resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
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
