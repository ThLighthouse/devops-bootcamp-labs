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


### Intro to Pipeline job

- Suitable for CI/CD
- Scripting - Pipeline as code

As I have understood, pipeline job is more convenient regarding to the freestyle job. Pipeline job has such advantages as:

- non UI configuration
- one job with its stages
- no need to download plugins for each job
- write pipeline as a code(groovy script)

For that we use file called `Jenkinsfile` which is writtten in `Groovy` Programming Language.
Jenkinsfile could be written in a `Scripted` pipeline or in a `Declarative` pipeline.

## Scripted pipeline

- First syntax
- Groovy engine
- Advanced scritping capabalities, high flexibility
- Difficult to start

```
node {
    /// groovy script
}
```

## Declarative pipeline

- More recent addition
- Easier to get started, but not that powerful
- Pre-defined structure

```
pipeline {
    agent any
    stages {
        stage("build") {
            steps {

            }
        }
    }
}
```

- "pipeline" must be top-level
- "agent" where to execute
- "stages" where the work happens
- "steps" execute some scripts/commands

Relevant for Jenkins cluster


### Jenkinsfile Syntax

`Post` attribute in Jenkinsfile. Executes some kind of logic/scripts after all stages are done. Inside the post there are different conditions:

- `always` - this logic/script will be executed after all stages no matter what
- `success` - execute when logic/script executed only when stages succeed.
- `failure` - execute when stages failed.

`Tools` attribute in Jenkinsfile. Access Build Tools for your projects. Maven, Gradle, jdk.

```
tools {
    maven "maven-3.9"
}
```
Build Tools Have to be pre-installed in Jenkins job configuration.

Define `Conditionals` for each stages. You could define `when` expressions inside some steps. And this step will be executed when conditions are met.

```
stage("test") {
    when {
        expression {
            env.BRANCH_NAME == 'dev' && CODE_CHANGES == true   ###Need to define at the beginning 
        }
    }
    steps {
        echo "building the application..."
    }
}
```

`Environment Variables` Jenkins provides some environmetal variables out of the box. So we can use them. We can find these variables in `"Jenkins_URL:Port/env-vars.html`.
Also we can define our own environmental variables.
Attribute called `environment`.

```
environment {
    NEW_VERSION = '1.3.0`
}
```
Can be used as usually with double "" quotes. It makes groovy identify our environment variable. 

Using `Credentials` in Jenkinsfile

- Define Credentials in Jenkins GUI (will be covered in more detail soon)
- "credentials("credentials")" binds the credentials to your env variable

```
SERVER_CREDENTIALS = credentials('') ### For that we need the "Credentials Binding" and "Credentials Plugin" plugins.
```
as a paramater it takes the ID reference of the credentials in Jenkins.

`Parameters` in Jenkinsfile.
```
parameters {
    string(name: 'VERSION`, defaultValue: '', description: 'version to deploy on prod')
    choice(name: 'VERSION', choices: ['1.1.0', '1.2.0', '1.3.0'], description: '')
    booleanParam(name: 'executeTests', defaultValue: true, description: '')
}
```
These parameters can useb in any stages:


```
stage("test") {
    when {
        expression {
            params.executeTests
        }
    }
    steps {
        echo 'testing the application...'
    }
}
```

## Using external scripts 
Do not understand how to use them.

### Input parameter in Jenkinsfile

Input parameter allows user to choose which option should be applied to some build steps.

```
stage("deploy") {
    input{
        message "Select the environment to deploy to"
        ok "Environment selected"
        parameters{
            choice(name: 'ENV', choices: ['dev', 'staging', 'prod'], description: '')
        }
    }
    steps {
        script{
            gv.deployApp()
            echo "Deploying to ${ENV}"
        }
    }
}
```