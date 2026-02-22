variable "environment_name" {
  type        = string
  description = "Environment name managed by this stack."
}

variable "assurance_tier" {
  type        = string
  description = "Assurance tier inherited from the parent orchestrator."
}

variable "vcs_integration_id" {
  type        = string
  description = "VCS integration ID for module registry resources."
}

variable "naming_org" {
  type        = string
  default     = "sl"
  description = "Organization token used by the naming convention."
}

variable "naming_domain" {
  type        = string
  default     = "mgmt"
  description = "Domain token used by the naming convention."
}

variable "naming_function_env_root_space" {
  type        = string
  default     = "env-root-space"
  description = "Function token for top-level environment root spaces."
}

variable "modules_parent_space_name" {
  type        = string
  default     = "modules"
  description = "Parent modules space name created by platform-spaces."
}

variable "admin_context_name" {
  type        = string
  default     = "global-context"
  description = "Context name expected by the module factory."
}

variable "enforce_lowercase_module_names" {
  type        = bool
  default     = true
  description = "When true, module names in manifests/*.json must be lowercase."
}
