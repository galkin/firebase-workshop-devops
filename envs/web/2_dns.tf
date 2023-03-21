data "google_dns_managed_zone" "zone" {
  name    = var.envs[local.env].zone
  project = var.shared_project_id
}

resource "google_dns_record_set" "app" {
  project = var.shared_project_id

  name         = "${var.envs[local.env].domain}."
  type         = "A"
  ttl          = 300
  managed_zone = data.google_dns_managed_zone.zone.name
  rrdatas      = ["199.36.158.100"]
}
