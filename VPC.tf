resource "google_compute_network" "vpc_custom_network" {
  project                                   = "var.project"
  name                                      = "${var.environment}-vpc"
  auto_create_subnetworks                   = false
  #network_firewall_policy_enforcement_order = "BEFORE_CLASSIC_FIREWALL"
}

resource "google_compute_subnetwork" "custom_subnetwork" {
  name          = "${var.region}-${var.environment}-subnetwork"
  ip_cidr_range = var.ip_range #10.2.0.0/16(example range)  - primaray ip range
  region        = "var.region"
  network       = google_compute_network.vpc_custom_network.id
  /*secondary_ip_range {
    range_name    = "tf-test-secondary-range-update1"
    ip_cidr_range = "192.168.10.0/24"
  }
  */
}
