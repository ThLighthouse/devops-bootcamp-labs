# Week 03 - Databases, Build Tools, and Package Manager Tools

## 1. Databases

### Key concepts
- CRUD — Create, Read, Update, Delete.
- Developers may use a local database for development, or a remote database for shared access.
- Ideally, use a local database for experimentation and a remote database for team environments.
- Database connection details and credentials should not be hard-coded.
- Use environment variables to store endpoints, usernames, and passwords.
- Different environments (`dev`, `test`, `prod`) should use separate database configurations.

### Database types
- Key-Value Databases
  - Redis, Memcached, etcd
  - Very fast, often in-memory storage
  - Best for caching, sessions, simple lookups
- Wide-Column Databases
  - Cassandra, Apache HBase
  - Scalable, suitable for time-series and analytics data
- Document Databases
  - MongoDB, DynamoDB, CouchDB
  - Store semi-structured data without strict schema
  - Good for content management, mobile apps, and flexible data models
- Relational Databases
  - PostgreSQL, MySQL
  - Use schemas, tables, and SQL
  - Support ACID transactions
  - Common for structured application data
- Graph Databases
  - Represent connected entities
  - Useful for social graphs, recommendations, and traversal queries
- Search Databases
  - Designed for text search and indexing large volumes of documents
  - Example: Elasticsearch

### What DevOps should know
- How to configure database connections securely
- How to deploy and manage database services
- How to separate database settings by environment

### Question
- Как практиковаться и освоить работу с базами данных?
  - Начать с изучения SQL и простых локальных экземпляров PostgreSQL или MySQL.
  - Поработать с Docker-контейнерами и понять, как настраивать подключения, бэкапы и доступ.

---

## 2. Build Tools and Package Manager Tools

### Commands
- `mvn install` — run Maven lifecycle: compile, test, package, and install artifact to local repository.
- `gradle build` — run Gradle build tasks and generate artifacts.
- `npm install` — install dependencies from `package.json`.
- `npm start` — start application if defined in `package.json` scripts.
- `npm test` — run tests if defined in `package.json` scripts.
- `npm publish` — publish a package to npm registry.

### Key concepts
- Source code is not usually the final deployable artifact.
- Typical pipeline:
  1. install dependencies
  2. test the app
  3. build/package the app
  4. create an artifact
  5. publish the artifact
  6. deploy/run it
- A Docker image is a deployable artifact that can contain application code and dependencies.
- Build tools help create artifacts and automate packaging steps.

### Package manager notes
- JavaScript: `package.json`, `package-lock.json`
- Java: `pom.xml`, `build.gradle`
- Python: `requirements.txt`, `pyproject.toml`

### Patterns
- Dependency file describes packages and versions.
- A repository stores libraries and modules.
- Command-line tools provide build, test, and packaging commands.
- Package managers install and update dependencies.

### How to choose packages
- Read the official documentation.
- Check popularity and maintenance.
- Evaluate security and license.
- Verify compatibility with your project.

### Build tools and Docker
- Docker simplifies deployment by packaging application and dependencies together.
- The container image becomes the artifact that moves between environments.
- You still need to build the application before creating the Docker image.

### Notes
- Build tools are important for DevOps because they standardize the delivery process.
- DevOps engineers use build automation to produce consistent artifacts for CI/CD pipelines.

