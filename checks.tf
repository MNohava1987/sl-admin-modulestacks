# --- Manifest Contracts ---

check "manifest_files_exist" {
  assert {
    condition     = length(local.manifest_files) > 0
    error_message = "No module manifest JSON files found in manifests/."
  }
}

check "manifest_files_decode" {
  assert {
    condition     = alltrue([for _, m in local.manifests : m != null])
    error_message = "One or more manifest JSON files could not be decoded."
  }
}

check "module_names_present" {
  assert {
    condition     = alltrue([for _, m in local.manifests : try(m.name, "") != ""])
    error_message = "Each module manifest must include a non-empty 'name'."
  }
}

check "module_provider_present" {
  assert {
    condition     = alltrue([for _, m in local.manifests : try(m.terraform_provider, "") != ""])
    error_message = "Each module manifest must include a non-empty 'terraform_provider'."
  }
}

check "module_repository_present" {
  assert {
    condition     = alltrue([for _, m in local.manifests : try(m.repository, "") != ""])
    error_message = "Each module manifest must include a non-empty 'repository'."
  }
}

check "module_names_unique_case_insensitive" {
  assert {
    condition     = length(distinct(local.module_names_lower)) == length(local.module_names_lower)
    error_message = "Module names must be unique (case-insensitive)."
  }
}

check "module_names_lowercase" {
  assert {
    condition     = !var.enforce_lowercase_module_names || alltrue([for n in local.module_names : n == lower(n)])
    error_message = "One or more module names contain uppercase characters."
  }
}

check "destructive_changes_require_repave_mode" {
  assert {
    condition     = var.enable_deletion_protection || var.repave_mode
    error_message = "Disabling deletion protection requires repave_mode=true for explicit operator intent."
  }
}
