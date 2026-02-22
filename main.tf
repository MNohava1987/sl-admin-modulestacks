# High Assurance Module Registry Management
# This stack calls the m-orch factory to dynamically manage modules.

# Resolve the modules parent space created by platform-spaces.
data "spacelift_space_by_path" "modules_parent" {
  space_path = "root/${local.env_root_space_name}/${var.modules_parent_space_name}"
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
  default_space_id   = data.spacelift_space_by_path.modules_parent.id
  admin_context_name = var.admin_context_name
}
