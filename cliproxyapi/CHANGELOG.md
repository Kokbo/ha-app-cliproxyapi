# Changelog

## 0.3.13

- Update CLIProxyAPI to [v8.1.6](https://github.com/router-for-me/CLIProxyAPI/releases/tag/v8.1.6) ([changes since v8.1.3](https://github.com/router-for-me/CLIProxyAPI/compare/v8.1.3...v8.1.6)).

## 0.3.12

- Update CLIProxyAPI to [v8.1.3](https://github.com/router-for-me/CLIProxyAPI/releases/tag/v8.1.3) ([changes since v8.1.2](https://github.com/router-for-me/CLIProxyAPI/compare/v8.1.2...v8.1.3)).

## 0.3.11

- Update CLIProxyAPI to [v8.1.2](https://github.com/router-for-me/CLIProxyAPI/releases/tag/v8.1.2) ([changes since v8.1.1](https://github.com/router-for-me/CLIProxyAPI/compare/v8.1.1...v8.1.2)).

## 0.3.10

- Upgrade the Alpine packages from the base image at build time (`apk upgrade`), picking up security fixes for openssl, krb5 and libxml2 that the base image release predates.

## 0.3.9

- Update golang Docker tag to v1.27 ([#12](https://github.com/Kokbo/ha-app-cliproxyapi/pull/12)).

## 0.3.8

- Update the Home Assistant base image to `ghcr.io/home-assistant/base:3.24`
  ([#10](https://github.com/Kokbo/ha-app-cliproxyapi/pull/10)) and the
  Dockerfile syntax to 1.29
  ([#9](https://github.com/Kokbo/ha-app-cliproxyapi/pull/9)). Both were merged
  without a version bump, so installed add-ons had not been rebuilt with them.
- Dependency updates from Renovate now bump the add-on version automatically.

## 0.3.7

- Update CLIProxyAPI to [v8.1.1](https://github.com/router-for-me/CLIProxyAPI/releases/tag/v8.1.1) ([changes since v8.1.0](https://github.com/router-for-me/CLIProxyAPI/compare/v8.1.0...v8.1.1)).

## 0.3.6

- Update CLIProxyAPI to [v8.1.0](https://github.com/router-for-me/CLIProxyAPI/releases/tag/v8.1.0) ([changes since v8.0.80](https://github.com/router-for-me/CLIProxyAPI/compare/v8.0.80...v8.1.0)).

## 0.3.5

- Update CLIProxyAPI to [v8.0.80](https://github.com/router-for-me/CLIProxyAPI/releases/tag/v8.0.80) ([changes since v8.0.79](https://github.com/router-for-me/CLIProxyAPI/compare/v8.0.79...v8.0.80)).

## 0.3.4

- Drop `armv7`: Home Assistant no longer supports it (since 2025.12) and the
  new multi-platform base images don't include it. aarch64 and amd64 are
  unchanged.
- Move the base image from the deprecated `build.yaml` into the Dockerfile
  (`ghcr.io/home-assistant/base:3.22`, the multi-platform form of the same
  image).
- Full documentation moved from `README.md` to `DOCS.md`, so it shows on the
  app's Documentation tab; `README.md` is now a short store introduction.
- Add a translation for the port description.
- `url` and `repository.yaml` now point to this repository instead of upstream.

## 0.3.3

- Update CLIProxyAPI to [v8.0.79](https://github.com/router-for-me/CLIProxyAPI/releases/tag/v8.0.79) ([changes since v8.0.4](https://github.com/router-for-me/CLIProxyAPI/compare/v8.0.4...v8.0.79)).

## 0.3.2

- Replace the obsolete `watchdog` option with a Docker `HEALTHCHECK` on `/healthz`.
- Drop the redundant `boot: auto` option.
- Upstream CLIProxyAPI releases now arrive automatically, tested in CI first.

## 0.3.1

- Promote upstream's web management panel as the primary provider login flow.

## 0.3.0

- Pin CLIProxyAPI to [v8.0.4](https://github.com/router-for-me/CLIProxyAPI/releases/tag/v8.0.4).
- Generate a random API key on first boot.
- Only allow the HA ingress proxy to reach the ttyd auth shell.

## 0.2.3

- Build CLIProxyAPI from upstream `main`.

## 0.2.2

- Update CLIProxyAPI to v7.1.22.

## 0.2.1

- Fix `*-login` commands not found in the auth shell.

## 0.2.0

- Add an in-add-on ttyd auth shell for OAuth bootstrap.

## 0.1.1

- Fix `BUILD_FROM` ARG scope, rename the example config, drop deprecated build args.

## 0.1.0

- Initial release.
