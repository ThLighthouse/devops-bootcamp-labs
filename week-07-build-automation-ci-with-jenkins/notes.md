### Build Automation & CI/CD with Jenkins

### Intro to Build Automation

With automation we do not need to do all of the steps manually.
Developer pushes code -> to the git repository -> code should be tested and build(automatically)

It also should be in a dedicated server. Test envoronment prepared, Docker credentials configured and all the necessary tools installed, trigger build automatically.

Test Code -> Build Application -> Push to Repository -> Deploy to Server
There are several tools to automate that flow, including `Jenkins`.

Jenkins 
- a software that you install on a dedicated server
- has UI for configuration
- install all the tools you need (Docker, Grade/Maven/npm, etc.)
- configure the tasks (run tests, build app, deployment, etc.)
- configure the automatic trigger of the workflow

### How does Jenkins work and what can we do?

- Run tests
- Build artifacts
- Publish artifacts
- Deploy artifacts
- Send notifications

Needs to integrate with many other tools, cause Jenkins is kind of a middleman between tools. Because of it Jenkins has many plugins.

Code hosted on Gitlab -> Java App with Grade -> Build Docker Images -> push to Nexus Repo -> Deploy to AWS EC2
Plugins help you to execute each of those steps automatically.

Run tests -> Build tools need to be available
- With build tools you execute the test commands: npm test, gradlew test, mvn test, ...
- Configure test environment (e.g. test database)

Build Application -> Build tools or Docker available
- With Docker you execute Docker commands: docker build, ...
- With build tools you execute build cmds: npm package, gradlew build, ...

Publish Docker Image -> Store Credentials in Jenkins
- To authenticate to a Docker Repository

Jenkins User must have access to all these technologies and platforms.
- Install Jenkins and prepare everything
- Setup needs to be done only once
- Plugins, credentials etc. can be user for different projects.