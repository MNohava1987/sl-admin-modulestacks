locals {
  # Load module manifests from JSON files.
  manifest_files = fileset("${path.module}/manifests", "*.json")

  manifests = {
    for f in local.manifest_files : f => try(jsondecode(file("${path.module}/manifests/${f}")), null)
  }

  module_names       = [for _, m in local.manifests : try(m.name, "")]
  module_names_lower = [for n in local.module_names : lower(n)]

  modules_with_provider = [
    for _, m in local.manifests : m
    if m != null && try(m.name, "") != "" && try(m.terraform_provider, "") != ""
  ]

  env_root_space_name = "${var.naming_org}-${lower(var.environment_name)}-${var.naming_domain}-${var.naming_function_env_root_space}"
}
