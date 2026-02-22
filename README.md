# Spacelift Module Registry Manager (Tier 3) - Deprecated

This repository is retired from the active control plane.
Use `sl-admin-modulespaces` for module bucket spaces and per-bucket manager stacks.

## Purpose

Historical behavior:
1. Read JSON module definitions from `manifests/`.
2. Passed them to the module factory (`terraform-spacelift-m-orch`).
3. Enforced manifest contracts before plan/apply.

## Manifest Contracts

Each `manifests/*.json` file must include:
- `name`
- `terraform_provider`
- `repository`

Names must be unique (case-insensitive) and lowercase by default.

## Runtime Pathing

Default space is resolved using canonical environment path:
- `root/sl-<env>-mgmt-env-root-space/modules`

## Local Validation

Do not onboard new workloads to this repository.
