data "google_project" "project" {
  project_id = var.project_id
}


module "project_services" {
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  version = "14.1.0"

  project_id = var.project_id

  activate_apis = [
    "iam.googleapis.com",
    "cloudbilling.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "dns.googleapis.com",
    "secretmanager.googleapis.com",
  ]
}
