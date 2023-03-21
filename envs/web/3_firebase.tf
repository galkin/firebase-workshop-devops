# see https://stackoverflow.com/questions/67808112/trying-to-enable-firebase-for-an-existing-gcp-project
# terraform import google_firebase_project.firebase <project>
resource "google_firebase_project" "firebase" {
  provider = google-beta
  project  = local.project_id
}

resource "google_firebase_project_location" "firebase" {
  provider = google-beta
  project  = google_firebase_project.firebase.project

  location_id = var.region
}

resource "google_firebase_web_app" "web" {
  provider     = google-beta
  project      = local.project_id
  display_name = "Firebase Workshop ${title(local.env)}"

  depends_on = [google_firebase_project.firebase]
}

resource "google_firebase_hosting_site" "app" {
  provider = google-beta
  project  = local.project_id
  site_id  = local.project_id
  app_id   = google_firebase_web_app.web.app_id
}

resource "google_firestore_database" "database" {
  project     = local.project_id
  name        = "(default)"
  location_id = var.region
  type        = "FIRESTORE_NATIVE"
}
