
#Service Account creation
resource "google_service_account" "custom" {
  account_id   = "var.service_account"
  display_name = "Custom SA for Dev VM Instance"
}

#GCP VM instanec creation
resource "google_compute_instance" "dev-instance" {
  name         = "${var.environment}-instance"
  machine_type = "var.machine_type"
  zone         = "var.zone"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        label_1 = "Dev-vm-label"
      }
    }
  }

  /* // Local SSD disk
  scratch_disk {
    interface = "NVME"
  } */

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  /* metadata = {
    foo = "bar"
  } */

  metadata = {
    startup-script = <<EOF
    #! /bin/bash
    apt update -y
    apt -y install apache2
    cat <<EOT > /var/www/html/index.html
    <html><body><p>Linux startup script added directly.</p></body></html>
    EOT
    EOF
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.custom.email
    scopes = ["cloud-platform"]
  }
}