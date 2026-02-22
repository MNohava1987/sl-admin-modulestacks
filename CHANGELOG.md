# Changelog

All notable changes to the Spacelift Module Registry Manager will be documented in this file.

## [1.2.0] - 2026-02-22
### Changed
- Marked repository as deprecated.
- Active module manager orchestration moved to `sl-admin-modulespaces`.

## [1.1.0] - 2026-02-22
### Added
- Manifest contract checks in `checks.tf` for JSON decode, required fields, uniqueness, and lowercase policy.
- Safe manifest parsing and path derivation in `locals.tf`.
- Assurance scripts:
  - `scripts/validate-contract.sh`
  - `scripts/assurance-gate.sh`
- Operations guide in `docs/OPERATIONS.md`.

### Changed
- Environment path resolution now follows canonical naming (`sl-<env>-mgmt-env-root-space`).
- `.spacelift/config.yml` now runs assurance gate before plan.
- README updated to match platform documentation standards.

### Fixed
- Removed hardcoded global `root/Admin` pathing.
- Replaced inline context note with configurable `admin_context_name` variable.

## [1.0.0] - 2026-02-20
### Added
- Initial module registry manager implementation using `terraform-spacelift-m-orch`.
