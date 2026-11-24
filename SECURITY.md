# Security policy

## Reporting a vulnerability

Please report vulnerabilities **privately** through GitHub:
[Report a vulnerability](https://github.com/Kokbo/ha-app-cliproxyapi/security/advisories/new)
(Security tab → "Report a vulnerability"). Don't open a public issue.

Include what you found, how to reproduce it, and which add-on version you
run. You'll get an answer as soon as possible; fixes ship as a new add-on
version, which Home Assistant offers as an update.

## Scope

- **This repository:** the add-on wrapper — Dockerfile, s6 services, the
  ingress auth shell (ttyd/nginx), the helper scripts and the workflows.
- **CLIProxyAPI itself:** report to the upstream project,
  [router-for-me/CLIProxyAPI](https://github.com/router-for-me/CLIProxyAPI).
  The add-on picks up upstream fixes automatically within a day of their
  release.

## Supported versions

Only the latest add-on version is supported.
