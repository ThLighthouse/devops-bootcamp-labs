## Cloud & IaaS Basics

In this module, I practiced deploying a Node.js application artifact to a cloud server.

### What I did

- Created a cloud server using AWS EC2 instead of a DigitalOcean droplet
- Installed Node.js and npm on the server
- Built a Node.js artifact locally
- Copied the artifact to the server using `scp`
- Extracted the archive on the server
- Installed project dependencies
- Started the application in detached mode
- Opened port `3000` in the AWS Security Group
- Accessed the application from a browser using the public EC2 IP address

### Key concepts

- IaaS provides virtual servers in the cloud
- An EC2 instance is similar to a DigitalOcean droplet
- A Security Group controls inbound and outbound traffic
- An application artifact can be copied and deployed manually
- Runtime dependencies such as Node.js and npm must be present on the server before running the app

### Commands

- `npm pack` - creates a tar archive from the project
- `scp` - securely copies files to a remote server
- `npm install` - installs dependencies for the project
- `nohup` - runs a command in detached mode