# WEEK 2 - Environment Variables, Networking, SSH, Git

## 1. Environment Variables

### Commands 

printenv - display all env variables 
printenv USER - dissplay specific env var
unset - delete the variable
source ~/.bashrc = Load the new env vars into the current shell session

### Key concepts
KEY=value pairs
Variables store information
Environment Variables are available for the whole environment
By convention, names are defined in UPPER CASE 
User can change these environment variables values
.bashrc - Variables set in this file are loaded whenever a bash login shell is entered (for the specific user)

/etc/environment = set global env var 

### Questions
Не совсем очевидно для чего вообще нужны переменные окружения
Ответ: Environment Variables - это настройки для программ, которые передаются извне, без изменения кода.

-------------------------------------------------------------------

## 2. Networking

### Commands 
ip a/ip addr - shows IP addresses of Network Interfaces
ip route - shows gateway
ss -tuln - active connections on PC.
nslookup/dig - get an IP address any domain
ping - checks if host is available on ICMP.
curl - checks if the service is available
nc -zv - checks port

### Key concepts
LAN - collection of devices connected together in one physical location(private house, office, campus)
Each device has a unique IP(Internet Protocol) address.
IP adddress - 32bit value.
Switch - sits within the LAN and faciliates the connection between all the devices within the LAN.
Router - sits between LAN and outside networks (WAN). Connects devices on LAN and WAN.
Allows networked devices to access the Internet.
Gateway - IP address of Router.
Subnet - logical subdivision of an IP network. Subnetting - process of dividing a network into two or more networks.
CIDR - Classless Inter-Domain Routing
NAT(Network Address Translation) - key functionality of a router.
Firewall - set of rules that prevents unauthorized access from entering a private network. Using Firewall Rulesyou can define, which requests are allowed.
DNS(Domain Name System) - translates domain names to IP addresses.
                     Root Domain
                         |
            Top Level Domain(.com, .net, .gov etc)
                         |
                      Domain
                         |
            Subdomain(bootcamp, workshops, courses)

Subdomains - used for different appliacations that belong to organization. Each application may run on its dedicated server.

example: api.mycompany.com
com - TLD
mycompany - domain
api - subdomain

How to think as DevOps Engineer

When Internet does not work or service is unavailable - DevOps Engineer thinks in categories like:

1. Is there IP? - ip a
if there is no IP address - troubles with interface/DHCP/Network

2. Gateway exists? - ip route
if there is no "default via" - means host does not know how to go outside

3. Does the Network work correctly? - ping 8.8.8.8
if doesn't - the Network/firewall issues

4. Does DNS work? - nslookup google.com/ping google.com
if ping works, but domain doesn't - issues with DNS

5. Does the service work? - curl http://localhost:3000/nc -zv localhost 3000
if server is pinging, but port doesn't open - possible issues with app itself or firewall, bind address

### Questions

No questions fot this topic


-------------------------------------------------------------------


## 3. SSH

### Commands
ssh root@server_ip
ssh-keygen -t rsa
scp(secure copy) - allows to securely copy files and directories
~/.ssh/known_hosts - list of available servers for to connect
~/.ssh/authorized - list of public keys which are allowed to connect to this user
nc -zv server_ip 22 - check if port is open to the server
ssh -v user@server_ip - connect with wide debug output

### Key concepts
2 ways to authenticate:
1) Username & Password
2) SSH Key Pair

Private Key - Secret key. Is stored securely on the client machine
Public Key - Public. Can be shared, e.g with the remote server

SSH Authentication comes AFTER the connection. (PORT 22).


### Questions


-------------------------------------------------------------------


## 4.Git

### Commands
git init - initialize repo
git clone - clone repo locally
git stash - temporarily saves uncommitted changes, so you can switch branches.
git stash pop - get changes back
git revert <commit hash> - Creates a new commit to revert the old commit's changes
git reset <commit hash> - removes old commit (--hard=removes totally, --soft=make changes to the staging area)
git merge - merge branches between each other
ssh -T git@github.com - check if ssh connection is available to the repo
git remote add origin <repo_URL> - connect local repo with remote repo.
git push -u origin main - connect local branch with remote repo branch
git rm -r --cached <file> - removes file from Git tracking, but keeps it locally. After that usually the file needs to be added to the .gitignore


### Key concepts
Merge conflict happens when Git cannot automatically combine changes for two branches, usuallybecause the lines of the same file were changed differently.
Best practice for that is pull and push often from remote repository.
Breaking changes don't affect you until you pull the new code
Every code change and file is tracked. You can revert commits.

Working                 Staging             Local               Remote
Directory               area                repo                repository
        git add ----->  
                        git commit -------->    
                                                   git push ---------->
                                                   git pull <----------

Different Git Repositories available: github & gitlab
Companies have own Git servers: Bitbucket
.git - has info about repo itself(about branches, endpoint etc)
Best practice is to create for each bugfix or feature its own branch
Many companies have main branch and dev branch. Main - ready for peoduction.
Develop branch - bugfixes and features are developing. 
For CI/CD Trunk based development is preferable. (only main)
Feature Based - Feature Driven Development with DEV branch - features and bugfixes are collected in develop branch.

Git for DevOps
1) IaC (Many K8s files, deployment to Kubernetes, Terraform and Ansible configuration files, python scripts). All files should be tracked, securely stored, shareable DevOps team
2) CI/CD Pipeline and Build Automation (checkout code, test and build application, etc.
Need intergration between the build automation tool and application git repository).
### Questions
Не понял как происходит откат по коммиту(хеш) и зачем оно нужно
Ответ:

A---B---C 
Где С-плохой коммит, в таком случае делается "git revert C" И Git не удаляет С-коммит, он создает новый коммит-D, который отменяет изменения из С.

Это безопасно для командной работы.
А для локального репозитория используется "git reset --hard/soft HEAD~<commit №>



