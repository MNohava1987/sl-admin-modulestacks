# High Assurance Module Registry Management
# This stack calls the m-orch factory to dynamically manage modules.

data "spacelift_space_by_path" "admin" {
  space_path = "root/Admin"
}

# The Module Factory
module "spacelift_registry" {
  source = "git::https://github.com/MNohava1987/terraform-spacelift-m-orch.git?ref=main"

  # VCS Configuration
  vcs_provider       = "GITHUB"
  vcs_integration_id = var.vcs_integration_id

  # Paths
  manifest_dir   = "${path.module}/manifests"
  defaults_file  = "${path.module}/config/_defaults.json"
  overrides_file = "${path.module}/config/_overrides.json"

  # Hierarchy
  default_space_id   = data.spacelift_space_by_path.admin.id
  admin_context_name = "global-context" # Ensure this context exists
}
