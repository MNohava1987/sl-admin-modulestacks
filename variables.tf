variable "spacelift_api_key_id" {
  type      = string
  sensitive = true
}

variable "spacelift_api_key_secret" {
  type      = string
  sensitive = true
}

variable "vcs_integration_id" {
  type        = string
  description = "GitHub VCS integration id"
}

variable "admin_space_id" {
  type        = string
  description = "Parent Admin Space ID"
}
