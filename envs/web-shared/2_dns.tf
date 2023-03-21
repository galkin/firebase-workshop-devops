resource "google_dns_managed_zone" "zone" {
  name        = replace(var.domain, ".", "-")
  dns_name    = "${var.domain}."
}

resource "google_dns_record_set" "firebase" {
  name    = "${var.domain}."
  managed_zone = google_dns_managed_zone.zone.name
  type    = "TXT"
  ttl     = 300

  // @todo: move to variables, because it is domain specific 
  rrdatas = ["google-site-verification=QOH-Uym5jZhSc6COf9AjtQEjXDfYpZBrrMp26V-i-_Y"]
}
