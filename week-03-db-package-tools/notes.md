Week - 3. Databases, Build Tools and Package Manager Tools

1. Databases

### Commands


### Key concepts
CRUD - Create, Read, Update, Delete.
Database in software development process.

Option 1: Developers need database for local development. Each developer installs mysql DB locally and each developer has own DB with own test data.

Option 2: DB hosted remotely(no need for local installation | start coding right away).
Cannot play around without affecting others.
Ideal solution: have both.

How to configure db connection?
Each programming languages has a library/modules for DB connection. You have to tell the library, WHICH DBtalk to and HOW to AUTHENTICATE with that DB. DB endpoint adn credentials should not be hard-coded. Definein 1 place as environment variables, configure from OUTSIDE.
Depending om environment (dev, test, prod), connects to different DB.

What DevOps Engineer should know about DB?
- How to configure DB
- How to setup DB
- How to manage DB

Database Types

-KeyValue Databases:
 *REDIS*
 *Memcached*
 *etcd from Kubernetes*
Unique Key
This Databases are very fast! Store all data in memory, unlike pn the hardrive.
no primary DB, no joins. Best for CACHING. Sometimes used as message queue.

-Wide Column Databases:
 *Cassandra*
 *apache hbase*
Queries similiar to SQL, scalable, no joins, no primary DB.
Best for: Time Series, IoT Records, Historical-Records.

-Document Databases:
 *MongoDB*
 *DynamoDB*
 *CouchDB*
Unstructured data, no joins, slower writes, but faster to read data.
Best for: Mobile apps, Game apps, Content Management, Most apps.
Primary DB. 

-Relational Database:
 *PostgreSQL*
 *MySQL*
They are most used! Schema and data types need to be created first.
Structured Query Language(SQL)
ACID - Atomicity, Consistency, Isolation, Durability.
Difficult to scale.

-Graph Databases
 Directly connect entities
Best for:
Graphs, Patterns, Recommendation

-Search Databases
Search Database through massive data entries
Full text search in efficient and fast way.
Creates index of words.
### Questions
How to practice and how master DB skills now?


----------------------------------------------------------------------


2. Build Tools and Package Manager Tools

### Commands
mvn install(maven) - runs Maven build lifecycle: validates, compiles, tests, packages the application and installs the built artifact into the local Maven repository.
gradle build(gradle) - runs Gradle build tasks: compiles code, runs tests, creates artifact. Result in build/libs/ 
npm install - install dependencies that are defined in package.json file.
package.json is similiar to pom.xml in maven and build.gradle in gradle.
In order to find libraries and modules for npm go to the NPM Repository.
npm start - start the application
npm stop - stop the app
npm test - run the tests
This commands run if they are described in scripts inside package.json file.
npm publish - publishes a package to npm registry.
build artifact --> build Docker image --> push Docker Image to registry

Source code is not the final deployable thing.

Before running/deploying an application we usually need to:
1. install dependencies
2. test the app
3. build/package the app
4. create an artifact
5. publish artifact somewhere
6. deploy/run it

Build Tools and Docker
No need to build and move different artifact types (e.g Jar,War,Zip) - Just 1 artifact type - Docker Image.
No need to install dependencies on the server - execute install command inside Docker Image. Docker Image - is an artifact and is an alternative for all other artifact types.
No need to install npm or java on the server - execute everything in the image.
However, still need to build the Apps and then build Docker Image from that.

Build Tools for DevOps:
 - Build Docker Image --> Push to Repo --> Run on Server (it all happens in build automation tool or CI/CD, for in example in Jenkins server).
 - help developers to build the app, because DevOps knows where and how the app will run. Meanwhile, developers install dependencies locally and run the app, but don't build it locally.

### Key concepts
Package application into a single movable file - artifac (compiling and compress).
Artifact file looks different for different languages.
Artifact itself is a file which includes all necessary dependencies and code itself within it to run the application.

For Javascript - npm, yarn(Package Managers, they cannot build apps).
No special artifact type
package.json file for dependencies. 
Apllication code, but not the dependencies. To run the app on the server mustneed to install dependencies first! --> Unpack zip/tar --> Run the app
Build Tool - webpack, which transpiles, minifies, bundles, compress the code.

This concept is similiar to other languages e.g python and its' package manager pip like npm. 

Patterns in all of these tools:
 -dependency file (package.json, pom.xml, build.gradle)
 -repository for dependencies (npm, maven etc)
 -command line tool (test, start app, build app, npm pack, etc)
 -package managers (gradle/maven for java, npm/yarn for JavaScript, pip for Python)  

### Questions
How to understand which packages to install for some app?
How to find necessary packages?
 
### How to know what packages are needed?

For existing projects, dependencies are defined in dependency files:
 - JavaScript: package.json, package-lock.json
 - Java: pom.xml, build.gradle
 - Python: requirements.txt, pyproject.toml

DevOps Engineer usually does not guess dependencies manually. DevOps reads project files, documentation and build instructions.

When choosing a new package, check:
 - official docs
 - popularity
 - maintenance activity
 - security
 - license
 - compatibility

