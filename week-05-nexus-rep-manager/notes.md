# Week 05 — Artifact Repository Manager (Nexus)

## 1 — Introduction to Artifact Repository Managers

### Key concepts

- Artifact: a binary output produced by a build tool, such as a JAR, WAR, ZIP, TAR, npm package, Docker image, NuGet package, or Python wheel.
- Artifact repository: a service that stores, indexes, and serves artifacts for build tools and deployment processes.
- Repository manager: software that hosts and manages repositories, for example Sonatype Nexus or JFrog Artifactory.
- Public repository: a repository hosted by a third party and used as an upstream source, such as Maven Central, npm Registry, or Docker Hub.

### Why use a repository manager

- Centralized storage for organization-owned artifacts
- Caching and proxying of public registries for better availability and performance
- Access control, auditing, and integration with corporate authentication systems such as LDAP/AD
- Cleanup, retention, and backup policies for storage management

### Typical features

- Authentication and authorization for users, roles, and tokens
- LDAP/Active Directory integration for corporate authentication
- REST API for automation and CI/CD integration
- Backup and restore of repositories and configuration
- Metadata and search across artifacts
- Cleanup policies and scheduled tasks for old snapshots
- Support for multiple formats such as Maven, npm, Docker, NuGet, PyPI, and Helm

### FAQ: What is LDAP?

LDAP (Lightweight Directory Access Protocol) is a protocol used to query and modify directory services such as user and group information. Repository managers use LDAP/AD integration to authenticate users and assign roles.

## 2 — Install and Run Nexus (Quick Guide)

### Notes about directories

- `/opt`: a common location for optional third-party applications on Linux. Installing Nexus under `/opt` keeps it separate from system-managed packages.
- `sonatype-work` (often `./sonatype-work/nexus3`): the data directory that contains configuration, blob stores, logs, and metadata for uploaded artifacts. This directory should be backed up regularly.

### Access

- Default HTTP port: `8081` (`http://<server>:8081`)
- The initial admin password is stored in `sonatype-work/nexus3/admin.password`. It should be changed at first login.

## 3 — Repository Types and Usage

- Hosted repository: stores artifacts that your organization publishes, for example internal Maven releases.
- Proxy repository: caches content from a remote registry, such as Maven Central. If an artifact is missing, Nexus fetches and caches it.
- Group repository: combines several repositories (hosted + proxy) under one URL, which is convenient for build tools.

## 4 — Publish Artifact to Repository

This is the process of sending a built artifact from a local project to a remote repository in Nexus so it can be reused by other projects or deployments.

### What I did

- Created a Nexus user with permissions to publish artifacts
- Configured local Maven and Gradle projects to use Nexus as a remote artifact repository
- Set repository URLs and credentials for Maven and Gradle
- Built the projects locally
- Published the artifacts to Nexus using Maven and Gradle commands
- Verified that the artifacts appeared in the appropriate Nexus repository

### Maven

- `mvn package` — build the artifact locally
- `mvn deploy` — build the artifact and upload it to the remote repository
- `pom.xml` — project build configuration and repository settings
- `~/.m2/settings.xml` — local Maven credentials and repository configuration

### Gradle

- `gradle build` — build the artifact locally
- `gradle publish` — upload the artifact to the remote repository using the publishing plugin
- `build.gradle` — Gradle build and publishing configuration
- `gradle.properties` — local credentials and repository settings

### Repository examples

- `maven-snapshots` — used for development or snapshot versions ending in `-SNAPSHOT`
- `maven-releases` — used for stable release versions

### Important notes

- Credentials should not be hardcoded in scripts or committed to Git
- Use a dedicated Nexus user with the minimum required permissions
- In production, Nexus should be protected with HTTPS and proper access control

## 5 — Nexus REST API

The Nexus REST API allows users and automation tools to interact with Nexus without using the web UI.

The UI is suitable for manual work, while the REST API is useful for scripts, CI/CD pipelines, and automation.

### Example: List components in a repository

```bash
curl -u "$NEXUS_USER:$NEXUS_PASS" -X GET 'http://<NEXUS_HOST>:8081/service/rest/v1/components?repository=maven-snapshots' | jq
```

### Important response fields

- `items` — list of components returned by Nexus
- `repository` — repository where the component is stored
- `format` — artifact format, for example `maven2`
- `group`, `name`, `version` — component coordinates
- `assets` — actual files belonging to the component
- `downloadUrl` — URL used to download an asset
- `continuationToken` — pagination token for the next page of results

## 6 — Important Concepts

- Nexus UI is mainly for manual operations
- Nexus REST API is for automation
- CI/CD pipelines can use the REST API to search, upload, download, or delete artifacts
- Credentials should never be hardcoded or committed to Git
- In real environments, it is better to use a dedicated Nexus user with the minimum required permissions instead of the admin account
- Public access to Nexus should be restricted; in production, Nexus should use HTTPS and proper access control

## 7 — Blob Store

1. A blob store is the physical storage backend for repository files.
2. Repositories use blob stores to store artifacts, metadata, checksums, and indexes.
3. A blob store can be file-based/local or cloud-based, for example AWS S3.
4. If Nexus runs on AWS EC2, an S3 blob store can be a good production option.
5. For best performance, a cloud blob store should be in the same region as Nexus.
6. The blob store choice should be planned early.
7. Storage can grow quickly, so cleanup policies and scheduled tasks are important.

## 8 — Components and Assets

- Component: the logical unit being uploaded, such as a package version
- Asset: the actual physical file or package stored in Nexus
- One component can have one or more assets

### Example

- Docker images use assets such as layers
- Two Docker images can be two components but can share the same underlying assets

The term “component” refers to any type or format of artifact stored in Nexus.
