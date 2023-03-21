resource "google_identity_platform_config" "default" {
  autodelete_anonymous_users = false
}

resource "google_identity_platform_project_default_config" "default" {
  project = local.project_id
  sign_in {
    allow_duplicate_emails = false

    email {
      enabled           = true
      password_required = true
    }
  }
}

resource "google_identity_platform_default_supported_idp_config" "google" {
  enabled       = true
  idp_id        = "google.com"
  client_id     = "auto-generated after manual click in console and import"
  client_secret = "auto-generated after manual click in console and import"

  # use terraform import google_identity_platform_default_supported_idp_config.google google.com
  lifecycle {
    ignore_changes = [
      client_id,
      client_secret
    ]
  }
}
