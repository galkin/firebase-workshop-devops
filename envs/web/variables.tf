variable "shared_project_id" {
  type        = string
  description = "Google Cloud Project id for Shared resources"
  default     = "galkin-firebase-shared"
}

variable "region" {
  type        = string
  description = "Google Cloud Region"
  default     = "us-west2"
}

variable "envs" {
  type = map(
    object(
      {
        project_id = string,
        domain     = string,
        zone       = string,
      }
    )
  )

  description = "Domain and zone per environment"
  default = {
    "dev" = {
      project_id = "galkin-firebase-dev"
      domain     = "dev.node.courses"
      zone       = "node-courses"
    }
    "beta" = {
      project_id = "galkin-firebase-beta"
      domain     = "beta.node.courses"
      zone       = "node-courses"
    }
    "prod" = {
      project_id = "galkin-firebase-prod"
      domain     = "node.courses"
      zone       = "node-courses"
    }
  }
}
