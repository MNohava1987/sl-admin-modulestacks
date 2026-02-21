# Spacelift Module Registry Manager

This repository is responsible for the lifecycle of all Spacelift Modules in the account. It uses a manifest-driven approach to dynamically register and configure modules in the registry.

## Overview

The Registry Manager performs the following:
1. **Manifest Processing**: Reads JSON manifests from the `manifests/` directory.
2. **Module Factory**: Calls the `terraform-spacelift-m-orch` engine to create `spacelift_module` resources.
3. **Consistency Enforcement**: Ensures all modules follow organizational standards for naming, labeling, and testing.

## How to Add a New Module

1. Create a new JSON file in `manifests/`:
   ```json
   {
     "name": "terraform-azure-network",
     "repository": "sl-modules-azure",
     "terraform_provider": "azure"
   }
   ```
2. Commit and push.
3. The `admin-modulestacks` stack will detect the change and register the new module.

## Repository Structure

```text
.
├── .spacelift/          # Quality gates
├── manifests/           # JSON definitions for each module
├── config/              # Global defaults and platform overrides
├── main.tf              # Calls the m-orch factory
├── variables.tf         # Input definitions
└── versions.tf          # Version constraints
```
