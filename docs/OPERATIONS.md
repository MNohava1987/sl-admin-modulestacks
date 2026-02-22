# Module Registry Operations

This guide covers operation of `sl-admin-modulestacks` Tier-3 registry management.

## Managing Module Definitions

Module definitions are JSON files in `manifests/`.

Required fields per file:
- `name`
- `terraform_provider`
- `repository`

Validation rules:
- Names must be unique (case-insensitive).
- Names are lowercase by default.

## Update Flow

1. Add or edit JSON files in `manifests/`.
2. Run `./scripts/assurance-gate.sh`.
3. Run local preview or plan in Spacelift.
4. Apply after review.

## Dependency Note

This stack expects modules parent space from platform-spaces:
- `root/sl-<env>-mgmt-env-root-space/modules`
