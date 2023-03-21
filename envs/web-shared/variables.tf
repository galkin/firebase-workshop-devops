variable "project_id" {
  type        = string
  description = "Google Cloud Project id"
  default     = "galkin-firebase-shared"
}

variable "region" {
  type        = string
  description = "Google Cloud Region"
  default     = "us-west2"
}

variable "domain" {
  type        = string
  description = "Domain name"
  default     = "node.courses"
}
