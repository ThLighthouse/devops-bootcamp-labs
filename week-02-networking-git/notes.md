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
git stash - temporary hide active working in purpose to change branches
git stash pop - get changes back
git revert <commit hash> - Creates a new commit to revert the old commit's changes
git reset <commit hash> - removes old commit (-hard=removes totally, soft=make changes to the stash area)
git merge - merge branches between each other

### Key concepts
For DevOps and CI/CD no need to intermediary Dev branch.

### Questions


