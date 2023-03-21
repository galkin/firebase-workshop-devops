resource "google_dns_managed_zone" "zone" {
  name        = replace(var.domain, ".", "-")
  dns_name    = "${var.domain}."
}
