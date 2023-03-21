locals {
  env        = terraform.workspace
  project_id = var.envs[local.env].project_id
}
