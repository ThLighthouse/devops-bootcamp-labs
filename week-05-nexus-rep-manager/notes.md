# Week 05 — Artifact Repository Manager (Nexus)

## 1 — Intro to Artifact Repository Managers

Key concepts

- Artifacts: binary outputs produced by build tools that package an application or library into distributable files. Common formats: `JAR`, `WAR`, `ZIP`, `TAR`, `NPM` packages, Docker images, NuGet packages, Python wheels.
- Artifact repository: a service that stores, indexes and serves artifacts to build tools and deployment processes. It understands repository formats (Maven, npm, Docker, etc.).
- Repository managers: software that hosts and manages repositories — examples: Sonatype Nexus, JFrog Artifactory.
- Public repositories: hosted by third parties and used as upstream (e.g., Maven Central, npm registry, Docker Hub).

Why use a repository manager

- Centralized storage for organization-owned artifacts.
- Caching/proxying of public registries (improves availability and performance).
- Access control, auditing and integration with corporate auth (LDAP/AD).
- Cleanup, retention and backup policies to manage disk usage.

Features (typical)

- Authentication and authorization (users, roles, tokens).
- LDAP / Active Directory integration for corporate authentication.
- REST API for automation and CI/CD integration.
- Backup and restore of repositories and configuration.
- Metadata and search across artifacts.
- Cleanup policies and scheduled tasks to remove old snapshots.
- Support for multiple formats: Maven, npm, Docker, NuGet, PyPI, Helm, etc.

FAQ: What is LDAP?

LDAP (Lightweight Directory Access Protocol) is a protocol used to query and modify directory services (like user and group information). Repository managers integrate with LDAP/AD to authenticate users and map groups/roles.

## 2 — Install and run Nexus (quick guide)

Notes about directories

- `/opt`: common location for optional third-party applications on Linux. Installing Nexus under `/opt` signals it's a packaged 3rd-party application and keeps it separate from system-managed packages.
- `sonatype-work` (often `./sonatype-work/nexus3`): the data directory that contains configuration, blob stores, logs, and uploaded artifacts metadata. Back this up — it contains runtime state.


Access

- Default HTTP port: `8081` (http://<server>:8081)
- Initial admin password is stored in `sonatype-work/nexus3/admin.password` — change it at first login.

## 3 — Repository types and usage

- Hosted repository: stores artifacts that your organization publishes (e.g., internal Maven releases).
- Proxy repository: caches content from a remote registry (e.g., Maven Central). Requests go to Nexus — if artifact missing, Nexus fetches and caches it.
- Group repository: aggregates multiple repositories (hosted + proxy) under a single URL; useful as a single endpoint for build tools.
